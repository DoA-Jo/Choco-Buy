package com.chocobuy.biz.util;

import java.util.regex.Pattern;

public class UseReg {

	public static void main(String[] args) {
		String tel="^01(?:0|1[6-9])-(?:\\d{3}\\d{4})-\\d{4}$";
		
		String testTel="010-9906-9306";
		
		boolean tel_check=Pattern.matches(tel, testTel);
		System.out.println(tel_check);
	}

}
