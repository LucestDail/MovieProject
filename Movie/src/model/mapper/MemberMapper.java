package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;

public interface MemberMapper {
	@Insert(" insert into Member "+
				" (member_id, member_is_admin, member_password, member_nickname, member_gender, member_age, member_email, member_email_receive_ok, member_picture, member_introduction, member_genre, member_movie_point, member_information_point, member_activity_point, member_give_point, member_theater_point) "+
			" values "+
				" (#{member_id}, #{member_is_admin}, #{member_password}, #{member_nickname}, #{member_gender}, #{member_age}, #{member_email}, #{member_email_receive_ok}, #{member_picture}, #{member_introduction}, #{member_genre}, 0, 0, 0, 0, 0) "
			)
	int insert(Member mem);

	@Select({"<script> ",
			"select ",
				" * ",
			" from",
				" member ",
			"<trim prefix = 'where' prefixOverrides = 'AND || OR'>",
			"<if test = 'member_id != null'>",
			"and member_id = #{member_id}",
			"</if>",
			"<if test = 'member_is_admin != null'>",
			"and member_is_admin = #{member_is_admin}",
			"</if>",
			"<if test = 'member_password != null'>",
			"and member_password = #{member_password}",
			"</if>",
			"<if test = 'member_nickname != null'>",
			"and member_nickname = #{member_nickname}",
			"</if>",
			"<if test = 'member_age != null'>",
			"and member_age = #{member_age}",
			"</if>",
			"<if test = 'member_gender != null'>",
			"and member_gender = #{member_gender}",
			"</if>",
			"<if test = 'member_email != null'>",
			"and member_email = #{member_email}",
			"</if>",
			"<if test = 'member_email_receive_ok != null'>",
			"and member_email_receive_ok = #{member_email_receive_ok}",
			"</if>",
			"<if test = 'member_picture != null'>",
			"and member_picture = #{member_picture}",
			"</if>",
			"<if test = 'member_introduction != null'>",
			"and member_introduction = #{member_introduction}",
			"</if>",
			"<if test = 'member_movie_point != null'>",
			"and member_movie_point = #{member_movie_point}",
			"</if>",
			"<if test = 'member_information_point != null'>",
			"and member_information_point = #{member_information_point}",
			"</if>",
			"<if test = 'member_activity_point != null'>",
			"and member_activity_point = #{member_activity_point}",
			"</if>",
			"<if test = 'member_give_point != null'>",
			"and member_give_point = #{member_give_point}",
			"</if>",
			"<if test = 'member_theater_point != null'>",
			"and member_theater_point = #{member_theater_point}",
			"</if>",
			"<if test = 'member_genre != null'>",
			"and member_genre = #{member_genre}",
			"</if>",
			"</trim>",
			"</script>"})
	List<Member> select(Map<String, Object> map);

	@Update({"<script> ",
		" update ",
			" member ",
		"<trim prefix = 'set' prefixOverrides = ','>",
		"<if test = 'member_is_admin != null'>",
		", member_is_admin = #{member_is_admin}",
		"</if>",
		"<if test = 'member_password != null'>",
		", member_password = #{member_password}",
		"</if>",
		"<if test = 'member_nickname != null'>",
		", member_nickname = #{member_nickname}",
		"</if>",
		"<if test = 'member_age != null'>",
		", member_age = #{member_age}",
		"</if>",
		"<if test = 'member_gender != null'>",
		", member_gender = #{member_gender}",
		"</if>",
		"<if test = 'member_email != null'>",
		", member_email = #{member_email}",
		"</if>",
		"<if test = 'member_email_receive_ok != null'>",
		", member_email_receive_ok = #{member_email_receive_ok}",
		"</if>",
		"<if test = 'member_picture != null'>",
		", member_picture = #{member_picture}",
		"</if>",
		"<if test = 'member_introduction != null'>",
		", member_introduction = #{member_introduction}",
		"</if>",
		"<if test = 'member_movie_point != null'>",
		", member_movie_point = #{member_movie_point}",
		"</if>",
		"<if test = 'member_information_point != null'>",
		", member_information_point = #{member_information_point}",
		"</if>",
		"<if test = 'member_activity_point != null'>",
		", member_activity_point = #{member_activity_point}",
		"</if>",
		"<if test = 'member_give_point != null'>",
		", member_give_point = #{member_give_point}",
		"</if>",
		"<if test = 'member_theater_point != null'>",
		", member_theater_point = #{member_theater_point}",
		"</if>",
		"<if test = 'member_genre != null'>",
		", member_genre = #{member_genre}",
		"</if>",	
		"</trim>",
		" where ",
			" member_id = #{member_id} ",
		"</script>"})
	int update(Member mem);
	
	@Delete(" delete from "+
				" member "+
			" where "+
				" member_id = #{id}")
	int delete(@Param("id") String id);

	@Update("update member set member_password = #{pass} where member_id = #{id}")
	int updatePass(@Param("id") String id,@Param("pass") String pass);
	
	
}
