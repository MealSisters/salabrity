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
		return result;
	}
	
	public String getPhoneNumberFormat(String phone) {
		String result = phone.substring(0, 3) + "-" + phone.substring(3, 7) + "-" + phone.substring(7);
		return result;
	}
}
