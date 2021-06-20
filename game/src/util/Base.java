package util;

import java.io.UnsupportedEncodingException;
import java.util.Base64;

public class Base {
	public String getBase(String value) throws UnsupportedEncodingException {
		return Base64.getEncoder().encodeToString(value.getBytes("utf-8"));
	}
}
