package buy.model.dto;

public class PayPB {
	private int productNo;
	private int quantity;
	private String firstShippingDate;

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

	public String getFirstShippingDate() {
		return firstShippingDate;
	}

	public void setFirstShippingDate(String firstShippingDate) {
		this.firstShippingDate = firstShippingDate;
	}

	public PayPB() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PayPB(int productNo, int quantity, String firstShippingDate) {
		super();
		this.productNo = productNo;
		this.quantity = quantity;
		this.firstShippingDate = firstShippingDate;
	}

	@Override
	public String toString() {
		return "PayPB [productNo=" + productNo + ", quantity=" + quantity + ", firstShippingDate=" + firstShippingDate
				+ "]";
	}

}
