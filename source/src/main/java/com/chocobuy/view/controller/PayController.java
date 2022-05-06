package com.chocobuy.view.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.chocobuy.biz.chat.AppVO;
import com.chocobuy.biz.chat.ChatRoomVO;
import com.chocobuy.biz.chat.ChatService;
import com.chocobuy.biz.chat.MsgVO;
import com.chocobuy.biz.pay.PayService;
import com.chocobuy.biz.pay.PayVO;
import com.chocobuy.biz.trade.TradeService;
import com.chocobuy.biz.trade.TradeVO;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@SessionAttributes("pay")
public class PayController {
	
	@Autowired
	private PayService payService;
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private TradeService tradeService;
	
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public static final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/";
	public static final String IMPORT_PAYMENTLIST_URL = "https://api.iamport.kr/payments/status/all";
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	public static final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare";
	//"아임포트 Rest Api key";
	public static final String KEY = "4838686133176154";
	//"아임포트 Rest Api Secret"; 
	public static final String SECRET = "2dd5298b5f266390639487861daa1caebf4bb79719f88a0627d7d9b809d3bd828dc32b3b3670112e"; 
	
	// 아임포트 인증(토큰)을 받아주는 함수 
	public String getImportToken() {
		String result = "";
		HttpClient client = HttpClientBuilder.create().build(); 
		HttpPost post = new HttpPost(IMPORT_TOKEN_URL); 
		Map<String,String> m =new HashMap<String,String>(); 
		m.put("imp_key", KEY);
		m.put("imp_secret", SECRET); 
		try { 
			post.setEntity( new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post); 
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
			JsonNode rootNode = mapper.readTree(body); 
			JsonNode resNode = rootNode.get("response"); 
			result = resNode.get("access_token").asText(); 
		} catch (Exception e) { 
			e.printStackTrace(); 
		} 
		return result;
	}
		
	// Map을 사용해서 Http요청 파라미터를 만들어 주는 함수 private
	List<NameValuePair> convertParameter(Map<String,String> paramMap){
		List<NameValuePair> paramList = new ArrayList<NameValuePair>(); 
		Set<Entry<String,String>> entries = paramMap.entrySet();
		for(Entry<String,String> entry : entries) {
		 paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue())); 
		} 
		return paramList; 
	} 
		
	// 아임포트 결제금액 변조를 방지하는 함수 
		 public void setHackCheck(String amount,String mId,String token) { 
			HttpClient client = HttpClientBuilder.create().build();
			HttpPost post = new HttpPost(IMPORT_PREPARE_URL);
			Map<String,String> m =new HashMap<String,String>();
			post.setHeader("Authorization", token);
			m.put("amount", amount);
			m.put("merchant_uid", mId);
			try { 
				post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
				HttpResponse res = client.execute(post);
				ObjectMapper mapper = new ObjectMapper();
				String body = EntityUtils.toString(res.getEntity());
				JsonNode rootNode = mapper.readTree(body);
				System.out.println(rootNode); 
			} catch (Exception e) {
				e.printStackTrace(); 
			} 
		} 
	
//		2022.05.01 추가 수정 start
	//결제 진행 폼
	@RequestMapping(value="/Pay/Payment", method=RequestMethod.POST)
	public String payment(PayVO vo, HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		System.out.println(vo.toString());
		model.addAttribute("pay", vo);
		String token = getImportToken();
//		2022.05.01 추가 수정 end
		setHackCheck(Integer.toString(vo.getPay_amount()), vo.getPay_ordernum(), token);
		
		// DB 저장 로직
//		2022.05.01 추가 수정 start
		return "redirect:/Pay/insertPay";
//		2022.05.01 추가 수정 end
		
	}

	// 2022.05.04 추가 수정 start
	@RequestMapping("/Pay/PayIndex")
	public String payIndex(ChatRoomVO cvo, TradeVO tvo, AppVO avo, Model model, HttpSession session) {
		cvo = chatService.getChatRoom(cvo);
		model.addAttribute("chatroom", cvo );
		tvo.setTrade_seq(cvo.getTrade_seq());
		avo.setChatroom_seq(cvo.getChatroom_seq());
		model.addAttribute("appointment",chatService.getApp(avo));
		model.addAttribute("trade", tradeService.getTrade(tvo));
		return "/Pay/PayIndex";
	}
	@RequestMapping("/Pay/Pay")
	public String payPay(ChatRoomVO cvo, TradeVO tvo, AppVO avo, PayVO vo, Model model, HttpSession session) {
		cvo = chatService.getChatRoom(cvo);
		model.addAttribute("chatroom", cvo );
		tvo.setTrade_seq(cvo.getTrade_seq());
		avo.setChatroom_seq(cvo.getChatroom_seq());
		model.addAttribute("appointment",chatService.getApp(avo));
		model.addAttribute("trade", tradeService.getTrade(tvo));
		return "/Pay/Pay";
	}
	
//	@RequestMapping("/Pay/PayComplete")
//	public String payComplete() {
//		return "/Pay/PayComplete";
//	}
	// 2022.05.04 추가 수정 end	
	
	// insert
	@RequestMapping("/Pay/insertPay")
	public String insertPay(@ModelAttribute("pay") PayVO vo, ServletRequest request) {
		payService.insertPay(vo);
		return "redirect:/Pay/getPay"; // list아님
	}
	// update
	@RequestMapping("/Pay/updatePay")
	public String updatePay(@ModelAttribute("pay") PayVO vo, HttpSession session) {
		if( vo.getPay_sell().equals(session.getAttribute("trade_nick").toString()) ){ // ??
			payService.updatePay(vo);
			return "redirect:/Pay/getPayList";
		}else {
			return "getPay?error=1";
		}
	}
	// delete
	@RequestMapping("/Pay/deletePay")
	public String deletePay(PayVO vo) {
		payService.deletePay(vo);
		return "/Pay/getPayList";
	}
	// get
	@RequestMapping("/Pay/getPay")
	// 2022.05.01 추가 수정 start
	public String getPay(@ModelAttribute("pay") PayVO vo, Model model) {
		model.addAttribute("pay", payService.getPay(vo));
		return "/Pay/PayComplete";
	// 2022.05.01 추가 수정 end
	}
	//
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("카테고리", "pay_category");
		conditionMap.put("주문번호", "pay_ordernum");
		return conditionMap;
	}
	// list
	@RequestMapping("/Pay/getPayList")
	public String getPayListPost(PayVO vo, Model model) {
		System.out.println("결제내역 검색 처리");
		
		// null Check
		if(vo.getSearchCondition()==null) vo.setSearchCondition("pay_ordernum");
		if(vo.getSearchKeyword()==null) vo.setSearchKeyword("");
		// model 정보 저장
		model.addAttribute("payList", payService.getPayList(vo));
		return "/Pay/getPayList";
	}
	
}