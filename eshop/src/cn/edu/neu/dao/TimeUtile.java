package cn.edu.neu.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class TimeUtile {

	public static String get_order_code() {
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		Random rand = new Random(dNow.getTime());
		int rand_num = rand.nextInt(1000);
		return ft.format(dNow) + rand_num;
	}

	public String get_Time() {
		Date dNow = new Date();
		SimpleDateFormat not_time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return not_time.format(dNow);
	}
}
