package mypage.model.dto;

public class Destination {
	
	private int shippingAddressNo;
	private String memberId;
	private String telephone;
	private String zipcode;
	private String address;
	private String addressDetail;
	private String isDefault;
	private String shippingPerson;
	private String delFlag;
	
	public Destination() {}

	public Destination(int shippingAddressNo, String memberId, String telephone, String zipcode, String address,
			String addressDetail, String isDefault, String shippingPerson, String delFlag) {
		super();
		this.shippingAddressNo = shippingAddressNo;
		this.memberId = memberId;
		this.telephone = telephone;
		this.zipcode = zipcode;
		this.address = address;
		this.addressDetail = addressDetail;
		this.isDefault = isDefault;
		this.shippingPerson = shippingPerson;
		this.delFlag = delFlag;
	}
	

	public Destination(String memberId, String telephone, String zipcode, String address, String addressDetail,
			String shippingPerson) {
		super();
		this.memberId = memberId;
		this.telephone = telephone;
		this.zipcode = zipcode;
		this.address = address;
		this.addressDetail = addressDetail;
		this.shippingPerson = shippingPerson;
	}

	public int getShippingAddressNo() {
		return shippingAddressNo;
	}

	public void setShippingAddressNo(int shippingAddressNo) {
		this.shippingAddressNo = shippingAddressNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(String isDefault) {
		this.isDefault = isDefault;
	}

	public String getShippingPerson() {
		return shippingPerson;
	}

	public void setShippingPerson(String shippingPerson) {
		this.shippingPerson = shippingPerson;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	@Override
	public String toString() {
		return "Destination [shippingAddressNo=" + shippingAddressNo + ", memberId=" + memberId + ", telephone="
				+ telephone + ", zipcode=" + zipcode + ", address=" + address + ", addressDetail=" + addressDetail
				+ ", isDefault=" + isDefault + ", shippingPerson=" + shippingPerson + ", delFlag=" + delFlag + "]";
	}

}
