package model;

import java.util.Date;

public class Board {
	private int board_num;
	private String member_id;
	private int board_notice_able;
	private String board_subject;
	private String board_content;
	private String board_attached_file;
	private Date board_regdate;
	private int board_readcnt;
	private int board_type;
	private int activity_able;
	private String activity_type;
	private int give_state;
	private int give_type;
	private int information_type;
	private int give_information_type;
	private String area_name;
	private String area_xpoint;
	private String area_ypoint;
	private String area_name_specific;
	private Date date_start_date;
	private Date date_end_date;
	private int score_category_a;
	private int score_category_b;
	private int score_category_c;
	private int score_category_d;
	private int alert_count;
	private int recommand_count;
	private int not_recommand_count;
	private String movie_subject;
	private String movie_id;
	private int counter;
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getBoard_notice_able() {
		return board_notice_able;
	}
	public void setBoard_notice_able(int board_notice_able) {
		this.board_notice_able = board_notice_able;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_attached_file() {
		return board_attached_file;
	}
	public void setBoard_attached_file(String board_attached_file) {
		this.board_attached_file = board_attached_file;
	}
	public Date getBoard_regdate() {
		return board_regdate;
	}
	public void setBoard_regdate(Date board_regdate) {
		this.board_regdate = board_regdate;
	}
	public int getBoard_readcnt() {
		return board_readcnt;
	}
	public void setBoard_readcnt(int board_readcnt) {
		this.board_readcnt = board_readcnt;
	}
	public int getBoard_type() {
		return board_type;
	}
	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}
	public int getActivity_able() {
		return activity_able;
	}
	public void setActivity_able(int activity_able) {
		this.activity_able = activity_able;
	}
	public String getActivity_type() {
		return activity_type;
	}
	public void setActivity_type(String activity_type) {
		this.activity_type = activity_type;
	}
	public int getGive_state() {
		return give_state;
	}
	public void setGive_state(int give_state) {
		this.give_state = give_state;
	}
	public int getGive_type() {
		return give_type;
	}
	public void setGive_type(int give_type) {
		this.give_type = give_type;
	}
	public int getInformation_type() {
		return information_type;
	}
	public void setInformation_type(int information_type) {
		this.information_type = information_type;
	}
	public int getGive_information_type() {
		return give_information_type;
	}
	public void setGive_information_type(int give_information_type) {
		this.give_information_type = give_information_type;
	}
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
	public String getArea_xpoint() {
		return area_xpoint;
	}
	public void setArea_xpoint(String area_xpoint) {
		this.area_xpoint = area_xpoint;
	}
	public String getArea_ypoint() {
		return area_ypoint;
	}
	public void setArea_ypoint(String area_ypoint) {
		this.area_ypoint = area_ypoint;
	}
	public String getArea_name_specific() {
		return area_name_specific;
	}
	public void setArea_name_specific(String area_name_specific) {
		this.area_name_specific = area_name_specific;
	}
	public Date getDate_start_date() {
		return date_start_date;
	}
	public void setDate_start_date(Date date_start_date) {
		this.date_start_date = date_start_date;
	}
	public Date getDate_end_date() {
		return date_end_date;
	}
	public void setDate_end_date(Date date_end_date) {
		this.date_end_date = date_end_date;
	}
	public int getScore_category_a() {
		return score_category_a;
	}
	public void setScore_category_a(int score_category_a) {
		this.score_category_a = score_category_a;
	}
	public int getScore_category_b() {
		return score_category_b;
	}
	public void setScore_category_b(int score_category_b) {
		this.score_category_b = score_category_b;
	}
	public int getScore_category_c() {
		return score_category_c;
	}
	public void setScore_category_c(int score_category_c) {
		this.score_category_c = score_category_c;
	}
	public int getScore_category_d() {
		return score_category_d;
	}
	public void setScore_category_d(int score_category_d) {
		this.score_category_d = score_category_d;
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
	public String getMovie_subject() {
		return movie_subject;
	}
	public void setMovie_subject(String movie_subject) {
		this.movie_subject = movie_subject;
	}
	public String getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}
	@Override
	public String toString() {
		return "Board [board_num=" + board_num + ", member_id=" + member_id + ", board_notice_able=" + board_notice_able
				+ ", board_subject=" + board_subject + ", board_content=" + board_content + ", board_attached_file="
				+ board_attached_file + ", board_regdate=" + board_regdate + ", board_readcnt=" + board_readcnt
				+ ", board_type=" + board_type + ", activity_able=" + activity_able + ", activity_type=" + activity_type
				+ ", give_state=" + give_state + ", give_type=" + give_type + ", information_type=" + information_type
				+ ", give_information_type=" + give_information_type + ", area_name=" + area_name + ", area_xpoint="
				+ area_xpoint + ", area_ypoint=" + area_ypoint + ", area_name_specific=" + area_name_specific
				+ ", date_start_date=" + date_start_date + ", date_end_date=" + date_end_date + ", score_category_a="
				+ score_category_a + ", score_category_b=" + score_category_b + ", score_category_c=" + score_category_c
				+ ", score_category_d=" + score_category_d + ", alert_count=" + alert_count + ", recommand_count="
				+ recommand_count + ", not_recommand_count=" + not_recommand_count + ", movie_subject=" + movie_subject
				+ ", movie_id=" + movie_id + "]";
	}
	public int getCounter() {
		return counter;
	}
	public void setCounter(int counter) {
		this.counter = counter;
	}
	
	
}
