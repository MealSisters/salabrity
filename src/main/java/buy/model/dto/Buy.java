package buy.model.dto;

import java.sql.Date;

public class Buy {
	private Long merchantUid;
	private String memberId;
	private int shippingAddressNo;
	private String payMethod;
	private int amount;
	private String buyerEmail;
	private String buyerName;
	private String buyerTel;
	private String buyerAddr;
	private String buyerPostcode;
	private Date paymentDate;
	private Date buyDate;
	private String impUid;
	private PayStatement payStatement;
	private String requestTerm;

	public Buy() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Buy(Long merchantUid, String memberId, int shippingAddressNo, String payMethod, int amount, String buyerEmail,
			String buyerName, String buyerTel, String buyerAddr, String buyerPostcode, Date paymentDate, Date buyDate,
			String impUid, PayStatement payStatement, String requestTerm) {
		super();
		this.merchantUid = merchantUid;
		this.memberId = memberId;
		this.shippingAddressNo = shippingAddressNo;
		this.payMethod = payMethod;
		this.amount = amount;
		this.buyerEmail = buyerEmail;
		this.buyerName = buyerName;
		this.buyerTel = buyerTel;
		this.buyerAddr = buyerAddr;
		this.buyerPostcode = buyerPostcode;
		this.paymentDate = paymentDate;
		this.buyDate = buyDate;
		this.impUid = impUid;
		this.payStatement = payStatement;
		this.requestTerm = requestTerm;
	}

	public Long getMerchantUid() {
		return merchantUid;
	}

	public void setMerchantUid(Long merchantUid) {
		this.merchantUid = merchantUid;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getShippingAddressNo() {
		return shippingAddressNo;
	}

	public void setShippingAddressNo(int shippingAddressNo) {
		this.shippingAddressNo = shippingAddressNo;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getBuyerEmail() {
		return buyerEmail;
	}

	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public String getBuyerTel() {
		return buyerTel;
	}

	public void setBuyerTel(String buyerTel) {
		this.buyerTel = buyerTel;
	}

	public String getBuyerAddr() {
		return buyerAddr;
	}

	public void setBuyerAddr(String buyerAddr) {
		this.buyerAddr = buyerAddr;
	}

	public String getBuyerPostcode() {
		return buyerPostcode;
	}

	public void setBuyerPostcode(String buyerPostcode) {
		this.buyerPostcode = buyerPostcode;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public String getImpUid() {
		return impUid;
	}

	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}

	public PayStatement getPayStatement() {
		return payStatement;
	}

	public void setPayStatement(PayStatement payStatement) {
		this.payStatement = payStatement;
	}

	public String getRequestTerm() {
		return requestTerm;
	}

	public void setRequestTerm(String requestTerm) {
		this.requestTerm = requestTerm;
	}

	@Override
	public String toString() {
		return "Buy [merchantUid=" + merchantUid + ", memberId=" + memberId + ", shippingAddressNo=" + shippingAddressNo
				+ ", payMethod=" + payMethod + ", amount=" + amount + ", buyerEmail=" + buyerEmail + ", buyerName="
				+ buyerName + ", buyerTel=" + buyerTel + ", buyerAddr=" + buyerAddr + ", buyerPostcode=" + buyerPostcode
				+ ", paymentDate=" + paymentDate + ", buyDate=" + buyDate + ", impUid=" + impUid + ", payStatement="
				+ payStatement + ", requestTerm=" + requestTerm + "]";
	}

}
