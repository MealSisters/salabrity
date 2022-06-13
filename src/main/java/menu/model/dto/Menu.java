package menu.model.dto;

public class Menu {
	private int menuNo;
	private String menuId;
	private String menuName;
	private String menuDescription;
	private String ingredients;
	private int calorie;

	public Menu() {
		super();
	}

	public Menu(int menuNo, String menuId, String menuName, String menuDescription, String ingredients, int calorie) {
		super();
		this.menuNo = menuNo;
		this.menuId = menuId;
		this.menuName = menuName;
		this.menuDescription = menuDescription;
		this.ingredients = ingredients;
		this.calorie = calorie;
	}

	public int getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuDescription() {
		return menuDescription;
	}

	public void setMenuDescription(String menuDescription) {
		this.menuDescription = menuDescription;
	}

	public String getIngredients() {
		return ingredients;
	}

	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}

	public int getCalorie() {
		return calorie;
	}

	public void setCalorie(int calorie) {
		this.calorie = calorie;
	}

	@Override
	public String toString() {
		return "Menu [menuNo=" + menuNo + ", menuId=" + menuId + ", menuName=" + menuName + ", menuDescription="
				+ menuDescription + ", ingredients=" + ingredients + ", calorie=" + calorie + "]";
	}

}
