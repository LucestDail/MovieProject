package model;

public class Member {
	private String member_id;
	private int member_is_admin;
	private String member_password;
	private String member_nickname;
	private int member_age;
	private int member_gender;
	private String member_email;
	private int member_email_receive_ok;
	private String member_picture;
	private String member_introduction;
	private int member_movie_point;
	private int member_information_point;
	private int member_activity_point;
	private int member_give_point;
	private int member_theater_point;
	private String member_genre;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getMember_is_admin() {
		return member_is_admin;
	}
	public void setMember_is_admin(int member_is_admin) {
		this.member_is_admin = member_is_admin;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public int getMember_age() {
		return member_age;
	}
	public void setMember_age(int member_age) {
		this.member_age = member_age;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public int getMember_email_receive_ok() {
		return member_email_receive_ok;
	}
	public void setMember_email_receive_ok(int member_email_receive_ok) {
		this.member_email_receive_ok = member_email_receive_ok;
	}
	public String getMember_picture() {
		return member_picture;
	}
	public void setMember_picture(String member_picture) {
		this.member_picture = member_picture;
	}
	public String getMember_introduction() {
		return member_introduction;
	}
	public void setMember_introduction(String member_introduction) {
		this.member_introduction = member_introduction;
	}
	public int getMember_movie_point() {
		return member_movie_point;
	}
	public void setMember_movie_point(int member_movie_point) {
		this.member_movie_point = member_movie_point;
	}
	public int getMember_information_point() {
		return member_information_point;
	}
	public void setMember_information_point(int member_information_point) {
		this.member_information_point = member_information_point;
	}
	public int getMember_activity_point() {
		return member_activity_point;
	}
	public void setMember_activity_point(int member_activity_point) {
		this.member_activity_point = member_activity_point;
	}
	public int getMember_give_point() {
		return member_give_point;
	}
	public void setMember_give_point(int member_give_point) {
		this.member_give_point = member_give_point;
	}
	public int getMember_theater_point() {
		return member_theater_point;
	}
	public void setMember_theater_point(int member_theater_point) {
		this.member_theater_point = member_theater_point;
	}
	public int getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(int member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_genre() {
		return member_genre;
	}
	public void setMember_genre(String member_genre) {
		this.member_genre = member_genre;
	}
	@Override
	public String toString() {
		return "Member [member_id=" + member_id + ", member_is_admin=" + member_is_admin + ", member_password="
				+ member_password + ", member_nickname=" + member_nickname + ", member_age=" + member_age
				+ ", member_gender=" + member_gender + ", member_email=" + member_email + ", member_email_receive_ok="
				+ member_email_receive_ok + ", member_picture=" + member_picture + ", member_introduction="
				+ member_introduction + ", member_movie_point=" + member_movie_point + ", member_information_point="
				+ member_information_point + ", member_activity_point=" + member_activity_point + ", member_give_point="
				+ member_give_point + ", member_theater_point=" + member_theater_point + ", member_genre="
				+ member_genre + "]";
	}

	
	
}