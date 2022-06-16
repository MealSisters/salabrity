package calendar.model.service;

import static common.JdbcTemplate.*;
import static common.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import calendar.model.dao.CalendarDao;
import calendar.model.dto.Calendar;
import calendar.model.dto.CalendarExt;
import calendar.model.dto.WeekDayCode;

public class CalendarService {
	
	private CalendarDao calendarDao = new CalendarDao();

	public List<CalendarExt> findRecentProductCal() {
		Connection conn = getConnection();
		List<CalendarExt> calList = calendarDao.findRecentProductCal(conn);
		close(conn);
		return calList;
	}

	public int insertCalendar(Calendar calendar) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = calendarDao.insertCalendar(conn, calendar);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
		} finally {
			close(conn);
		}
		return result;
	}

	public Calendar findCalByProductNoAndwdCode(int productNo, WeekDayCode wdCode) {
		Connection conn = getConnection();
		Calendar calendar = calendarDao.findCalByProductNoAndwdCode(conn, productNo, wdCode);
		close(conn);
		return calendar;
	}

	public int updateCalendar(Calendar calendar) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = calendarDao.updateCalendar(conn, calendar);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
		} finally {
			close(conn);
		}
		return result;
	}

	public int deleteCalendar(Calendar calendar) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = calendarDao.deleteCalendar(conn, calendar);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
		} finally {
			close(conn);
		}
		return result;
	}

	public List<CalendarExt> findCalendarByProductNo(int productNo) {
		Connection conn = getConnection();
		List<CalendarExt> list = calendarDao.findCalendarByProductNo(conn, productNo);
		close(conn);
		return list;
	}

}
