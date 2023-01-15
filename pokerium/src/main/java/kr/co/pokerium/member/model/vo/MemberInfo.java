package kr.co.pokerium.member.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class MemberInfo {
	private int    miNo; 
	private String miId; 
	private String miNickname;
	private String miPwd; 
	private String miName;
	private String miBirth;
	private String miGender;
	private String miTeam;
	private String miEmail; 
	private String miIsmail;
	private String miPhone; 
	private String miIssns; 
	private String miTel; 
	private String miIsactive;
	private String miRebank; 
	private String miAccount;
	private Timestamp miRegtime;
	private Timestamp miDroptime; 
	private Timestamp miLastlogin;
	
	private String maZip;
	private String maAddr1;
	private String maAddr2;
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
	public String getMiNickname() {
		return miNickname;
	}
	public void setMiNickname(String miNickname) {
		this.miNickname = miNickname;
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
	public String getMiTeam() {
		return miTeam;
	}
	public void setMiTeam(String miTeam) {
		this.miTeam = miTeam;
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
	public Timestamp getMiRegtime() {
		return miRegtime;
	}
	public void setMiRegtime(Timestamp miRegtime) {
		this.miRegtime = miRegtime;
	}
	public Timestamp getMiDroptime() {
		return miDroptime;
	}
	public void setMiDroptime(Timestamp miDroptime) {
		this.miDroptime = miDroptime;
	}
	public Timestamp getMiLastlogin() {
		return miLastlogin;
	}
	public void setMiLastlogin(Timestamp miLastlogin) {
		this.miLastlogin = miLastlogin;
	}
	public String getMaZip() {
		return maZip;
	}
	public void setMaZip(String maZip) {
		this.maZip = maZip;
	}
	public String getMaAddr1() {
		return maAddr1;
	}
	public void setMaAddr1(String maAddr1) {
		this.maAddr1 = maAddr1;
	}
	public String getMaAddr2() {
		return maAddr2;
	}
	public void setMaAddr2(String maAddr2) {
		this.maAddr2 = maAddr2;
	}
	public MemberInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberInfo(int miNo, String miId, String miNickname, String miPwd, String miName, String miBirth,
			String miGender, String miTeam, String miEmail, String miIsmail, String miPhone, String miIssns,
			String miTel, String miIsactive, String miRebank, String miAccount, Timestamp miRegtime,
			Timestamp miDroptime, Timestamp miLastlogin, String maZip, String maAddr1, String maAddr2) {
		super();
		this.miNo = miNo;
		this.miId = miId;
		this.miNickname = miNickname;
		this.miPwd = miPwd;
		this.miName = miName;
		this.miBirth = miBirth;
		this.miGender = miGender;
		this.miTeam = miTeam;
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
		this.maZip = maZip;
		this.maAddr1 = maAddr1;
		this.maAddr2 = maAddr2;
	}
	@Override
	public String toString() {
		return "MemberInfo [miNo=" + miNo + ", miId=" + miId + ", miNickname=" + miNickname + ", miPwd=" + miPwd
				+ ", miName=" + miName + ", miBirth=" + miBirth + ", miGender=" + miGender + ", miTeam=" + miTeam
				+ ", miEmail=" + miEmail + ", miIsmail=" + miIsmail + ", miPhone=" + miPhone + ", miIssns=" + miIssns
				+ ", miTel=" + miTel + ", miIsactive=" + miIsactive + ", miRebank=" + miRebank + ", miAccount="
				+ miAccount + ", miRegtime=" + miRegtime + ", miDroptime=" + miDroptime + ", miLastlogin=" + miLastlogin
				+ ", maZip=" + maZip + ", maAddr1=" + maAddr1 + ", maAddr2=" + maAddr2 + "]";
	}
	
	
	
	
	
}



