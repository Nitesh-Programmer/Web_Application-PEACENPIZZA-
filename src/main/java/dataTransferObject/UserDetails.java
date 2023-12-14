package dataTransferObject;

public class UserDetails 
{
	private long id;
	private String first_name;
	private String last_name;
	private String email;
	private String password;
	private long phno;
	private int Age;
	private String role;
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public long getPhno() {
		return phno;
	}
	public void setPhno(long phno) {
		this.phno = phno;
	}
	public int getAge() {
		return Age;
	}
	public void setAge(int age) {
		this.Age = age;
	}
	@Override
	public String toString() {
		return "UserDetails [id=" + id + ", first_name=" + first_name + ", last_name=" + last_name + ", email=" + email
				+ ", password=" + password + ", phno=" + phno + ", Age=" + Age + ", role=" + role + "]";
	}
	
	
	
}
