package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Comment;

public interface CommentMapper {
	
	@Insert(" insert into comment (comment_num, board_num, member_id, comment_content, comment_regdate, alert_count, recommand_count, not_recommand_count) values (#{comment_num}, #{board_num}, #{member_id}, #{comment_content}, now(), 0,0,0)")
	int insert(Map map);

	@Select(" select * from comment where board_num = #{board_num} order by comment_regdate desc")
	List<Comment> select(Map<String, Object> map);

	@Select(" select count(*) from comment")
	int maxnum();
	
	@Select(" select * from comment where comment_num = #{comment_num}")
	Comment selectOne(Map<String, Object> map);

	@Update(" update comment set comment_content = #{comment_content} where comment_num = #{comment_num}")
	boolean update(Map<String, Object> map);

	@Delete(" delete from comment where comment_num = #{comment_num}")
	boolean delete(Map<String, Object> map);

	@Update(" update member set member_movie_point = member_movie_point + #{point} where member_id = #{member_id}")
	void addMoviePoint(Map<String, Object> map);
	
	@Update(" update member set member_theater_point = member_theater_point + #{point} where member_id = #{member_id}")
	void addTheaterPoint(Map<String, Object> map);

	@Update(" update member set member_information_point = member_information_point + #{point} where member_id = #{member_id}")
	void addInformationPoint(Map<String, Object> map);

	@Update(" update member set member_give_point = member_give_point + #{point} where member_id = #{member_id}")
	void addGivePoint(Map<String, Object> map);

	@Update(" update member set member_activity_point = member_activity_point + #{point} where member_id = #{member_id}")
	void addActivityPoint(Map<String, Object> map);
	@Update(" update comment set recommand_count = recommand_count+1 where comment_num = #{comment_num}")
	boolean recommand(Map<String, Object> map);
	@Update(" update comment set not_recommand_count = not_recommand_count+1 where comment_num = #{comment_num}")
	boolean notRecommand(Map<String, Object> map);
	@Update(" update comment set alert_count = alert_count+1 where comment_num = #{comment_num}")
	boolean alert(Map<String, Object> map);
	
	@Select( " SELECT * FROM board,comment "
			+ " WHERE comment.board_num = board.board_num "
			+ " AND board.board_type = #{board_type} "
			+ " and comment.member_id = #{meeber_id}")
	List<Comment> selectmycomment(Map<String, Object> map);
	@Select(" select * from comment order by comment_regdate desc limit 0,10")
	List<Comment> selectrecentcomment();
}
