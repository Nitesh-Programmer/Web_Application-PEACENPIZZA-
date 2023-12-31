package dataTransferObject;

public class ContactAdmin 
{
	private int contact_id;
	private String userName;
	private String email;
	private String message;
	private long  contact_userId;
	public int getContact_id() {
		return contact_id;
	}
	public void setContact_id(int contact_id) {
		this.contact_id = contact_id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public long getContact_userId() {
		return contact_userId;
	}
	public void setContact_userId(long contact_userId) {
		this.contact_userId = contact_userId;
	}
	@Override
	public String toString() {
		return "ContactAdmin [contact_id=" + contact_id + ", userName=" + userName + ", email=" + email + ", message="
				+ message + ", contact_userId=" + contact_userId + "]";
	}
	
	
	
	
	
	
}
