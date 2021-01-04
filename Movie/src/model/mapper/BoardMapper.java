package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;

public interface BoardMapper {
	
	@Insert(" insert into board "+
				" (board_num, member_id, board_notice_able, board_subject, board_content, board_attached_file, board_regdate, board_readcnt, board_type, activity_able, activity_type, give_state, give_type, information_type, give_information_type, area_name, area_xpoint, area_ypoint, area_name_specific, date_start_date, date_end_date, score_category_a, score_category_b, score_category_c, score_category_d, alert_count, recommand_count, not_recommand_count, movie_subject, movie_id) "+
			" values "+
				" (#{board_num}, #{member_id}, #{board_notice_able}, #{board_subject}, #{board_content}, #{board_attached_file}, now(), 0, #{board_type}, #{activity_able}, #{activity_type}, #{give_state}, #{give_type}, #{information_type}, #{give_information_type}, #{area_name}, #{area_xpoint}, #{area_ypoint}, #{area_name_specific}, #{date_start_date}, #{date_end_date}, #{score_category_a}, #{score_category_b}, #{score_category_c}, #{score_category_d}, #{alert_count}, #{recommand_count}, #{not_recommand_count}, #{movie_subject}, #{movie_id}) "
		)
	int insert(Map map);
	
	@Select(" select "+
				" ifnull(max(board_num),0) "+
			" from "+
				" board ")
	int maxnum(@Param("boardname") String boardname);
	
	@Select({"<script> ",
		"select ",
			" count(*) ",
		" from ",
			" board ",
		"<trim prefix = 'where' prefixOverrides = 'AND || OR'>",
		"<if test = 'board_type != null'> ",
			"and board_type = #{board_type}",
		"</if>",
		"<if test = 'col1 != null'>",
			" and (${col1} like '%${find}%' ",
		"</if>",
		"<if test = 'col2 != null'>",
			" or ${col2} like '%${find}%'",
		"</if>",
		"<if test = 'col3 != null'>",
			" or ${col3} like '%${find}%'",
		"</if>",
		"<if test = 'col1 != null'>",
			" ) ",
		"</if>",
		"</trim>",
		"</script>"
		})
	int boardCount(Map map);
	
	
	@Select({"<script> ",
			"select * , (SELECT COUNT(*) FROM comment WHERE comment.board_num = board.board_num) counter ",
			" from ",
				" board ",
			"<trim prefix = 'where' prefixOverrides = 'AND || OR'>",
			"<if test = 'board_type != null'> ",
				"and board_type = #{board_type}",
			"</if>",
			"<if test = 'board_num != null'> ",
				"and board_num = #{board_num}",
			"</if>",
			"<if test = 'col1 != null'>",
				" and (${col1} like '%${find}%' ",
			"</if>",
			"<if test = 'col2 != null'>",
				" or ${col2} like '%${find}%'",
			"</if>",
			"<if test = 'col3 != null'>",
				" or ${col3} like '%${find}%'",
			"</if>",
			"<if test = 'col1 != null'>",
				" ) ",
			"</if>",
			"</trim>",
			"<if test = 'board_num != null'> ",
				" group by board_num ",
			"</if>",			
			"<if test = 'start != null'> ",
				"order by board_num desc limit ${start},${limit}",
			"</if>",
			"</script>"
			})
	List<Board> select(Map map);
	
