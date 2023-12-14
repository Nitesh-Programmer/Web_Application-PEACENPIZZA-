package dataTransferObject;

public class AddToCart 
{
	private long cartId;
	private int quantity;
	private long productId;
	private long userId;
	@Override
	public String toString() {
		return "AddToCart [cartId=" + cartId + ", quantity=" + quantity + ", productId=" + productId + ", userId="
				+ userId + "]";
	}
	public long getCartId() {
		return cartId;
	}
	public void setCartId(long cartId) {
		this.cartId = cartId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public long getProductId() {
		return productId;
	}
	public void setProductId(long productId) {
		this.productId = productId;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	

	
	
	
	
}
