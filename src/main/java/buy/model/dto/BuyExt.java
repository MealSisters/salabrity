package buy.model.dto;

import java.sql.Date;
import java.util.List;

public class BuyExt extends Buy {
	private List<ProductBuyExt> list;

	public BuyExt(List<ProductBuyExt> list) {
		super();
		this.list = list;
	}

	public BuyExt() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BuyExt(Long merchantUid, String memberId, int shippingAddressNo, String payMethod, int amount,
			String buyerEmail, String buyerName, String buyerTel, String buyerAddr, String buyerPostcode,
			Date paymentDate, Date buyDate, String impUid, PayStatement payStatement, String requestTerm) {
		super(merchantUid, memberId, shippingAddressNo, payMethod, amount, buyerEmail, buyerName, buyerTel, buyerAddr,
				buyerPostcode, paymentDate, buyDate, impUid, payStatement, requestTerm);
		// TODO Auto-generated constructor stub
	}

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
