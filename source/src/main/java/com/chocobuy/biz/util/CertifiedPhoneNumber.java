package com.chocobuy.biz.util;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class CertifiedPhoneNumber {
	/* 문자전송 */
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) {
		System.out.println("===> 문자전송 certifiedPhoneNumber() 처리");
		String api_key = "NCSCRMK1CPALPXZV"; 
		String api_secret = "I31NB3HYZGK98QVZNAC8YQZNOJEK0Y0G"; 
		Message coolsms = new Message(api_key, api_secret);
		HashMap<String, String> params = new HashMap<String, String>(); 
		params.put("to", userPhoneNumber); // 수신전화번호 
		params.put("from", userPhoneNumber); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS"); 
		params.put("text", "[TEST] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력 
		params.put("app_version", "test app 1.2"); // application name and version 		
		System.out.println("인증번호: "+randomNumber);
		try { 
			JSONObject obj = (JSONObject) coolsms.send(params); 
			System.out.println(obj.toString());  
		} catch (CoolsmsException e) { 
			System.out.println(e.getMessage());
			System.out.println(e.getCode()); 
		} 		
	}
}
																															