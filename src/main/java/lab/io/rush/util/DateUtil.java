package lab.io.rush.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	
	public static String getData() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");//设置日期格式
		return df.format(new Date());
	}

}
