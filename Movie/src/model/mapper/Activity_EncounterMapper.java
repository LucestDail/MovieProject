package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Activity_Encounter;

public interface Activity_EncounterMapper {

	@Insert(" insert into activity_encounter (member_id, board_num) values (#{member_id}, #{board_num})")
	int insert(Map<String, Object> map);
	
	@Select(" select * from activity_encounter where member_id = #{member_id} and board_num = #{board_num}")
	int select(Map<String, Object> map);
	
	@Delete(" delete from activity_encounter where board_num = #{board_num} and member_id = #{member_id}")
	int delete(Map<String, Object> map);

	@Select(" select member_id from activity_encounter where board_num = #{board_num}")
	List<Activity_Encounter> selectmember(Map<String, Object> map);
}
