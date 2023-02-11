package kr.co.pokerium.community.freeboard.model.vo;

import java.sql.Timestamp;

public class FreeboardReply {

	// 자유게시판 댓글
	private int 		fbiIdx;
	private int 		fbrNum;
	private int 		fbrIdx;
	private int 		fbrStep;
	private int 		fbrLevel;
	private int 		fbrParent;
	private String   	miId;
	private String		fbrComment;
	private String		fbrIsview;
	private Timestamp	fbrRegtime;
	private Timestamp	fbrUpdatetime;
	private Timestamp	fbrDeletetime;
	
	private String miNickname;
	private String miTeam;
	

	public int getFbiIdx() {
		return fbiIdx;
	}
	public void setFbiIdx(int fbiIdx) {
		this.fbiIdx = fbiIdx;
	}
	public int getFbrIdx() {
		return fbrIdx;
	}
	public void setFbrIdx(int fbrIdx) {
		this.fbrIdx = fbrIdx;
	}
	public int getFbrStep() {
		return fbrStep;
	}
	public void setFbrStep(int fbrStep) {
		this.fbrStep = fbrStep;
	}
	public int getFbrLevel() {
		return fbrLevel;
	}
	public void setFbrLevel(int fbrLevel) {
		this.fbrLevel = fbrLevel;
	}
	public String getMiId() {
		return miId;
	}
	public void setMiId(String miId) {
		this.miId = miId;
	}
	public String getFbrComment() {
		return fbrComment;
	}
	public void setFbrComment(String fbrComment) {
		this.fbrComment = fbrComment;
	}
	public String getFbrIsview() {
		return fbrIsview;
	}
	public void setFbrIsview(String fbrIsview) {
		this.fbrIsview = fbrIsview;
	}
	public Timestamp getFbrRegtime() {
		return fbrRegtime;
	}
	public void setFbrRegtime(Timestamp fbrRegtime) {
		this.fbrRegtime = fbrRegtime;
	}
	public Timestamp getFbrUpdatetime() {
		return fbrUpdatetime;
	}
	public void setFbrUpdatetime(Timestamp fbrUpdatetime) {
		this.fbrUpdatetime = fbrUpdatetime;
	}
	public Timestamp getFbrDeletetime() {
		return fbrDeletetime;
	}
	public void setFbrDeletetime(Timestamp fbrDeletetime) {
		this.fbrDeletetime = fbrDeletetime;
	}
	public String getMiNickname() {
		return miNickname;
	}
	public void setMiNickname(String miNickname) {
		this.miNickname = miNickname;
	}
	public String getMiTeam() {
		return miTeam;
	}
	public void setMiTeam(String miTeam) {
		this.miTeam = miTeam;
	}
	public int getFbrParent() {
		return fbrParent;
	}
	public void setFbrParent(int fbrParent) {
		this.fbrParent = fbrParent;
	}
	public int getFbrNum() {
		return fbrNum;
	}
	public void setFbrNum(int fbrNum) {
		this.fbrNum = fbrNum;
	}
	@Override
	public String toString() {
		return "FreeboardReply [fbiIdx=" + fbiIdx + ", fbrNum=" + fbrNum + ", fbrIdx=" + fbrIdx + ", fbrStep=" + fbrStep
				+ ", fbrLevel=" + fbrLevel + ", fbrParent=" + fbrParent + ", miId=" + miId + ", fbrComment="
				+ fbrComment + ", fbrIsview=" + fbrIsview + ", fbrRegtime=" + fbrRegtime + ", fbrUpdatetime="
				+ fbrUpdatetime + ", fbrDeletetime=" + fbrDeletetime + ", miNickname=" + miNickname + ", miTeam="
				+ miTeam + "]";
	}
	public FreeboardReply(int fbiIdx, int fbrNum, int fbrIdx, int fbrStep, int fbrLevel, int fbrParent, String miId,
			String fbrComment, String fbrIsview, Timestamp fbrRegtime, Timestamp fbrUpdatetime, Timestamp fbrDeletetime,
			String miNickname, String miTeam) {
		super();
		this.fbiIdx = fbiIdx;
		this.fbrNum = fbrNum;
		this.fbrIdx = fbrIdx;
		this.fbrStep = fbrStep;
		this.fbrLevel = fbrLevel;
		this.fbrParent = fbrParent;
		this.miId = miId;
		this.fbrComment = fbrComment;
		this.fbrIsview = fbrIsview;
		this.fbrRegtime = fbrRegtime;
		this.fbrUpdatetime = fbrUpdatetime;
		this.fbrDeletetime = fbrDeletetime;
		this.miNickname = miNickname;
		this.miTeam = miTeam;
	}
	public FreeboardReply() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
