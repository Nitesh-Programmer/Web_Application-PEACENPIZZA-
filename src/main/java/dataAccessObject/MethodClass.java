package dataAccessObject;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.sql.rowset.serial.SerialBlob;

import dataTransferObject.AddToCart;
import dataTransferObject.ContactAdmin;
import dataTransferObject.Feedback;
import dataTransferObject.PlacedOrders;
import dataTransferObject.Products;
import dataTransferObject.UserDetails;

public class MethodClass 
{
	
	
	public static Connection getConnection() throws ClassNotFoundException,SQLException
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Properties property = null;
		String url = null;
		try {
			FileInputStream file=new FileInputStream("D:\\J2EE\\pizzaproject\\src\\main\\java\\dataAccessObject\\DataBase");
			property=new Properties();
			property.load(file);
			
			url=property.getProperty("dburl");
		
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		return DriverManager.getConnection(url,property);
	}

	public int newUser(UserDetails user) throws Exception
	{
		Connection conn=getConnection();
		
		String user1="user";
		PreparedStatement pstmt=conn.prepareStatement("insert into userdetails(FirstName,LastName,Email,Phno,Age,Password,Role) values(?,?,?,?,?,?,?)");

		pstmt.setString(1, user.getFirst_name());
		pstmt.setString(2, user.getLast_name());
		pstmt.setString(3,user.getEmail());
		pstmt.setLong(4, user.getPhno());
		pstmt.setInt(5, user.getAge());
		pstmt.setString(6,encrypt(user.getPassword()));
		pstmt.setString(7, user1);


		return pstmt.executeUpdate();

	}

	public UserDetails userLogin(String email,String password) throws Exception
	{
		Connection conn=getConnection();

		PreparedStatement pstmt=conn.prepareStatement("select * from userdetails where email=?");
		
		pstmt.setString(1, email);

		ResultSet rst=pstmt.executeQuery();

		UserDetails user=new UserDetails();
		

		if(rst.next())
		{
			
			if(!(decrypt(rst.getString(7))).equals(password)) 
			{
				return null;
			}
			user.setId(rst.getInt(1));
			user.setFirst_name(rst.getString(2));
			user.setLast_name(rst.getString(3));
			user.setEmail(rst.getString(4));
			user.setPhno(rst.getLong(5));
			user.setAge(rst.getInt(6));
			user.setPassword(decrypt(rst.getString(7)));
			user.setRole(rst.getString(8));
			
		}
		return user;
	}

	public int forgetPassword(String email,String password) throws ClassNotFoundException, SQLException
	{
		Connection conn=getConnection();

		PreparedStatement pstmt=conn.prepareStatement("update userdetails set password=? where email=?");
		pstmt.setString(2, email);
		pstmt.setString(1, encrypt(password));

		return pstmt.executeUpdate();
	}

	public int addProduct(Products product) throws ClassNotFoundException, SQLException
	{
		Connection conn=getConnection();

		PreparedStatement pstmt=conn.prepareStatement("insert into product(PizzaName,Description,Size,Price,Category,Image) values(?,?,?,?,?,?)");

		pstmt.setString(1, product.getPizzaName());
		pstmt.setString(2, product.getDescription());
		pstmt.setString(3, product.getSize());
		pstmt.setDouble(4, product.getPrice());
		pstmt.setString(5,product.getCategory());
		Blob img=new SerialBlob(product.getImage());
		pstmt.setBlob(6, img);

		return pstmt.executeUpdate();

	}

	public List<Products> findAll() throws ClassNotFoundException, SQLException
	{
		Connection conn=getConnection();

		PreparedStatement pstmt=conn.prepareStatement("select * from product");
		List<Products> list=new ArrayList<>();
		ResultSet rst=pstmt.executeQuery();

		while(rst.next())
		{
			Products product=new Products();

			product.setId(rst.getLong(1));
			product.setPizzaName(rst.getString(2));
			product.setDescription(rst.getString(3));
			product.setSize(rst.getString(4));
			product.setPrice(rst.getDouble(5));
			product.setCategory(rst.getString(6));
			Blob blobimg=rst.getBlob(7);
			byte[]img=blobimg.getBytes(1,(int)blobimg.length());
			product.setImage(img);

			list.add(product);

		}
		conn.close();
		return list;
	}

