package kr.co.pokerium.member.model.vo;

import java.sql.Timestamp;

public class MemberAddr {
	private int maIdx;
	private String miId;
	private String maName;
	private String maPhone;
	private String maAddrname;
	private String maZip;
	private String maAddr1;
	private String maAddr2;
	private String maBasic;
	private Timestamp maDate;
	public int getMaIdx() {
		return maIdx;
	}
	public void setMaIdx(int maIdx) {
		this.maIdx = maIdx;
	}
	public String getMiId() {
		return miId;
	}
	public void setMiId(String miId) {
		this.miId = miId;
	}
	public String getMaName() {
		return maName;
	}
	public void setMaName(String maName) {
		this.maName = maName;
	}
	public String getMaPhone() {
		return maPhone;
	}
	public void setMaPhone(String maPhone) {
		this.maPhone = maPhone;
	}
	public String getMaAddrname() {
		return maAddrname;
	}
	public void setMaAddrname(String maAddrname) {
		this.maAddrname = maAddrname;
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
	public String getMaBasic() {
		return maBasic;
	}
	public void setMaBasic(String maBasic) {
		this.maBasic = maBasic;
	}
	public Timestamp getMaDate() {
		return maDate;
	}
	public void setMaDate(Timestamp maDate) {
		this.maDate = maDate;
	}
	public MemberAddr() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberAddr(int maIdx, String miId, String maName, String maPhone, String maAddrname, String maZip,
			String maAddr1, String maAddr2, String maBasic, Timestamp maDate) {
		super();
		this.maIdx = maIdx;
		this.miId = miId;
		this.maName = maName;
		this.maPhone = maPhone;
		this.maAddrname = maAddrname;
		this.maZip = maZip;
		this.maAddr1 = maAddr1;
		this.maAddr2 = maAddr2;
		this.maBasic = maBasic;
		this.maDate = maDate;
	}
	@Override
	public String toString() {
		return "MemberAddr [maIdx=" + maIdx + ", miId=" + miId + ", maName=" + maName + ", maPhone=" + maPhone
				+ ", maAddrname=" + maAddrname + ", maZip=" + maZip + ", maAddr1=" + maAddr1 + ", maAddr2=" + maAddr2
				+ ", maBasic=" + maBasic + ", maDate=" + maDate + "]";
	}
	
	
}
