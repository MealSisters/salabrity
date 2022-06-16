package product.model.dto;

public class ProductMenu {
	private int productNo;
	private int menuNo;

	public ProductMenu() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductMenu(int productNo, int menuNo) {
		super();
		this.productNo = productNo;
		this.menuNo = menuNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}

	@Override
	public String toString() {
		return "ProductMenu [productNo=" + productNo + ", menuNo=" + menuNo + "]";
	}

}