	@Select({"<script> ",
		"select ",
			" board.*, board.board_num, (SELECT COUNT(*) FROM comment WHERE comment.board_num = board.board_num)  ",
		"from ",
			" board ",
		"<if test = 'board_type != null'>",
			"where board.board_type = #{board_type}",
		"</if>",
		"group by board.board_num",
		"<if test = 'start != null'> ",
			"order by board.board_num asc limit ${start},${limit}",
		"</if>",
		"</script>"
		})
	List<Board> selectboardList(Map map);
	
	
	@Update("update board set board_readcnt = (board_readcnt+1) where board_num = #{board_num}")
	void readcntAdd(Map map);


	
	@Update({"<script> ",
		" update ",
			" board ",
		"<trim prefix = 'set' prefixOverrides = ','>",
			", board_regdate = now()",
		"<if test = 'board_notice_able != null'> ",
			", board_notice_able = #{board_notice_able}",
		"</if>",
		"<if test = 'board_subject != null'> ",
			", board_subject = #{board_subject}",
		"</if>",
		"<if test = 'board_content != null'> ",
			", board_content = #{board_content}",
		"</if>",
		"<if test = 'board_attached_file != null'> ",
			", board_attached_file = #{board_attached_file}",
		"</if>",
		"<if test = 'activity_able != null'> ",
		", activity_able = #{activity_able}",
		"</if>",
		"<if test = 'activity_type != null'> ",
		", activity_type = #{activity_type}",
		"</if>",
		"<if test = 'give_state != null'> ",
		", give_state = #{give_state}",
		"</if>",
		"<if test = 'give_type != null'> ",
		", give_type = #{give_type}",
		"</if>",
		"<if test = 'information_type != null'> ",
		", information_type = #{information_type}",
		"</if>",
		"<if test = 'give_information_type != null'> ",
		", give_information_type = #{give_information_type}",
		"</if>",
		"<if test = 'area_name != null'> ",
		", area_name = #{area_name}",
		"</if>",
		"<if test = 'area_xpoint != null'> ",
		", area_xpoint = #{area_xpoint}",
		"</if>",
		"<if test = 'area_ypoint != null'> ",
		", area_ypoint = #{area_ypoint}",
		"</if>",
		"<if test = 'area_name_specific != null'> ",
		", area_name_specific = #{area_name_specific}",
		"</if>",
		"<if test = 'date_start_date != null'> ",
		", date_start_date = #{date_start_date}",
		"</if>",
		"<if test = 'date_end_date != null'> ",
		", date_end_date = #{date_end_date}",
		"</if>",
		"<if test = 'score_category_a != null'> ",
		", score_category_a = #{score_category_a}",
		"</if>",
		"<if test = 'score_category_b != null'> ",
		", score_category_b = #{score_category_b}",
		"</if>",
		"<if test = 'score_category_c != null'> ",
		", score_category_c = #{score_category_c}",
		"</if>",
		"<if test = 'score_category_d != null'> ",
		", score_category_d = #{score_category_d}",
		"</if>",
		"<if test = 'alert_count1 != null'> ",
		", alert_count = #{alert_count}",
		"</if>",
		"<if test = 'recommand_count != null'> ",
		", recommand_count = #{recommand_count}",
		"</if>",
		"<if test = 'not_recommand_count != null'> ",
		", not_recommand_count = #{not_recommand_count}",
		"</if>",
		"<if test = 'movie_subject != null'> ",
		", movie_subject = #{movie_subject}",
		"</if>",
		"<if test = 'movie_id != null'> ",
		", movie_id = #{movie_id}",
		"</if>",
		"</trim>",
		" where ",
			" board_num = ${board_num} ",
		"</script>"})
	int update(Map map);
	
	
	@Delete(" delete from "+
				" board "+
			" where "+
				" board_num = ${board_num} ")
	int delete(Map map);
	
	
	@Select(" select member_id, count(*) cnt from board group by member_id having count(*) >= 1 order by cnt desc")
	List<Map<String, Object>> graph();

	@Update( "update member set member_movie_point = member_movie_point + #{point} where member_id = #{member_id} ")
	void addMoviePoint(Map<String, Object> map);
	
	@Update( "update member set member_information_point = member_information_point + #{point} where member_id = #{member_id} ")
	void addInformationPoint(Map<String, Object> map);
	
	@Update( "update member set member_give_point = member_give_point + #{point} where member_id = #{member_id} ")
	void addGivePoint(Map<String, Object> map);
	
	@Update( "update member set member_theater_point = member_theater_point + #{point} where member_id = #{member_id} ")
	void addTheaterPoint(Map<String, Object> map);
	
	@Update( "update member set member_activity_point = member_activity_point + #{point} where member_id = #{member_id} ")
	void addActivityPoint(Map<String, Object> map);

	@Update( "update board set alert_count = alert_count+1 where board_num = #{board_num}")
	boolean alert(Map<String, Object> map);
	
	@Update( "update board set recommand_count = recommand_count+1 where board_num = #{board_num}")
	boolean recommand(Map<String, Object> map);
	
	@Update( "update board set not_recommand_count = not_recommand_count+1 where board_num = #{board_num}")
	boolean notRecommand(Map<String, Object> map);

	@Select(" select * from board order by board_readcnt desc limit 0,10 ")
	List<Board> selectreadcntlist();
	@Select(" select * from board order by recommand_count desc limit 0,10 ")
	List<Board> selectrecommandlist();
	@Select(" select * from board where board_notice_able = 1 order by board_num desc limit 0,10")
	List<Board> selectnoticelist();
	
	@Select(" select * from board where member_id = #{member_id} and board_type = #{board_type}")
	List<Board> selectmyboard(Map<String, Object> map);

	@Select(" select * from board order by board_regdate desc limit 0,10")
	List<Board> selectrecentboard();
}
