package common.utill;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Methods {
	public String getDefaultFilstShippingDate(){
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		cal.setTime(new Date());
		cal.add(Calendar.DATE, 3);
		if(cal.get(Calendar.DAY_OF_WEEK) == 1){
			cal.add(Calendar.DATE, 1);
		} else if(cal.get(Calendar.DAY_OF_WEEK) == 7){
			cal.add(Calendar.DATE, 2);
		}
		Date date = cal.getTime();
		String result = sdf.format(date);
		System.out.println("기본날짜"+result);
		return result;
	}
}
