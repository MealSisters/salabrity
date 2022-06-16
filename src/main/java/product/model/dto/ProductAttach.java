package product.model.dto;

import java.sql.Date;

public class ProductAttach {
	private int productAttachNo;
	private int productNo;
	private Thumbnail thumbnail;
	private String originalFileName;
	private String renamedFileName;
	private Date regDate;

	public ProductAttach() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductAttach(int productAttachNo, int productNo, Thumbnail thumbnail, String originalFileName,
			String renamedFileName, Date regDate) {
		super();
		this.productAttachNo = productAttachNo;
		this.productNo = productNo;
		this.thumbnail = thumbnail;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
		this.regDate = regDate;
	}

	public int getProductAttachNo() {
		return productAttachNo;
	}

	public void setProductAttachNo(int productAttachNo) {
		this.productAttachNo = productAttachNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public Thumbnail getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(Thumbnail thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenamedFileName() {
		return renamedFileName;
	}

	public void setRenamedFileName(String renamedFileName) {
		this.renamedFileName = renamedFileName;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "ProductAttach [productAttachNo=" + productAttachNo + ", productNo=" + productNo + ", thumbnail="
				+ thumbnail + ", originalFileName=" + originalFileName + ", renamedFileName=" + renamedFileName
				+ ", regDate=" + regDate + "]";
	}

}
