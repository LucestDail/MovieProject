package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.CommentMapper;

public class CommentDao {
	private Class<CommentMapper> cls = CommentMapper.class;
	private Map<String, Object> map = new HashMap<>();

	public int maxnum() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxnum()+1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public boolean insert(Comment comment) {
		System.out.println("comment insert dao activated" + comment.getBoard_num() + "," + comment.getMember_id());
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("board_num", comment.getBoard_num());
			map.put("member_id", comment.getMember_id());
			map.put("comment_content", comment.getComment_content());
			map.put("comment_num", maxnum() + 1);
			System.out.println("request detail information : " + map);
			return session.getMapper(cls).insert(map) > 0 ? true : false;
		} catch (Exception e) {

		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public List<Comment> select(String board_num) {
		System.out.println("comment select dao activated -> " + board_num);
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("board_num", board_num);
			System.out.println("request detail information : " + map);
			return session.getMapper(cls).select(map);
		} catch (Exception e) {

		} finally {
			MyBatisConnection.close(session);
		}
		// TODO Auto-generated method stub
		return null;
	}

	public Comment selectOne(int comment_num) {
		System.out.println("comment selectOne dao activated -> " + comment_num);
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("comment_num", comment_num);
			System.out.println("request detail information : " + map);
			return session.getMapper(cls).selectOne(map);
		} catch (Exception e) {

		} finally {
			MyBatisConnection.close(session);
		}
		// TODO Auto-generated method stub
		return null;
	}

	public boolean update(Comment comment) {
		// TODO Auto-generated method stub
		System.out.println("comment update dao activated -> " + comment.getComment_num());
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("comment_num", comment.getComment_num());
			map.put("comment_content", comment.getComment_content());
			System.out.println("request detail information : " + map);
			return session.getMapper(cls).update(map);
		} catch (Exception e) {

		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public boolean delete(String comment_num) {
		// TODO Auto-generated method stub
		System.out.println("comment delete dao activated -> " + comment_num);
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("comment_num", comment_num);
			System.out.println("request detail information : " + map);
			return session.getMapper(cls).delete(map);
		} catch (Exception e) {

		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public void addPoint(String member_id, int board_type, int point) {
		// TODO Auto-generated method stub
		System.out.println("addPoint function : " + member_id);
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("member_id", member_id);
			map.put("point", point);
			System.out.println(map);
			switch (board_type) {
			case 0:
				session.getMapper(cls).addMoviePoint(map);
				break;
			case 1:
				session.getMapper(cls).addTheaterPoint(map);
				break;
			case 2:
				session.getMapper(cls).addInformationPoint(map);
				break;
			case 3:
				session.getMapper(cls).addGivePoint(map);
				break;
			case 4:
				session.getMapper(cls).addActivityPoint(map);
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
	}

	public boolean recommand(String comment_num) {
		System.out.println("recommand comment function -> " + comment_num);
		// TODO Auto-generated method stub
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("comment_num", comment_num);
			System.out.println(map);
			return session.getMapper(cls).recommand(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public boolean notRecommand(String comment_num) {
		System.out.println("not recommand comment function -> " + comment_num);
		// TODO Auto-generated method stub
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("comment_num", comment_num);
			System.out.println(map);
			return session.getMapper(cls).notRecommand(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public boolean alert(String comment_num) {
		System.out.println("alert comment function -> " + comment_num);
		// TODO Auto-generated method stub
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("comment_num", comment_num);
			System.out.println(map);
			return session.getMapper(cls).alert(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public List<Comment> selectmycomment(String member_id, int board_type) {
		// TODO Auto-generated method stub
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("member_id", member_id);
			map.put("board_type", board_type);
			return session.getMapper(cls).selectmycomment(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public List<Comment> selectrecentcomment() {
		// TODO Auto-generated method stub
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectrecentcomment();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

}
