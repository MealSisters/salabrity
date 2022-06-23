package mypage.model.dao;

import static common.JdbcTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import mypage.model.dto.Destination;
import mypage.model.exception.DestinationException;
import product.model.exception.ProductException;

public class DestinationDao {
	private Properties prop = new Properties();
	public DestinationDao() {
		String fileName = DestinationDao.class.getResource("/sql/destination-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//아이디로 배송지 리스트 조회
	public List<Destination> findById(Connection conn, String memberId) {
		String sql = prop.getProperty("findById");
		PreparedStatement pstmt = null;
		List<Destination> list = new ArrayList<>();
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Destination destination = handleDestinationResultSet(rset);
				list.add(destination);
			}
		} catch (Exception e) {
			throw new DestinationException("배송지목록 조회 오류", e);
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public Destination handleDestinationResultSet(ResultSet rset) throws SQLException {
		Destination destination = new Destination();
		destination.setShippingAddressNo(rset.getInt("shipping_address_no"));
		destination.setMemberId(rset.getString("member_id"));
		destination.setTelephone(rset.getString("telephone"));
		destination.setZipcode(rset.getString("zipcode"));
		destination.setAddress(rset.getString("address"));
		destination.setAddressDetail(rset.getString("address_detail"));
		destination.setIsDefault(rset.getString("is_default"));
		destination.setShippingPerson(rset.getString("shipping_person"));
		destination.setDelFlag(rset.getString("del_flag"));
		return destination;
	}

	//기본배송지 수 
	public int getByIdDefaultCount(Connection conn, Destination destination) {
		String sql = prop.getProperty("getByIdDefaultCount");
		PreparedStatement pstmt = null;
		int  defaultCount = 0;
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, destination.getMemberId());
			rset = pstmt.executeQuery();
			while(rset.next()) {
				defaultCount = rset.getInt(1);			
			}
		} catch (SQLException e) {
			throw new DestinationException("기본배송지 개수 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return defaultCount;
	}
	//배송지 등록
	public int insertDestination(Connection conn, Destination destination) {
		PreparedStatement pstmt = null;
		int result = 0;		
		String sql = prop.getProperty("insertDestination");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, destination.getMemberId());
			pstmt.setString(2, destination.getTelephone());
			pstmt.setString(3, destination.getZipcode());
			pstmt.setString(4, destination.getAddress());
			pstmt.setString(5, destination.getAddressDetail());
			pstmt.setString(6, destination.getIsDefault());
			pstmt.setString(7, destination.getShippingPerson());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new DestinationException("배송지 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;		
	}
//기본배송지 'N'
	public int updateNotDefaultDestination(Connection conn, String memberId) {
		String sql = prop.getProperty("updateNotDefaultDestination");
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, memberId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new DestinationException("기본배송지 플래그 변경 오류", e);
		} finally {
			close(pstmt);
		}
		return result;		
	}
	
//기본배송지로 업데이트
	public int updateDefaultDestination(Connection conn, int shippingAddressNo) {
		String sql = prop.getProperty("updateDefaultDestination");
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);	
			pstmt.setInt(1, shippingAddressNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new DestinationException("기본배송지 수정 오류", e);
		} finally {
			close(pstmt);
		}
		return result;		
}
	//배송지 삭제처리
	public int delFlagUpdateY(Connection conn, int shippingAddressNo) {
		String sql = prop.getProperty("delFlagUpdateY");
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);	
			pstmt.setInt(1, shippingAddressNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new DestinationException("배송지 삭제? 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}
//아이디로 기본배송지 조회
	public Destination findDefaultDestinationById(Connection conn, String memberId) {
		String sql = prop.getProperty("findDefaultDestinationById");
		PreparedStatement pstmt = null;
		Destination destination = null;
		ResultSet rset = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				destination = handleDestinationResultSet(rset);
			}
		} catch (Exception e) {
			throw new DestinationException("기본배송지 조회 오류", e);
		}finally {
			close(rset);
			close(pstmt);
		}
		return destination;
	}
	public Destination findDestinationByShippingAddressNo(Connection conn, int shippingAddressNo) {
		String sql = prop.getProperty("findDestinationByShippingAddressNo");
		PreparedStatement pstmt = null;
		Destination destination = null;
		ResultSet rset = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, shippingAddressNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				destination = handleDestinationResultSet(rset);
			}
		} catch (Exception e) {
			throw new DestinationException("배송지 번호로 배송지 조회 오류", e);
		}finally {
			close(rset);
			close(pstmt);
		}
		return destination;
	}

	/*-------------------------------------- 이은지 start --------------------------------------*/
	public int findCurrentDestNo(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int destNo = 0;
		String sql = prop.getProperty("findCurrentDestNo");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				destNo = rset.getInt(1);
			}
		} catch (Exception e) {
			throw new ProductException("최근 등록 배송지 고유번호 조회 오류", e);
		} finally {
			close(pstmt);
		}
		return destNo;
	}
	/*--------------------------------------- 이은지 end ---------------------------------------*/

	



}
