package product.model.dto;

import java.sql.Date;

public class ProductAttach {
	private int productAttachNo;
	private int productNo;
	private Thumbnail thumbnail;
	private String originalFilename;
	private String renamedFilename;
	private Date regDate;

	public ProductAttach() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductAttach(int productAttachNo, int productNo, Thumbnail thumbnail, String originalFilename,
			String renamedFilename, Date regDate) {
		super();
		this.productAttachNo = productAttachNo;
		this.productNo = productNo;
		this.thumbnail = thumbnail;
		this.originalFilename = originalFilename;
		this.renamedFilename = renamedFilename;
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

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public String getRenamedFilename() {
		return renamedFilename;
	}

	public void setRenamedFilename(String renamedFilename) {
		this.renamedFilename = renamedFilename;
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
				+ thumbnail + ", originalFilename=" + originalFilename + ", renamedFilename=" + renamedFilename
				+ ", regDate=" + regDate + "]";
	}

}