	public int deleteProduct(int id) throws ClassNotFoundException, SQLException
	{
		Connection conn=getConnection();

		PreparedStatement pstmt=conn.prepareStatement("delete from product where id=?");
		pstmt.setInt(1, id);

		return pstmt.executeUpdate();
	}

	public Products findById(long id) throws ClassNotFoundException, SQLException
	{
		Connection conn=getConnection();

		Products product=new Products();

		PreparedStatement pstmt=conn.prepareStatement("select * from product where id=?");
		pstmt.setLong(1, id);

		ResultSet rst=pstmt.executeQuery();
		rst.next();

		product.setId(rst.getLong(1));
		product.setPizzaName(rst.getString(2));
		product.setDescription(rst.getString(3));
		product.setSize(rst.getString(4));
		product.setPrice(rst.getDouble(5));
		product.setCategory(rst.getString(6));
		Blob img=new SerialBlob(rst.getBlob(7));
		byte[] image=img.getBytes(1, (int)img.length());
		product.setImage(image);

		return product;

	}

	public int updateProduct(Products product) throws ClassNotFoundException, SQLException
	{
		Connection conn=getConnection();

		PreparedStatement pstmt=conn.prepareStatement("update product set PizzaName=?,Description=?,size=?,Price=?,Category=?,Image=? where id=?");

		pstmt.setLong(7, product.getId());
		pstmt.setString(1, product.getPizzaName());
		pstmt.setString(2, product.getDescription());
		pstmt.setString(3, product.getSize());
		pstmt.setDouble(4, product.getPrice());
		pstmt.setString(5, product.getCategory());

		Blob img=new SerialBlob(product.getImage());
		pstmt.setBlob(6, img);

		return pstmt.executeUpdate();

	}

	public int addtoCart(AddToCart newItem) throws ClassNotFoundException, SQLException
	{
		AddToCart existing=findCart(newItem.getProductId(),newItem.getUserId());

		if(existing!=null)
		{
			
			return updateQuantity(newItem.getProductId(),newItem.getUserId(),existing.getQuantity());

		}
		else 
		{
			return insertQuantity(newItem);
		}

	}

	public AddToCart findCart(long prdId, long userId) throws ClassNotFoundException, SQLException
	{
		Connection conn=getConnection();

		PreparedStatement pstmt=conn.prepareStatement("select * from addtocart where prdId=? AND userId=?");
		pstmt.setLong(1,prdId);
		pstmt.setLong(2, userId);

		ResultSet rst=pstmt.executeQuery();

		if(rst.next())
		{
			AddToCart cart=new AddToCart();

			cart.setCartId(rst.getLong("cartId"));
			cart.setProductId(rst.getLong("prdId"));
			cart.setUserId(rst.getLong("userId"));
			
			cart.setQuantity(rst.getInt("Quantity"));
		
			if(rst.getInt("quantity")>0)
			{	
				
			}

			return cart;
		}

		return null;
	}

	public int updateQuantity(long prdId, long userId,int quantity) throws ClassNotFoundException, SQLException
	{
		Connection conn=getConnection();

		PreparedStatement pstmt=conn.prepareStatement("update addtocart set quantity=? where prdId=? AND userId=?");
		System.out.println(quantity+" hello");
		pstmt.setLong(2, prdId);
		pstmt.setLong(3, userId);
		pstmt.setInt(1, (quantity+1));

		return pstmt.executeUpdate();

	}

