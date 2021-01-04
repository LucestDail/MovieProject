package model;

import java.util.Date;

public class Comment {
	private String member_id;
	private int board_num;
	private Date comment_regdate;
	private String comment_content;
	private int alert_count;
	private int recommand_count;
	private int not_recommand_count;
	private int comment_num;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public Date getComment_regdate() {
		return comment_regdate;
	}
	public void setComment_regdate(Date comment_regdate) {
		this.comment_regdate = comment_regdate;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public int getAlert_count() {
		return alert_count;
	}
	public void setAlert_count(int alert_count) {
		this.alert_count = alert_count;
	}
	public int getRecommand_count() {
		return recommand_count;
	}
	public void setRecommand_count(int recommand_count) {
		this.recommand_count = recommand_count;
	}
	public int getNot_recommand_count() {
		return not_recommand_count;
	}
	public void setNot_recommand_count(int not_recommand_count) {
		this.not_recommand_count = not_recommand_count;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	@Override
	public String toString() {
		return "Comment [member_id=" + member_id + ", board_num=" + board_num + ", comment_regdate=" + comment_regdate
				+ ", comment_content=" + comment_content + ", alert_count=" + alert_count + ", recommand_count="
				+ recommand_count + ", not_recommand_count=" + not_recommand_count + ", comment_num=" + comment_num
				+ "]";
	}
	
	
	
}
