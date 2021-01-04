package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.Activity_EncounterMapper;

public class Activity_EncounterDao {
	private Class<Activity_EncounterMapper> cls = Activity_EncounterMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	public boolean insert(Activity_Encounter ae) {
		System.out.println("ae insert dao activated" + ae.getBoard_num() + "," + ae.getMember_id());
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("board_num", ae.getBoard_num());
			map.put("member_id", ae.getMember_id());
			System.out.println("ae request detail information : " + map);
			return session.getMapper(cls).insert(map) > 0 ? true : false;
		} catch (Exception e) {

		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public boolean select(Activity_Encounter ae) {
		System.out.println("ae select dao activated" + ae.getBoard_num() + "," + ae.getMember_id());
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("board_num", ae.getBoard_num());
			map.put("member_id", ae.getMember_id());
			System.out.println("request detail information : " + map);
			return session.getMapper(cls).select(map) > 0 ? true : false;
		} catch (Exception e) {

		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public boolean delete(Activity_Encounter ae) {
		System.out.println("ae insert dao activated" + ae.getBoard_num() + "," + ae.getMember_id());
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("board_num", ae.getBoard_num());
			map.put("member_id", ae.getMember_id());
			System.out.println("request detail information : " + map);
			return session.getMapper(cls).delete(map) > 0 ? true : false;
		} catch (Exception e) {

		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public List<Activity_Encounter> selectmember(String board_num) {
		System.out.println("ae selectmember dao activated" + board_num);
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("board_num", board_num);
			System.out.println("request detail information : " + map);
			return session.getMapper(cls).selectmember(map);
		} catch (Exception e) {

		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
}
