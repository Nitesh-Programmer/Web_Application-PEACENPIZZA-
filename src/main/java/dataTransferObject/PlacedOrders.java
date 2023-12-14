package dataTransferObject;

import java.util.Arrays;

public class PlacedOrders
{
	private String pizza_Name;
	private String size;
	private  double price;
	private String category;
	private byte []image;
	private int quantity;
	private double  product_price;
	private long userId;
	private double total_price;
	
	
	
	@Override
	public String toString() {
		return "PlacedOrders [pizza_Name=" + pizza_Name + ", size=" + size + ", price=" + price + ", category="
				+ category + ", image=" + Arrays.toString(image) + ", quantity=" + quantity + ", product_price="
				+ product_price + ", userId=" + userId + ", total_price=" + total_price + "]";
	}
	public String getPizza_Name() {
		return pizza_Name;
	}
	public void setPizza_Name(String pizza_Name) {
		this.pizza_Name = pizza_Name;
	}

	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getProduct_price() {
		return product_price;
	}
	public void setProduct_price(double product_price) {
		this.product_price = product_price;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}
	
	
	
	
	
}
