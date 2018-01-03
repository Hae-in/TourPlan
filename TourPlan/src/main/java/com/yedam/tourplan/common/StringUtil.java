package com.yedam.tourplan.common;

public class StringUtil {
	
	public static String addEnter(String html) throws Exception {
		String text = html.replaceAll("\\\"", "'");
		return text.replaceAll("\\r|\\n|&nbsp;", "<br>");
	}
}

