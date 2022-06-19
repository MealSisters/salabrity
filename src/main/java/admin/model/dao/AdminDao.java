package admin.model.dao;

import static common.JdbcTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import admin.model.dto.SalesTrend;
import admin.model.exception.AdminException;
import board.model.dao.BoardDao;
import board.model.dto.BoardCode;
import board.model.dto.Posting;
import board.model.dto.PostingAttach;
import board.model.dto.Question;
import member.model.dto.Member;
import member.model.dto.MemberRole;
import product.model.dto.ProductAttach;

public class AdminDao {

	private Properties prop = new Properties();
	private BoardDao boardDao = new BoardDao(); 

	public AdminDao() {
		String filename = AdminDao.class.getResource("/sql/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getTotalMembers(Connection conn) {
		int totalMembers = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getTotalMembers");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				totalMembers = rset.getInt(1);
			}
		} catch (Exception e) {
			throw new AdminException("전체 회원수 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalMembers;
	}

	public List<Member> findAllMember(Connection conn, Map<String, Object> param) {
		List<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findAllMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (int) param.get("start"));
			pstmt.setInt(2, (int) param.get("end"));
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Member member = handleMemberResultSet(rset);
				list.add(member);
			}
		} catch (Exception e) {
			throw new AdminException("전체 회원목록 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	private Member handleMemberResultSet(ResultSet rset) throws SQLException {
		Member member = new Member();
		member.setMemberId(rset.getString("member_id"));
		member.setPassword(rset.getString("password"));
		member.setMemberName(rset.getString("member_name"));
		member.setGender(rset.getString("gender"));
		member.setBirthday(rset.getDate("birthday"));
		member.setEmail(rset.getString("email"));
		member.setPhone(rset.getString("phone"));
		member.setZipcode(rset.getString("zipcode"));
		member.setAddress(rset.getString("address"));
		member.setAddressDetail(rset.getString("address_detail"));
		member.setEnrollDate(rset.getDate("enroll_date"));
		member.setMemberRole(MemberRole.valueOf(rset.getString("member_role")));
		return member;
	}

	public List<Member> findMemberBy(Connection conn, Map<String, Object> param) {
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findMemberBy");
		try {
			pstmt = conn.prepareStatement(sql);
			if (!param.get("memberRole").equals("all")) {
				pstmt.setString(1, param.get("memberRole").toString());
				pstmt.setString(2, "");
			} else {
				pstmt.setString(1, MemberRole.A.toString());
				pstmt.setString(2, MemberRole.U.toString());
			}
			pstmt.setString(3, "%" + param.get("memberId").toString() + "%");
			pstmt.setString(4, "%" + param.get("memberName").toString() + "%");
			if (!param.get("gender").equals("all")) {
				pstmt.setString(5, param.get("gender").toString());
				pstmt.setString(6, "");
			} else {
				pstmt.setString(5, "F");
				pstmt.setString(6, "M");
			}
			pstmt.setString(7, "%" + param.get("phone").toString() + "%");
			pstmt.setInt(8, (int) param.get("start"));
			pstmt.setInt(9, (int) param.get("end"));

			rset = pstmt.executeQuery();
			while (rset.next()) {
				Member member = handleMemberResultSet(rset);
				list.add(member);
			}

		} catch (Exception e) {
			throw new AdminException("회원 검색결과 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int getFilteringMembers(Connection conn, Map<String, Object> param) {
		int totalMembers = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getFilteringMembers");
		try {
			pstmt = conn.prepareStatement(sql);
			if (!param.get("memberRole").equals("all")) {
				pstmt.setString(1, param.get("memberRole").toString());
				pstmt.setString(2, "");
			} else {
				pstmt.setString(1, MemberRole.A.toString());
				pstmt.setString(2, MemberRole.U.toString());
			}
			pstmt.setString(3, "%" + param.get("memberId").toString() + "%");
			pstmt.setString(4, "%" + param.get("memberName").toString() + "%");
			if (!param.get("gender").equals("all")) {
				pstmt.setString(5, param.get("gender").toString());
				pstmt.setString(6, "");
			} else {
				pstmt.setString(5, "F");
				pstmt.setString(6, "M");
			}
			pstmt.setString(7, "%" + param.get("phone").toString() + "%");

			rset = pstmt.executeQuery();
			while (rset.next()) {
				totalMembers = rset.getInt(1);
			}
		} catch (Exception e) {
			throw new AdminException("검색결과 회원수 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalMembers;
	}

	public int updateMemberRole(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateMemberRole");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemberRole().toString());
			pstmt.setString(2, member.getMemberId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new AdminException("회원 권한 변경 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int getEnrollMemberByDate(Connection conn, Date date) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getEnrollMemberByDate");
		int enrollMembers = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, date);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				enrollMembers = rset.getInt(1);
			}
		} catch (Exception e) {
			throw new AdminException("가입일 기준 회원 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return enrollMembers;
	}

	public List<SalesTrend> findSalesTrend(Connection conn, Map<String, Date> param) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<SalesTrend> list = new ArrayList<>();
		String sql = prop.getProperty("findSalesTrend");
		try {
			pstmt = conn.prepareStatement(sql);
			if (param.get("startDate") != null) {
				pstmt.setDate(1, param.get("startDate"));
			} else {
				pstmt.setDate(1, Date.valueOf("1000-01-01"));
			}
			if (param.get("endDate") != null) {
				pstmt.setDate(2, param.get("endDate"));
			} else {
				pstmt.setDate(2, Date.valueOf("5000-01-01"));
			}
			rset = pstmt.executeQuery();
			while (rset.next()) {
				SalesTrend st = new SalesTrend();
				st.setSalesDate(rset.getDate("payment_date"));
				st.setAmount(rset.getInt("sales"));
				list.add(st);
			}
		} catch (Exception e) {
			throw new AdminException("일자별 매출액 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public List<SalesTrend> findTopSalesTrend(Connection conn, Map<String, Date> param) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<SalesTrend> list = new ArrayList<>();
		String sql = prop.getProperty("findTopSalesTrend");
		try {
			pstmt = conn.prepareStatement(sql);
			if (param.get("startDate") != null) {
				pstmt.setDate(1, param.get("startDate"));
			} else {
				pstmt.setDate(1, Date.valueOf("1000-01-01"));
			}
			if (param.get("endDate") != null) {
				pstmt.setDate(2, param.get("endDate"));
			} else {
				pstmt.setDate(2, Date.valueOf("5000-01-01"));
			}
			rset = pstmt.executeQuery();
			while (rset.next()) {
				SalesTrend st = new SalesTrend();
				st.setProductName(rset.getString("product_name"));
				st.setAmount(rset.getInt("sales"));
				list.add(st);
			}
		} catch (SQLException e) {
			throw new AdminException("최고 매출 상품정보 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public List<Map<Date, Integer>> getEnrollMemberByPeriod(Connection conn, Map<String, Date> param) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Map<Date, Integer>> mapList = new ArrayList<>();
		String sql = prop.getProperty("getEnrollMemberByPeriod");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, param.get("startDate"));
			pstmt.setDate(2, param.get("endDate"));
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Map<Date, Integer> map = new HashMap<>();
				Date date = rset.getDate(1);
				Integer count = rset.getInt(2);
				map.put(date, count);
				mapList.add(map);
			}
		} catch (SQLException e) {
			throw new AdminException("최고 매출 상품정보 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return mapList;
	}

	public int getTodayPosting(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalPosting = 0;
		String sql = prop.getProperty("getTodayPosting");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				totalPosting = rset.getInt(1);
			}
		} catch (Exception e) {
			throw new AdminException("오늘 등록 게시글 수 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalPosting;
	}

	public List<Posting> findRecentQuestion(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Posting> list = new ArrayList<>();
		String sql = prop.getProperty("findRecentQuestion");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Posting posting = new Posting();
				posting.setPostingNo(rset.getInt("posting_no"));
				posting.setRegDate(rset.getDate("reg_date"));
				posting.setTitle(rset.getString("title"));
				list.add(posting);
			}
		} catch (Exception e) {
			throw new AdminException("최근등록 문의글 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getTodayOrder(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String sql = prop.getProperty("getTodayOrder");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException("오늘 주문수 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int getTotalQuestion(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String sql = prop.getProperty("getTotalQuestion");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (Exception e) {
			throw new AdminException("전체 질문글 수 조회 오류", e);
		}
		return result;
	}

	public List<Question> findAllQuestion(Connection conn, Map<String, Object> param) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<Question> list = new ArrayList<>();
		String sql = prop.getProperty("findAllQuestion");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (int) param.get("start"));
			pstmt.setInt(2, (int) param.get("end"));
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Question question = handleQuestionResultSet(rset);
				List<PostingAttach> attachs = boardDao.findPostingAttachByPostingNo(conn, question.getPostingNo());
				question.setAttachCount(attachs.size());
				question.setAttachments(attachs);
				list.add(question);
			}
		} catch (Exception e) {
			throw new AdminException("질문글 목록 조회 오류", e);
		}
		return list;
	}

	private Question handleQuestionResultSet(ResultSet rset) throws SQLException {
		Question question = new Question();
		question.setPostingNo(rset.getInt("posting_no"));
		question.setBoardCode(BoardCode.valueOf(rset.getString("board_code")));
		question.setMemberId(rset.getString("member_id"));
		question.setTitle(rset.getString("title"));
		question.setContent(rset.getString("content"));
		question.setRegDate(rset.getDate("reg_date"));
		question.setReadCount(rset.getInt("read_count"));
		question.setPostingLevel(rset.getInt("posting_level"));
		question.setPostingRef(rset.getInt("posting_ref"));
		question.setAnswerNo(rset.getInt("answer_no"));
		return question;
	}

	public Question findQuestion(Connection conn, int questionNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Question question = null;
		String sql = prop.getProperty("findQuestion");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, questionNo);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				question = handleQuestionResultSet(rset);
				List<PostingAttach> attachs = boardDao.findPostingAttachByPostingNo(conn, question.getPostingNo());
				question.setAttachCount(attachs.size());
				question.setAttachments(attachs);
			}
		} catch (Exception e) {
			throw new AdminException("글번호를 이용한 문의글 조회 오류", e);
		}
		return question;
	}
	
	

}
