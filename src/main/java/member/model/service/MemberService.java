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

}
