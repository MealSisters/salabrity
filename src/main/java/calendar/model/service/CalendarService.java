package calendar.model.service;

import static common.JdbcTemplate.close;
import static common.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import calendar.model.dao.CalendarDao;
import calendar.model.dto.Calendar;
import calendar.model.dto.CalendarExt;

public class CalendarService {
	
	private CalendarDao calendarDao = new CalendarDao();

	public List<CalendarExt> findRecentProductCal() {
		Connection conn = getConnection();
		List<CalendarExt> calList = calendarDao.findRecentProductCal(conn);
		close(conn);
		return calList;
	}

}
