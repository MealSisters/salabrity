package buy.model.dto;

import java.sql.Date;
import java.util.List;

public class BuyExt extends Buy {
	private List<ProductBuyExt> list;

	public List<ProductBuyExt> getList() {
		return list;
	}

	public void setList(List<ProductBuyExt> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "BuyExt [list=" + list + ", toString()=" + super.toString() + "]";
	}

}
