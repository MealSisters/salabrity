package product.model.dto;

import java.util.List;

public class ProductExt extends Product {
	private int attachCount;
	private List<ProductAttach> attachs;
	private List<ProductMenu> menus;

	public int getAttachCount() {
		return attachCount;
	}

	public void setAttachCount(int attachCount) {
		this.attachCount = attachCount;
	}

	public List<ProductAttach> getAttachs() {
		return attachs;
	}

	public void setAttachs(List<ProductAttach> attachs) {
		this.attachs = attachs;
	}

	public List<ProductMenu> getMenus() {
		return menus;
	}

	public void setMenus(List<ProductMenu> menus) {
		this.menus = menus;
	}

	@Override
	public String toString() {
		return "ProductExt [attachCount=" + attachCount + ", attachs=" + attachs + ", menus=" + menus + ", toString()="
				+ super.toString() + "]";
	}

}