	public int insertQuantity(AddToCart cart) throws ClassNotFoundException, SQLException
	{
		Connection conn=getConnection();

		PreparedStatement pstmt=conn.prepareStatement("insert into addtocart(Quantity,prdId,userId) values(?,?,?)");

		pstmt.setInt(1, cart.getQuantity());
		pstmt.setLong(2, cart.getProductId());
		pstmt.setLong(3, cart.getUserId());

		return pstmt.executeUpdate();

	}

	public int removeCart(AddToCart newItem) throws ClassNotFoundException, SQLException
	{
		AddToCart existing=findCart(newItem.getProductId(),newItem.getUserId());

		if(existing!=null && newItem.getQuantity()>0)
		{
			return removeCount(newItem.getProductId(),newItem.getUserId(),newItem.getQuantity());

		}
		return 0;
	}

	public int removeCount(long prdId,long userId,int quantity) throws ClassNotFoundException, SQLException
	{
		Connection conn=getConnection();

		PreparedStatement pstmt=conn.prepareStatement("update addtocart set quantity=? where prdId=? AND userId=?");

		pstmt.setInt(1, quantity-1);
		pstmt.setLong(2, prdId);
		pstmt.setLong(3, userId);

		return pstmt.executeUpdate();
	}
	
	public List<AddToCart> listCart(long userId) throws ClassNotFoundException, SQLException
	{
		Connection conn=getConnection();
		
		PreparedStatement pstmt=conn.prepareStatement("select * from addtocart  where userId=?");
		
		pstmt.setLong(1, userId);
		
		List< AddToCart> list=new ArrayList<>();
		
		ResultSet rst=pstmt.executeQuery();
		while(rst.next())
		{
			AddToCart cart=new AddToCart();
			
			cart.setProductId(rst.getLong("prdId"));
			cart.setUserId(rst.getLong("userId"));
			cart.setQuantity(rst.getInt("Quantity"));
			
			list.add(cart);
			
		}
		
		return list;
		
	}
	

	
	public int orderFinish(long UserId) throws ClassNotFoundException, SQLException
	{
		Connection conn=getConnection();
		
		PreparedStatement pstmt=conn.prepareStatement("insert into pizzaproject.placedorders (PizzaName,Size,Price,Category,Quantity,product_price,Image,UserId,TotalPrice) \r\n"
				+ "select P.PizzaName,P.size,P.Price,P.Category,C.Quantity, C.Quantity*P.Price as product_price,P.Image,U.Id,@TotalSum as TotalPrice\r\n"
				+ "from pizzaproject.addtocart C\r\n"
				+ "join pizzaproject.product P on C.prdId=P.Id\r\n"
				+ "join pizzaproject.userdetails U on C.userId=U.Id\r\n"
				+ "where U.Id=?");
		pstmt.setLong(1, UserId);
		
		
		return pstmt.executeUpdate();
		
	}
	
	public int deleteFromCart(long userId) throws ClassNotFoundException,SQLException
	{
		
		Connection conn=getConnection();
		
		PreparedStatement pstmt=conn.prepareStatement("delete from addtocart where userId=?");
		
		pstmt.setLong(1, userId);
		
		return pstmt.executeUpdate();
		
		
	}
	
	
	public List<Products> searchProduct(String productName) throws ClassNotFoundException, SQLException
	{
		Connection conn=getConnection();
		
		PreparedStatement pstmt=conn.prepareStatement("select * from product where PizzaName like ? OR category like  ? ");
		
		pstmt.setString(1,"%"+ productName+"%");
		pstmt.setString(2,"%"+ productName+"%");
		
		
		List<Products> list=new ArrayList<>();
		
		ResultSet rst=pstmt.executeQuery();
		
		while(rst.next())
		{
			
			Products product=new Products();

			product.setId(rst.getLong(1));
			product.setPizzaName(rst.getString(2));
			product.setDescription(rst.getString(3));
			product.setSize(rst.getString(4));
			product.setPrice(rst.getDouble(5));
			product.setCategory(rst.getString(6));
			Blob blobimg=rst.getBlob(7);
			byte[]img=blobimg.getBytes(1,(int)blobimg.length());
			product.setImage(img);

			list.add(product);
		}
		
		
		return list;
		
	}
	
		
	public  String send (String to) throws AddressException, MessagingException, IOException
	{
		String otp;
		final String To=to;
	
		
		otp=generateOTP();
		
		FileInputStream file=new FileInputStream("D:\\J2EE\\pizzaproject\\src\\main\\java\\dataAccessObject\\Security");
		
		
		Properties properties= new Properties();
		
		properties.load(file);
		
		final String from=properties.getProperty("user");
		final String password=properties.getProperty("password");
		
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port","587");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		
		Session session=Session.getDefaultInstance(properties, new Authenticator() {
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication()
			{
				return new PasswordAuthentication(from, password);
			}
		});
		
		Message message=new MimeMessage(session);
		
		message.setFrom(new InternetAddress(from));
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(To));
		message.setSubject("OTP");
		message.setText("Dear user: \n This OTP is to verify your "+To+" so please don't share this with anyone. This is your OTP-->"+otp);
		
