package cart.model.dto;

import java.sql.Date;

public class Cart {
	private int cartNo;
	private String memberId;
	private int productNo;
	private int quantity;
	private String firstShipppingDate;
	
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cart(int cartNo, String memberId, int productNo, int quantity, String firstShipppingDate) {
		super();
		this.cartNo = cartNo;
		this.memberId = memberId;
		this.productNo = productNo;
		this.quantity = quantity;
		this.firstShipppingDate = firstShipppingDate;
	}

	public Cart(String memberId, int productNo, int quantity, String firstShipppingDate) {
		super();
		this.memberId = memberId;
		this.productNo = productNo;
		this.quantity = quantity;
		this.firstShipppingDate = firstShipppingDate;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getFirstShipppingDate() {
		return firstShipppingDate;
	}

	public void setFirstShipppingDate(String firstShipppingDate) {
		this.firstShipppingDate = firstShipppingDate;
	}

	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", memberId=" + memberId + ", productNo=" + productNo + ", quantity="
				+ quantity + ", firstShipppingDate=" + firstShipppingDate + "]";
	}
	
	
}
