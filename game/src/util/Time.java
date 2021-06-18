package util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Time {
	SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String all_time = simpledateformat.format(new Date());
	String time = new SimpleDateFormat("HH:mm:ss").format(new Date());
	String date = String.valueOf(new Date().getTime());

	public String getAllTime() {
		return this.all_time;
	}

	public String getTime() {
		return this.time;
	}

	public String getDate() {
		return this.date;
	}
}
