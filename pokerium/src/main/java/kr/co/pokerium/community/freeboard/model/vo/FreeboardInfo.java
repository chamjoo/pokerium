package kr.co.pokerium.community.freeboard.model.vo;

import java.sql.Timestamp;

public class FreeboardInfo {

	// 자유게시판
	private int			num;
	private int 		fbiIdx;
	private String 		miId;
	private String 		fbiTitle;
	private String 		fbiContent;
	private int 		fbiReadcnt;
	private String 		fbiIsview;
	private Timestamp	fbiRegtime;
	private Timestamp	fbiUpdatetime;
	private Timestamp	fbiDeletetime;
	
	private String miNickname;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getFbiIdx() {
		return fbiIdx;
	}

	public void setFbiIdx(int fbiIdx) {
		this.fbiIdx = fbiIdx;
	}

	public String getMiId() {
		return miId;
	}

	public void setMiId(String miId) {
		this.miId = miId;
	}

	public String getFbiTitle() {
		return fbiTitle;
	}

	public void setFbiTitle(String fbiTitle) {
		this.fbiTitle = fbiTitle;
	}

	public String getFbiContent() {
		return fbiContent;
	}

	public void setFbiContent(String fbiContent) {
		this.fbiContent = fbiContent;
	}

	public int getFbiReadcnt() {
		return fbiReadcnt;
	}

	public void setFbiReadcnt(int fbiReadcnt) {
		this.fbiReadcnt = fbiReadcnt;
	}

	public String getFbiIsview() {
		return fbiIsview;
	}

	public void setFbiIsview(String fbiIsview) {
		this.fbiIsview = fbiIsview;
	}

	public Timestamp getFbiRegtime() {
		return fbiRegtime;
	}

	public void setFbiRegtime(Timestamp fbiRegtime) {
		this.fbiRegtime = fbiRegtime;
	}

	public Timestamp getFbiUpdatetime() {
		return fbiUpdatetime;
	}

	public void setFbiUpdatetime(Timestamp fbiUpdatetime) {
		this.fbiUpdatetime = fbiUpdatetime;
	}

	public Timestamp getFbiDeletetime() {
		return fbiDeletetime;
	}

	public void setFbiDeletetime(Timestamp fbiDeletetime) {
		this.fbiDeletetime = fbiDeletetime;
	}

	public String getMiNickname() {
		return miNickname;
	}

	public void setMiNickname(String miNickname) {
		this.miNickname = miNickname;
	}

	public FreeboardInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FreeboardInfo(int num, int fbiIdx, String miId, String fbiTitle, String fbiContent, int fbiReadcnt,
			String fbiIsview, Timestamp fbiRegtime, Timestamp fbiUpdatetime, Timestamp fbiDeletetime,
			String miNickname) {
		super();
		this.num = num;
		this.fbiIdx = fbiIdx;
		this.miId = miId;
		this.fbiTitle = fbiTitle;
		this.fbiContent = fbiContent;
		this.fbiReadcnt = fbiReadcnt;
		this.fbiIsview = fbiIsview;
		this.fbiRegtime = fbiRegtime;
		this.fbiUpdatetime = fbiUpdatetime;
		this.fbiDeletetime = fbiDeletetime;
		this.miNickname = miNickname;
	}

	@Override
	public String toString() {
		return "FreeboardInfo [num=" + num + ", fbiIdx=" + fbiIdx + ", miId=" + miId + ", fbiTitle=" + fbiTitle
				+ ", fbiContent=" + fbiContent + ", fbiReadcnt=" + fbiReadcnt + ", fbiIsview=" + fbiIsview
				+ ", fbiRegtime=" + fbiRegtime + ", fbiUpdatetime=" + fbiUpdatetime + ", fbiDeletetime=" + fbiDeletetime
				+ ", miNickname=" + miNickname + "]";
	}
	
	
	
	
}
