package menu.model.dto;

import java.sql.Date;

public class MenuAttach {
	private int menuAttachNo;
	private int menuNo;
	private String originalFileName;
	private String renamedFileName;
	private Date regDate;

	public MenuAttach() {
		super();
	}

	public MenuAttach(int menuAttachNo, int menuNo, String originalFileName, String renamedFileName, Date regDate) {
		super();
		this.menuAttachNo = menuAttachNo;
		this.menuNo = menuNo;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
		this.regDate = regDate;
	}

	public int getMenuAttachNo() {
		return menuAttachNo;
	}

	public void setMenuAttachNo(int menuAttachNo) {
		this.menuAttachNo = menuAttachNo;
	}

	public int getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
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
		return "MenuAttach [menuAttachNo=" + menuAttachNo + ", menuNo=" + menuNo + ", originalFileName="
				+ originalFileName + ", renamedFileName=" + renamedFileName + ", regDate=" + regDate + "]";
	}

}
