package member.model.dto;

import java.sql.Date;

public class Member {
	
	private String memberId;
	private String password;
	private String memberName;
	private String gender;
	private Date birthday;
	private String email;
	private String phone;
	private String zipcode;
	private String address;
	private String addressDetail;
	private Date enrollDate;
	private MemberRole memberRole;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(String memberId, String password, String memberName, String gender, Date birthday, String email,
			String phone, String zipcode, String address, String addressDetail, Date enrollDate,
			MemberRole memberRole) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.memberName = memberName;
		this.gender = gender;
		this.birthday = birthday;
		this.email = email;
		this.phone = phone;
		this.zipcode = zipcode;
		this.address = address;
		this.addressDetail = addressDetail;
		this.enrollDate = enrollDate;
		this.memberRole = memberRole;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public MemberRole getMemberRole() {
		return memberRole;
	}

	public void setMemberRole(MemberRole memberRole) {
		this.memberRole = memberRole;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", password=" + password + ", memberName=" + memberName + ", gender="
				+ gender + ", birthday=" + birthday + ", email=" + email + ", phone=" + phone + ", zipcode=" + zipcode
				+ ", address=" + address + ", addressDetail=" + addressDetail + ", enrollDate=" + enrollDate
				+ ", memberRole=" + memberRole + "]";
	}
	
	
}
