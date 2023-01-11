package kr.co.pokerium.member.model.vo;

import java.sql.Date;

public class MemberInfo {
	private int    miNo; 
	private String miId; 
	private String miPwd; 
	private String miName;
	private String miBirth;
	private String miGender;
	private String miEmail; 
	private String miIsmail;
	private String miPhone; 
	private String miIssns; 
	private String miTel; 
	private String miIsactive;
	private String miRebank; 
	private String miAccount;
	private Date miRegtime;
	private Date miDroptime; 
	private Date miLastlogin;
	public int getMiNo() {
		return miNo;
	}
	public void setMiNo(int miNo) {
		this.miNo = miNo;
	}
	public String getMiId() {
		return miId;
	}
	public void setMiId(String miId) {
		this.miId = miId;
	}
	public String getMiPwd() {
		return miPwd;
	}
	public void setMiPwd(String miPwd) {
		this.miPwd = miPwd;
	}
	public String getMiName() {
		return miName;
	}
	public void setMiName(String miName) {
		this.miName = miName;
	}
	public String getMiBirth() {
		return miBirth;
	}
	public void setMiBirth(String miBirth) {
		this.miBirth = miBirth;
	}
	public String getMiGender() {
		return miGender;
	}
	public void setMiGender(String miGender) {
		this.miGender = miGender;
	}
	public String getMiEmail() {
		return miEmail;
	}
	public void setMiEmail(String miEmail) {
		this.miEmail = miEmail;
	}
	public String getMiIsmail() {
		return miIsmail;
	}
	public void setMiIsmail(String miIsmail) {
		this.miIsmail = miIsmail;
	}
	public String getMiPhone() {
		return miPhone;
	}
	public void setMiPhone(String miPhone) {
		this.miPhone = miPhone;
	}
	public String getMiIssns() {
		return miIssns;
	}
	public void setMiIssns(String miIssns) {
		this.miIssns = miIssns;
	}
	public String getMiTel() {
		return miTel;
	}
	public void setMiTel(String miTel) {
		this.miTel = miTel;
	}
	public String getMiIsactive() {
		return miIsactive;
	}
	public void setMiIsactive(String miIsactive) {
		this.miIsactive = miIsactive;
	}
	public String getMiRebank() {
		return miRebank;
	}
	public void setMiRebank(String miRebank) {
		this.miRebank = miRebank;
	}
	public String getMiAccount() {
		return miAccount;
	}
	public void setMiAccount(String miAccount) {
		this.miAccount = miAccount;
	}
	public Date getMiRegtime() {
		return miRegtime;
	}
	public void setMiRegtime(Date miRegtime) {
		this.miRegtime = miRegtime;
	}
	public Date getMiDroptime() {
		return miDroptime;
	}
	public void setMiDroptime(Date miDroptime) {
		this.miDroptime = miDroptime;
	}
	public Date getMiLastlogin() {
		return miLastlogin;
	}
	public void setMiLastlogin(Date miLastlogin) {
		this.miLastlogin = miLastlogin;
	}
	public MemberInfo(int miNo, String miId, String miPwd, String miName, String miBirth, String miGender,
			String miEmail, String miIsmail, String miPhone, String miIssns, String miTel, String miIsactive,
			String miRebank, String miAccount, Date miRegtime, Date miDroptime, Date miLastlogin) {
		super();
		this.miNo = miNo;
		this.miId = miId;
		this.miPwd = miPwd;
		this.miName = miName;
		this.miBirth = miBirth;
		this.miGender = miGender;
		this.miEmail = miEmail;
		this.miIsmail = miIsmail;
		this.miPhone = miPhone;
		this.miIssns = miIssns;
		this.miTel = miTel;
		this.miIsactive = miIsactive;
		this.miRebank = miRebank;
		this.miAccount = miAccount;
		this.miRegtime = miRegtime;
		this.miDroptime = miDroptime;
		this.miLastlogin = miLastlogin;
	}
	public MemberInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "MemberInfo [miNo=" + miNo + ", miId=" + miId + ", miPwd=" + miPwd + ", miName=" + miName + ", miBirth="
				+ miBirth + ", miGender=" + miGender + ", miEmail=" + miEmail + ", miIsmail=" + miIsmail + ", miPhone="
				+ miPhone + ", miIssns=" + miIssns + ", miTel=" + miTel + ", miIsactive=" + miIsactive + ", miRebank="
				+ miRebank + ", miAccount=" + miAccount + ", miRegtime=" + miRegtime + ", miDroptime=" + miDroptime
				+ ", miLastlogin=" + miLastlogin + "]";
	}
	
	
	
}


