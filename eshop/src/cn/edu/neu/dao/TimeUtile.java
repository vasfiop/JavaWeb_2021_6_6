package cn.edu.neu.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class TimeUtile {
	static Date dNow = new Date();
	static SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	static Random rand = new Random(dNow.getTime());
	static int rand_num = rand.nextInt(1000);

	public static String get_order_code() {
		return ft.format(dNow) + rand_num;
	}
}
