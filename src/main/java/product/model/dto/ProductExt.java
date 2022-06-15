package product.model.dto;

import java.util.List;

public class ProductExt extends Product {
	private int attachCount;
	private List<ProductAttach> attach;

	public int getAttachCount() {
		return attachCount;
	}

	public void setAttachCount(int attachCount) {
		this.attachCount = attachCount;
	}

	public List<ProductAttach> getAttach() {
		return attach;
	}

	public void setAttach(List<ProductAttach> attach) {
		this.attach = attach;
	}

	@Override
	public String toString() {
		return "ProductExt [attachCount=" + attachCount + ", attach=" + attach + ", toString()=" + super.toString()
				+ "]";
	}

}
