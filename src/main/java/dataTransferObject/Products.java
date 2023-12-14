package dataTransferObject;

import java.util.Arrays;

public class Products 
{
	private long id;
	private String pizzaName;
	private String description;
	private String size;
	private double price;
	private String category;
	private byte[]image;

	@Override
	public String toString() {
		return "Products [pizzaName=" + pizzaName + ", description=" + description + ", size=" + size + ", price="
				+ price + ", category=" + category + ", image=" + Arrays.toString(image) + "]";
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}


	public String getPizzaName() {
		return pizzaName;
	}
	public void setPizzaName(String pizzaName) {
		this.pizzaName = pizzaName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
}
