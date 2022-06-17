package admin.model.dto;

import java.sql.Date;

public class SalesTrend {
	private Date salesDate;
	private int amount;
	private String productName;

	public SalesTrend() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SalesTrend(Date salesDate, int amount, String productName) {
		super();
		this.salesDate = salesDate;
		this.amount = amount;
		this.productName = productName;
	}

	public Date getSalesDate() {
		return salesDate;
	}

	public void setSalesDate(Date salesDate) {
		this.salesDate = salesDate;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Override
	public String toString() {
		return "SalesTrend [salesDate=" + salesDate + ", amount=" + amount + ", productName=" + productName + "]";
	}

}
