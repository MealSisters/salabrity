package mypage.model.service;

import static common.JdbcTemplate.close;
import static common.JdbcTemplate.*;
import static common.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import mypage.model.dao.DestinationDao;
import mypage.model.dto.Destination;


public class DestinationService {

	private DestinationDao destinationDao = new DestinationDao();
	
	public List<Destination> findById(String memberId) {
		Connection conn = getConnection();
		List<Destination> list = destinationDao.findById(conn, memberId);
		close(conn);
		return list;
	}

	//배송지 등록
	public int insertDestination(Destination destination) {
		Connection conn = getConnection();
		int result = 0;
		try {
			String isDefault = "N";
			if( 0 == destinationDao.getByIdDefaultCount(conn, destination)) {
				isDefault = "Y";
			}
			destination.setIsDefault(isDefault);
			result = destinationDao.insertDestination(conn, destination);
			
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public int updateDefaultDestination(Destination destination) {
		Connection conn = getConnection();
		int result = 0;
		try {
			//id로 기본 배송지 'N'으로 업데이트
			result = destinationDao.updateNotDefaultDestination(conn,destination.getMemberId());
			//기본 배송지 새로 설정
			result = destinationDao.updateDefaultDestination(conn,destination.getShippingAddressNo());
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public int delFlagUpdateY(Destination destination) {
		Connection conn = getConnection();
		int result = 0;
		try {
			//del_flag값 Y로 업데이트
			result = destinationDao.delFlagUpdateY(conn,destination.getShippingAddressNo());
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public Destination findDefaultDestinationById(String memberId) {
		Connection conn = getConnection();
		Destination destination = destinationDao.findDefaultDestinationById(conn, memberId);
		close(conn);
		return destination;
	}
	
	public Destination findDestinationByShippingAddressNo(int shippingAddressNo) {
		Connection conn = getConnection();
		Destination destination = destinationDao.findDestinationByShippingAddressNo(conn, shippingAddressNo);
		close(conn);
		return destination;
	}
	


	/*-------------------------------------- 이은지 start --------------------------------------*/
	
	public int insertDestinationReturnDestNo(Destination destination) {
		Connection conn = getConnection();
		int result = 0;
		int destNo = 0;
		try {
			String isDefault = "N";
			if( 0 == destinationDao.getByIdDefaultCount(conn, destination)) {
				isDefault = "Y";
			}
			destination.setIsDefault(isDefault);
			result = destinationDao.insertDestination(conn, destination);
			destNo = destinationDao.findCurrentDestNo(conn);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return destNo;
	}
	
	/*--------------------------------------- 이은지 end ---------------------------------------*/
	

}
