package menu.model.dto;

public class MenuExt extends Menu {
	private MenuAttach menuAttach;

	public MenuExt() {
		super();
	}

	public MenuExt(int menuNo, String menuId, String menuName, String menuDescription, String ingredients,
			int calorie) {
		super(menuNo, menuId, menuName, menuDescription, ingredients, calorie);
	}

	public MenuExt(MenuAttach menuAttach) {
		super();
		this.menuAttach = menuAttach;
	}

	public MenuAttach getMenuAttach() {
		return menuAttach;
	}

	public void setMenuAttach(MenuAttach menuAttach) {
		this.menuAttach = menuAttach;
	}

	@Override
	public String toString() {
		return "MenuExt [menuAttach=" + menuAttach + ", toString()=" + super.toString() + "]";
	}

}
