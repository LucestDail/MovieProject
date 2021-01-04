package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.BoardMapper;

public class BoardDao {

	private Class<BoardMapper> cls = BoardMapper.class;
	private Map<String, Object> map = new HashMap<>();

	public int maxnum(int board_type) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxnum(board_type + "");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public boolean insert(Board board) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("board_num", board.getBoard_num());
			map.put("member_id", board.getMember_id());
			map.put("board_notice_able", board.getBoard_notice_able());
			map.put("board_subject", board.getBoard_subject());
			map.put("board_content", board.getBoard_content());
			map.put("board_attached_file", board.getBoard_attached_file());
			map.put("board_regdate", board.getBoard_regdate());
			map.put("board_readcnt", board.getBoard_readcnt());
			map.put("board_type", board.getBoard_type());
			map.put("activity_able", board.getActivity_able());
			map.put("activity_type", board.getActivity_type());
			map.put("give_state", board.getGive_state());
			map.put("give_type", board.getGive_type());
			map.put("information_type", board.getInformation_type());
			map.put("give_information_type", board.getGive_information_type());
			map.put("area_name", board.getArea_name());
			map.put("area_xpoint", board.getArea_xpoint());
			map.put("area_ypoint", board.getArea_ypoint());
			map.put("area_name_specific", board.getArea_name_specific());
			map.put("date_start_date", board.getDate_start_date());
			map.put("date_end_date", board.getDate_end_date());
			map.put("score_category_a", board.getScore_category_a());
			map.put("score_category_b", board.getScore_category_b());
			map.put("score_category_c", board.getScore_category_c());
			map.put("score_category_d", board.getScore_category_d());
			map.put("alert_count", board.getAlert_count());
			map.put("recommand_count", board.getRecommand_count());
			map.put("not_recommand_count", board.getNot_recommand_count());
			map.put("movie_subject", board.getMovie_subject());
			map.put("movie_id", board.getMovie_id());
			System.out.println(map);
			return session.getMapper(cls).insert(map) > 0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public int boardCount(String column, String find, String board_type) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			if (column != null) {
				String[] cols = column.split(",");
				switch (cols.length) {
				case 3:
					map.put("col3", cols[2]);
				case 2:
					map.put("col2", cols[1]);
				case 1:
					map.put("col1", cols[0]);
				}
			}
			map.put("find", find);
			map.put("board_type", board_type);
			return session.getMapper(cls).boardCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public List<Board> list(int pageNum, int limit, String column, String find, String board_type) {
		if (column == null) {
			System.out.println("list initialization...");
		} else {
			System.out.println("select list : " + column + "," + find);
		}
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			if (column != null) {
				String[] cols = column.split(",");
//				for(int i = 0; i < cols.length; i++) {
//					map.put("col"+(i+1), cols[i]);
//				}
				switch (cols.length) {
				case 3:
					map.put("col3", cols[2]);
				case 2:
					map.put("col2", cols[1]);
				case 1:
					map.put("col1", cols[0]);
				}
			}
			map.put("find", find);
			map.put("start", (pageNum - 1) * limit);
			map.put("limit", limit);
			map.put("board_type", board_type);
			System.out.println("select map specific details -> " + map);
			System.out.println(session.getMapper(cls).select(map));
			return session.getMapper(cls).select(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public Board selectOne(String board_num) {
		System.out.println("selectOne function : board_num value ->" + board_num);
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("board_num", board_num);
			System.out.println("map presentation -> " + map);
			return session.getMapper(cls).select(map).get(0);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}

		return null;
	}

	public void readcntAdd(String board_num) {
		System.out.println("readcntAdd function : " + board_num);
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("board_num", board_num);
			System.out.println(map);
			session.getMapper(cls).readcntAdd(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
	}

	public boolean update(Board board) {
		System.out.println("update function : " + board.getBoard_num());
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("board_num", board.getBoard_num());
			map.put("member_id", board.getMember_id());
			map.put("board_notice_able", board.getBoard_notice_able());
			map.put("board_subject", board.getBoard_subject());
			map.put("board_content", board.getBoard_content());
			map.put("board_attached_file", board.getBoard_attached_file());
			map.put("board_regdate", board.getBoard_regdate());
			map.put("board_readcnt", board.getBoard_readcnt());
			map.put("board_type", board.getBoard_type());
			map.put("activity_able", board.getActivity_able());
			map.put("activity_type", board.getActivity_type());
			map.put("give_state", board.getGive_state());
			map.put("give_type", board.getGive_type());
			map.put("information_type", board.getInformation_type());
			map.put("give_information_type", board.getGive_information_type());
			map.put("area_name", board.getArea_name());
			map.put("area_xpoint", board.getArea_xpoint());
			map.put("area_ypoint", board.getArea_ypoint());
			map.put("area_name_specific", board.getArea_name_specific());
			map.put("date_start_date", board.getDate_start_date());
			map.put("date_end_date", board.getDate_end_date());
			map.put("score_category_a", board.getScore_category_a());
			map.put("score_category_b", board.getScore_category_b());
			map.put("score_category_c", board.getScore_category_c());
			map.put("score_category_d", board.getScore_category_d());
			map.put("alert_count", board.getAlert_count());
			map.put("recommand_count", board.getRecommand_count());
			map.put("not_recommand_count", board.getNot_recommand_count());
			map.put("movie_subject", board.getMovie_subject());
			map.put("movie_id", board.getMovie_id());
			System.out.println(map);
			return session.getMapper(cls).update(map) > 0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public boolean delete(String board_num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("board_num", board_num);
			return session.getMapper(cls).delete(map) > 0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public List<Map<String, Object>> boardgraph() {
		System.out.println("BoardDao boardgraph activated");
		// TODO Auto-generated method stub
		SqlSession session = MyBatisConnection.getConnection();
		List<Map<String, Object>> list = null;
		try {
			list = session.getMapper(cls).graph();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return list;
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

	public boolean alert(Board board) {
		// TODO Auto-generated method stub
		System.out.println("alert function : " + board.getBoard_num());
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("board_num", board.getBoard_num());
			System.out.println(map);
			return session.getMapper(cls).alert(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public boolean recommand(Board board) {
		// TODO Auto-generated method stub
		System.out.println("recommand function : " + board.getBoard_num());
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("board_num", board.getBoard_num());
			System.out.println(map);
			return session.getMapper(cls).recommand(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public boolean notRecommand(Board board) {
		// TODO Auto-generated method stub
		System.out.println("not recommand function : " + board.getBoard_num());
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("board_num", board.getBoard_num());
			System.out.println(map);
			return session.getMapper(cls).notRecommand(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	public List<Board> readcntlist() {
		// TODO Auto-generated method stub
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectreadcntlist();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public List<Board> recommandlist() {
		// TODO Auto-generated method stub
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectrecommandlist();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public List<Board> noticelist() {
		// TODO Auto-generated method stub
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectnoticelist();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public List<Board> selectmyboard(String member_id, int board_type) {
		// TODO Auto-generated method stub
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("member_id", member_id);
			map.put("board_type", board_type);
			return session.getMapper(cls).selectmyboard(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public List<Board> selectrecentboard() {
		// TODO Auto-generated method stub
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectrecentboard();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
}
