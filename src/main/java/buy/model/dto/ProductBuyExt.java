package buy.model.dto;

import java.sql.Date;

import product.model.dto.ProductTarget;

public class ProductBuyExt extends ProductBuy {
	private String productId;
	private String productName;
	private int productPrice;
	private int salesCnt;
	private int subscriptionPeriod;


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

	public int getSalesCnt() {
		return salesCnt;
	}

	public void setSalesCnt(int salesCnt) {
		this.salesCnt = salesCnt;
	}

	public int getSubscriptionPeriod() {
		return subscriptionPeriod;
	}

	public void setSubscriptionPeriod(int subscriptionPeriod) {
		this.subscriptionPeriod = subscriptionPeriod;
	}

	@Override
	public String toString() {
		return "ProductBuyExt [productId=" + productId + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", salesCnt=" + salesCnt + ", subscriptionPeriod="
				+ subscriptionPeriod + ", toString()=" + super.toString() + "]";
	}

}
