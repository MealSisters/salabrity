package product.model.dto;

import java.sql.Date;

public class Product {
	private int productNo;
	private String productId;
	private String productName;
	private int productPrice;
	private String productdescription;
	private ProductTarget productTarget;
	private int views;
	private int salesCnt;
	private Date registrationDate;
	private int subscriptionPeriod;
	private String delFlag;

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(int productNo, String productId, String productName, int productPrice, String productdescription,
			ProductTarget productTarget, int views, int salesCnt, Date registrationDate, int subscriptionPeriod,
			String delFlag) {
		super();
		this.productNo = productNo;
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productdescription = productdescription;
		this.productTarget = productTarget;
		this.views = views;
		this.salesCnt = salesCnt;
		this.registrationDate = registrationDate;
		this.subscriptionPeriod = subscriptionPeriod;
		this.delFlag = delFlag;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductdescription() {
		return productdescription;
	}

	public void setProductdescription(String productdescription) {
		this.productdescription = productdescription;
	}

	public ProductTarget getProductTarget() {
		return productTarget;
	}

	public void setProductTarget(ProductTarget productTarget) {
		this.productTarget = productTarget;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getSalesCnt() {
		return salesCnt;
	}

	public void setSalesCnt(int salesCnt) {
		this.salesCnt = salesCnt;
	}

	public Date getRegistrationDate() {
		return registrationDate;
	}

	public void setRegistrationDate(Date registrationDate) {
		this.registrationDate = registrationDate;
	}

	public int getSubscriptionPeriod() {
		return subscriptionPeriod;
	}

	public void setSubscriptionPeriod(int subscriptionPeriod) {
		this.subscriptionPeriod = subscriptionPeriod;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productId=" + productId + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", productdescription=" + productdescription + ", productTarget="
				+ productTarget + ", views=" + views + ", salesCnt=" + salesCnt + ", registrationDate="
				+ registrationDate + ", subscriptionPeriod=" + subscriptionPeriod + ", delFlag=" + delFlag + "]";
	}

}
