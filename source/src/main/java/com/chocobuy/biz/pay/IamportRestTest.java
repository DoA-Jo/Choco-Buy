package com.chocobuy.biz.pay;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;


//@Controller 페이 컨트롤러에 붙여서 테스트 중
public class IamportRestTest {
//	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
//	public static final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/";
//	public static final String IMPORT_PAYMENTLIST_URL = "https://api.iamport.kr/payments/status/all";
//	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
//	public static final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare";
//	//"아임포트 Rest Api key";
//	public static final String KEY = "4838686133176154";
//	//"아임포트 Rest Api Secret"; 
//	public static final String SECRET = "2dd5298b5f266390639487861daa1caebf4bb79719f88a0627d7d9b809d3bd828dc32b3b3670112e";  
//	
//	// 아임포트 인증(토큰)을 받아주는 함수 
//	public String getImportToken() {
//		String result = "";
//		HttpClient client = HttpClientBuilder.create().build(); 
//		HttpPost post = new HttpPost(IMPORT_TOKEN_URL); 
//		Map<String,String> m =new HashMap<String,String>(); 
//		m.put("imp_key", KEY);
//		m.put("imp_secret", SECRET); 
//		try { 
//			post.setEntity( new UrlEncodedFormEntity(convertParameter(m)));
//			HttpResponse res = client.execute(post); 
//			ObjectMapper mapper = new ObjectMapper(); 
//			String body = EntityUtils.toString(res.getEntity()); 
//			JsonNode rootNode = mapper.readTree(body); 
//			JsonNode resNode = rootNode.get("response"); 
//			result = resNode.get("access_token").asText(); 
//		} catch (Exception e) { 
//			e.printStackTrace(); 
//		} 
//		return result;
//	}
//	
//	// Map을 사용해서 Http요청 파라미터를 만들어 주는 함수 private
//	List<NameValuePair> convertParameter(Map<String,String> paramMap){
//		List<NameValuePair> paramList = new ArrayList<NameValuePair>(); 
//		Set<Entry<String,String>> entries = paramMap.entrySet();
//		for(Entry<String,String> entry : entries) {
//		 paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue())); 
//		} 
//		return paramList; 
//	} 
//	
//	// 아임포트 결제금액 변조를 방지하는 함수 
//		 public void setHackCheck(String amount,String mId,String token) { 
//			HttpClient client = HttpClientBuilder.create().build();
//			HttpPost post = new HttpPost(IMPORT_PREPARE_URL);
//			Map<String,String> m =new HashMap<String,String>();
//			post.setHeader("Authorization", token);
//			m.put("amount", amount);
//			m.put("merchant_uid", mId);
//			try { 
//				post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
//				HttpResponse res = client.execute(post);
//				ObjectMapper mapper = new ObjectMapper();
//				String body = EntityUtils.toString(res.getEntity());
//				JsonNode rootNode = mapper.readTree(body);
//				System.out.println(rootNode); 
//			} catch (Exception e) {
//				e.printStackTrace(); 
//			} 
//		} 
//	
//

}