		Transport.send(message);
		
		return otp;
		
	}

	private static String generateOTP() 
	{
		Random rnd=new Random();
		int number=rnd.nextInt(999999);
		
		return String.format("%06d",number);
	}
	
	
	public List< PlacedOrders> orderHistory (long userId) throws ClassNotFoundException, SQLException
	{
		Connection conn=getConnection();
		
		PreparedStatement pstmt=conn.prepareStatement("select * from placedorders where userId=?");
		
		pstmt.setLong(1, userId);
		
		List<PlacedOrders> list=new ArrayList<>();
		
		ResultSet rst=pstmt.executeQuery();
		
		while(rst.next())
		{
			PlacedOrders orderHistory=new PlacedOrders();
			
			orderHistory.setPizza_Name(rst.getString(2));
			orderHistory.setSize(rst.getString(3));
			orderHistory.setPrice(rst.getDouble(4));
			orderHistory.setCategory(rst.getString(5));
			orderHistory.setQuantity(rst.getInt(6));
			orderHistory.setProduct_price(rst.getDouble(7));
			Blob img=new SerialBlob(rst.getBlob(9));
			byte [] image=img.getBytes(1, (int)img.length()); 
			orderHistory.setImage(image);
			orderHistory.setUserId(rst.getLong(10));
			list.add(orderHistory);
		}
		
		return list;
		
	}


	public List<UserDetails> userInfo() throws ClassNotFoundException, SQLException
	{
		
		Connection conn=getConnection();
		
		PreparedStatement pstmt=conn.prepareStatement("select * from userdetails where role='user'");
		
		ResultSet rst=pstmt.executeQuery();
		
		List<UserDetails> list=new ArrayList<>();
		
		while(rst.next())
		{
			UserDetails user=new UserDetails();
			
			user.setId(rst.getLong(1));
			user.setFirst_name(rst.getString(2));
			user.setLast_name(rst.getString(3));
			user.setEmail(rst.getString(4));
			user.setPhno(rst.getLong(5));
			user.setAge(rst.getInt(6));
			list.add(user);
		}
		
		return list;
		
	}

	 public boolean emailExist(String email) throws ClassNotFoundException, SQLException
	 {
		 Connection conn=getConnection();
		 
		 PreparedStatement pstmt=conn.prepareStatement("select Email from userdetails where email=?");
		 pstmt.setString(1, email);
		 
		 ResultSet rst=pstmt.executeQuery();
		  
		
		  
		  return  rst.next();
		
		 
	 }
	 
	 public String encrypt(String password)
	 {
		 String encrypt="";
		 
		 char[] arr=password.toCharArray();
		 
		 for(int i=0;i<arr.length;i++)
		 {
			 char ch=(char) (arr[i]+10);
			 encrypt+=ch;
		 }
		 
		return encrypt;
		 
	 }
	 public String decrypt(String encrypt)
	 {
		 String decrypt="";
		 
		 char [] arr=encrypt.toCharArray();
		 
		 for(int i=0;i<arr.length;i++)
		 {
			 char ch=(char)(arr[i]-10);
			 decrypt+=ch;
		 }
		 
		return decrypt;
		 
	 }
	     
	public  int inertFeedBack(Feedback feed) throws ClassNotFoundException, SQLException
	{
		Connection conn=getConnection();
		
		PreparedStatement pstmt=conn.prepareStatement("insert into feedback_table (userName,userMail,feedback,feedback_userId) value(?,?,?,?)");
		
		pstmt.setString(1, feed.getUserName());
		pstmt.setString(2, feed.getUserMail());
		pstmt.setString(3, feed.getFeedback());
		pstmt.setLong(4, feed.getFeed_id());
		
		return pstmt.executeUpdate();
		
	}
	
	public int insertContact(ContactAdmin contact) throws ClassNotFoundException, SQLException
	{
		Connection conn=getConnection();
		
		PreparedStatement pstmt=conn.prepareStatement("insert into contact_table(userName,userMail,Message,contact_userId)value(?,?,?,?)");
		
		pstmt.setString(1, contact.getUserName());
		pstmt.setString(2,contact.getEmail());
		pstmt.setString(3, contact.getMessage());
		pstmt.setLong(4, contact.getContact_userId());
		
		return pstmt.executeUpdate();
	}
	
	public List<Feedback> listofFeedBack() throws ClassNotFoundException, SQLException
	{
		Connection conn=getConnection();
		
		PreparedStatement pstmt=conn.prepareStatement("select * from feedback_table");
		
		ResultSet rst=pstmt.executeQuery();
		
		List<Feedback> list=new ArrayList<>();
		
		while(rst.next())
		{
			
			Feedback userFeedback=new Feedback();
			
			userFeedback.setFeed_id(rst.getInt(1));
			userFeedback.setUserName(rst.getString(2));
			userFeedback.setUserMail(rst.getString(3));
			userFeedback.setFeedback(rst.getString(4));
			userFeedback.setFeed_id(rst.getLong(5));
			list.add(userFeedback);
		}
	
		return list;
		
	}
	public List<ContactAdmin> contactAdmin() throws ClassNotFoundException, SQLException
	{
		Connection conn=getConnection();
		
		PreparedStatement pstmt=conn.prepareStatement("select * from contact_table");
		
		ResultSet rst=pstmt.executeQuery();
		
		List<ContactAdmin> list=new ArrayList<>();
		
		while(rst.next())
		{
			
			ContactAdmin userMessage=new ContactAdmin();
			
			userMessage.setContact_id(rst.getInt(1));
			userMessage.setUserName(rst.getString(2));
			userMessage.setEmail(rst.getString(3));
			userMessage.setMessage(rst.getString(4));
			userMessage.setContact_userId(rst.getLong(5));
			list.add(userMessage);
			
		}
	
		return list;
		
	}
	
	public  void replyMail (String toMail,String subject,String reply) throws AddressException, MessagingException, IOException
	{
		
		final String To=toMail;
	
		
		
		
		FileInputStream file=new FileInputStream("D:\\J2EE\\pizzaproject\\src\\main\\java\\dataAccessObject\\Security");
		
		
		Properties properties= new Properties();
		
		properties.load(file);
		
		final String from=properties.getProperty("user");
		final String password=properties.getProperty("password");
		
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port","587");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		
		Session session=Session.getDefaultInstance(properties, new Authenticator() {
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication()
			{
				return new PasswordAuthentication(from, password);
			}
		});
		
		Message message=new MimeMessage(session);
		
		message.setFrom(new InternetAddress(from));
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(To));
		message.setSubject(subject);
		message.setText(reply);
		
		Transport.send(message);
		
		
		
	}

}
