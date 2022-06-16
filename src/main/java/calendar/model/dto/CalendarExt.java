package calendar.model.dto;

public class CalendarExt extends Calendar {
	private String menuName;

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	@Override
	public String toString() {
		return "CalendarExt [menuName=" + menuName + ", toString()=" + super.toString() + "]";
	}

}
