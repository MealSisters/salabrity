package calendar.model.dao;

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

import calendar.model.dto.Calendar;
import calendar.model.dto.CalendarExt;
import calendar.model.dto.WeekDayCode;
import calendar.model.exception.CalendarException;

public class CalendarDao {
	
private Properties prop = new Properties();
	
	public CalendarDao() {
		String filename = CalendarDao.class.getResource("/sql/calendar-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<CalendarExt> findRecentProductCal(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<CalendarExt> calList = new ArrayList<>();
		String sql = prop.getProperty("findRecentProductCal");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				CalendarExt cal = handleCalendarExtResultSet(rset);
				calList.add(cal);
			}
		} catch (Exception e) {
			throw new CalendarException("최근 상품 캘린더 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return calList;
	}

	private CalendarExt handleCalendarExtResultSet(ResultSet rset) throws SQLException {
		CalendarExt cal = new CalendarExt();
		cal.setCalNo(rset.getInt("cal_no"));
		cal.setProductNo(rset.getInt("product_no"));
		cal.setMenuNo(rset.getInt("menu_no"));
		cal.setWeekDayCode(WeekDayCode.valueOf(rset.getString("week_day_code")));
		cal.setMenuName(rset.getString("menu_name"));
		return cal;
	}

	public int insertCalendar(Connection conn, Calendar calendar) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertCalendar");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, calendar.getProductNo());
			pstmt.setInt(2, calendar.getMenuNo());
			pstmt.setString(3, calendar.getWeekDayCode().toString());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new CalendarException("캘린더 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Calendar findCalByProductNoAndwdCode(Connection conn, int productNo, WeekDayCode wdCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Calendar calendar = null;
		String sql = prop.getProperty("findCalByProductNoAndwdCode");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			pstmt.setString(2, wdCode.toString());
			rset = pstmt.executeQuery();
			while(rset.next()) {
				calendar = new Calendar();
				calendar.setCalNo(rset.getInt("cal_no"));
				calendar.setProductNo(rset.getInt("product_no"));
				calendar.setMenuNo(rset.getInt("menu_no"));
				calendar.setWeekDayCode(WeekDayCode.valueOf(rset.getString("week_day_code")));
			}
		} catch (Exception e) {
			throw new CalendarException("상품명-날짜코드를 이용한 캘린더정보 조회 오류", e);
		}
		return calendar;
	}

	public int updateCalendar(Connection conn, Calendar calendar) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateCalendar");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, calendar.getMenuNo());
			pstmt.setInt(2, calendar.getCalNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new CalendarException("캘린더 등록 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteCalendar(Connection conn, Calendar calendar) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteCalendar");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, calendar.getProductNo());
			pstmt.setString(2, calendar.getWeekDayCode().toString());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new CalendarException("캘린더 삭제 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<CalendarExt> findCalendarByProductNo(Connection conn, int productNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<CalendarExt> list = new ArrayList<>();
		String sql = prop.getProperty("findCalendarByProductNo");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				CalendarExt cal = handleCalendarExtResultSet(rset);
				list.add(cal);
			}
		} catch (Exception e) {
			throw new CalendarException("상품번호를 이용한 캘린더정보 조회 오류", e);
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
