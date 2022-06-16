package calendar.model.dto;

public class Calendar {
	private int calNo;
	private int productNo;
	private int menuNo;
	private WeekDayCode weekDayCode;

	public Calendar() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Calendar(int calNo, int productNo, int menuNo, WeekDayCode weekDayCode) {
		super();
		this.calNo = calNo;
		this.productNo = productNo;
		this.menuNo = menuNo;
		this.weekDayCode = weekDayCode;
	}

	public int getCalNo() {
		return calNo;
	}

	public void setCalNo(int calNo) {
		this.calNo = calNo;
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

	public WeekDayCode getWeekDayCode() {
		return weekDayCode;
	}

	public void setWeekDayCode(WeekDayCode weekDayCode) {
		this.weekDayCode = weekDayCode;
	}

	@Override
	public String toString() {
		return "Calendar [calNo=" + calNo + ", productNo=" + productNo + ", menuNo=" + menuNo + ", weekDayCode="
				+ weekDayCode + "]";
	}

}
