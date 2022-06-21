package member.model.service;

import static common.JdbcTemplate.*;

import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.dto.Member;

public class MemberService {
	
	private MemberDao memberDao = new MemberDao();

	public Member findByMemberId(String memberId) {
		Connection conn = getConnection();
		Member member = memberDao.findByMemberId(conn, memberId);
		close(conn);
		return member;
	}

	public int insertMember(Member member) {
		int result = 0;
		Connection conn = getConnection();
		
		try {
			result = memberDao.insertMember(conn, member);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		
		return result;
	}

	public int deleteMember(String memberId) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = memberDao.deleteMember(conn, memberId);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public int updateMember(Member member) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = memberDao.updateMember(conn, member);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public int updatePassword(Member member) {
		int result = 0;
		Connection conn = getConnection();

		try {
			result = memberDao.updatePassword(conn, member);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public String findId(String memberName, String phone) {
		Connection conn = getConnection();
		
			String findId = memberDao.findId(conn, memberName, phone);
		
			close(conn);
		return findId;
	}

	public Member findByMemberEmail(String email) {
		Connection conn = getConnection();
		Member member = memberDao.findByMemberEmail(conn, email);
		close(conn);
		return member;
	}

	public int findPwdUpdate(Member member) {
		Connection conn = getConnection();
		int result = memberDao.findPwdUpdate(conn, member);
		
			commit(conn);
		
			rollback(conn);
		
		close(conn);
		return result;
	}
	
}
