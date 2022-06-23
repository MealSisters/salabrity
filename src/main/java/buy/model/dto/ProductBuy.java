package buy.model.dto;

import java.sql.Date;

public class ProductBuy {
	private int productBuyNo;
	private int productNo;
	private Long merchantUid;
	private int quantity;
	private Date firstShippingDate;
	private String cancelFlag;

	public ProductBuy() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductBuy(int productBuyNo, int productNo, Long merchantUid, int quantity, Date firstShippingDate,
			String cancelFlag) {
		super();
		this.productBuyNo = productBuyNo;
		this.productNo = productNo;
		this.merchantUid = merchantUid;
		this.quantity = quantity;
		this.firstShippingDate = firstShippingDate;
		this.cancelFlag = cancelFlag;
	}

	public int getProductBuyNo() {
		return productBuyNo;
	}

	public void setProductBuyNo(int productBuyNo) {
		this.productBuyNo = productBuyNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public Long getMerchantUid() {
		return merchantUid;
	}

	public void setMerchantUid(Long merchantUid) {
		this.merchantUid = merchantUid;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getFirstShippingDate() {
		return firstShippingDate;
	}

	public void setFirstShippingDate(Date firstShippingDate) {
		this.firstShippingDate = firstShippingDate;
	}

	public String getCancelFlag() {
		return cancelFlag;
	}

	public void setCancelFlag(String cancelFlag) {
		this.cancelFlag = cancelFlag;
	}

	@Override
	public String toString() {
		return "ProductBuy [productBuyNo=" + productBuyNo + ", productNo=" + productNo + ", merchantUid=" + merchantUid
				+ ", quantity=" + quantity + ", firstShippingDate=" + firstShippingDate + ", cancelFlag=" + cancelFlag
				+ "]";
	}

}
