package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.MemberMapper;

public class MemberDao {
	
	private Class<MemberMapper> cls = MemberMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	public int insert(Member mem) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).insert(mem);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	public Member selectOne(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("member_id", id);
			System.out.println(session.getMapper(cls).select(map).get(0));
			return session.getMapper(cls).select(map).get(0);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public int update(Member mem) {
		System.out.println("update has been activated");
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).update(mem);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	public List<Member> list() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			return session.getMapper(cls).select(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	public int delete(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int updatePass(String id, String chgpass) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("member_id", id);
			Member mem = session.getMapper(cls).select(map).get(0);
			mem.setMember_password(chgpass);
			return session.getMapper(cls).update(mem);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	
	public String idSearch(String email) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("member_email", email);
			return session.getMapper(cls).select(map).get(0).getMember_id();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	public String pwSearch(String id, String email) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("member_id", id);
			map.put("member_email", email);
			return session.getMapper(cls).select(map).get(0).getMember_password();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	
}
