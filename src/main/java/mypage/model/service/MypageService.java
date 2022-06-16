package mypage.model.service;

import static common.JdbcTemplate.close;
import static common.JdbcTemplate.commit;
import static common.JdbcTemplate.getConnection;
import static common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import board.model.dto.Attachment;
import board.model.dto.Posting;
import board.model.dto.PostingAttach;
import board.model.dto.PostingExt;
import mypage.model.dao.MypageDao;

public class MypageService {
	
	private MypageDao mypageDao = new MypageDao();

	public List<Posting> findQuestionList(String memberId) {
		Connection conn = getConnection();
		
		List<Posting> list = mypageDao.findQuestionList(conn, memberId);
		System.out.println("service" + list);
		
		close(conn);
		return list;
	}


	public int insertQuestion(PostingExt posting) {
		int result = 0;
		Connection conn = getConnection();
		
		try {
			// posting에 등록
			result = mypageDao.insertQuestion(conn, posting);
			
			// attachment에 등록
			List<PostingAttach> attachments = ((PostingExt) posting).getAttachments();
			
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	

}
