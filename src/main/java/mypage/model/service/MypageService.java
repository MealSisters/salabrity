package mypage.model.service;

import static common.JdbcTemplate.close;
import static common.JdbcTemplate.commit;
import static common.JdbcTemplate.getConnection;
import static common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import board.model.dto.Posting;
import board.model.dto.PostingAttach;
import board.model.dto.PostingExt;
import member.model.dto.Member;
import mypage.model.dao.MypageDao;

public class MypageService {
	
	public static final int Num_PER_PAGE = 10;
	private MypageDao mypageDao = new MypageDao();

	public List<Posting> findQuestionList(String memberId) {
		Connection conn = getConnection();
		
		List<Posting> list = mypageDao.findQuestionList(conn, memberId);
		System.out.println("service" + list);
		
		close(conn);
		return list;
	}


	public int insertQuestion(Posting posting) {
		int result = 0;
		Connection conn = getConnection();
		
		try {

			// posting에 등록
			result = mypageDao.insertQuestion(conn, posting); // nextval
			
			// 2. pk 가져오기
			int no = mypageDao.findCurrentQuestionNo(conn); // currval
			posting.setPostingNo(no);
			System.out.println("등록된 posting no" + no);
			
			// attachment에 등록
			List<PostingAttach> attachments = ((PostingExt) posting).getAttachments();
			if(attachments != null && !attachments.isEmpty()) {
				for(PostingAttach attach : attachments) {
					attach.setPostingNo(no);
					result = mypageDao.insertAttachment(conn, attach);
				}
			}
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}


	public List<Posting> MyWriteList(String memberId, int start, int end) {
		Connection conn = getConnection();
		
		List<Posting> list = mypageDao.MyWriteList(conn, memberId, start, end);
		System.out.println("service" + list);
		
		close(conn);
		return list;
	}


	public int MyWriteTotal(String memberId) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = mypageDao.MyWriteTotal(conn, memberId);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}


	public List<Posting> findBy(String memberId, Map<String, String> param) {
		Connection conn = getConnection();
		List<Posting> list = mypageDao.findBy(conn, memberId, param);
		close(conn);
		return list;
	}


	public List<Posting> searchMyWriteList(String memberId, Map<String, String> param, int start, int end) {
		Connection conn = getConnection();
		List<Posting> list = mypageDao.searchMyWriteList(conn, memberId, param, start, end);
		close(conn);
		return list;
	}


	public int searchMyWriteListCount(String memberId, Map<String, String> param) {
		Connection conn = getConnection();
		int totalContents = mypageDao.searchMyBoardListCount(conn, memberId, param);
		close(conn);
		return totalContents;
	}


	public PostingExt findByNo(int no) {
		Connection conn = getConnection();
		
		PostingExt posting = mypageDao.findByNo(conn, no);
		List<PostingAttach> attachments = mypageDao.findAttachmentByNo(conn, no);
		
		posting.setAttachments(attachments);
		System.out.println("서비스" + posting);
		close(conn);
		
		return posting;
	}




}
