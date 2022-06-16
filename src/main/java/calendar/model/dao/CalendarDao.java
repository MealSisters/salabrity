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
				CalendarExt cal = handleCalendarResultSet(rset);
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

	private CalendarExt handleCalendarResultSet(ResultSet rset) throws SQLException {
		CalendarExt cal = new CalendarExt();
		cal.setCalNo(rset.getInt("cal_no"));
		cal.setProductNo(rset.getInt("product_no"));
		cal.setMenuNo(rset.getInt("menu_no"));
		cal.setWeekDayCode(WeekDayCode.valueOf(rset.getString("week_day_code")));
		cal.setMenuName(rset.getString("menu_name"));
		return cal;
	}

}
