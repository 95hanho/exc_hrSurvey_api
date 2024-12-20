package me._hanho.hrSurvey.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.jsonwebtoken.Claims;
import me._hanho.hrSurvey.model.Common_info;
import me._hanho.hrSurvey.model.Common_result;
import me._hanho.hrSurvey.model.Page_survey;
import me._hanho.hrSurvey.service.SurveyService;
import me._hanho.hrSurvey.service.TokenService;

@RestController
@RequestMapping("/api/expert/survey")
public class SurveyController {
	
	@Autowired
	private SurveyService surveyService;
	
	@Autowired
	private TokenService tokenService;

	// 공통 정보 조회
	@GetMapping("/company/common/material")
	public ResponseEntity<Map<String, Object>> getCommonInfo(@RequestParam("s_year") int s_year) {
		System.out.println("getCommonInfo");
		Map<String, Object> result = new HashMap<String, Object>();
		
		Common_info common_info = surveyService.getCommon_info(s_year);
		
		result.put("result", common_info);
		result.put("remote_status", false); // 관리자 여부
		result.put("code", 200);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 설문 시작 조회
	@GetMapping("/company/{sType}")
	public ResponseEntity<Map<String, Object>> getStartSurveyInfo(@PathVariable("sType") String sType) {
		System.out.println("getStartSurveyInfo");
		Map<String, Object> result = new HashMap<String, Object>();
		
		int hasSurvey = surveyService.hasSurvey(sType);
		
		if(hasSurvey > 0) {
			result.put("code", 200);
		} else {
			result.put("code", 400);
		}
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 이메일 입력 후 설문정보 들어가기
	@PostMapping("/default/process/{sType}")
	public ResponseEntity<Map<String, Object>> startSurvey(@RequestParam("sType") String sType, 
			@RequestParam("email") String email) {
		System.out.println("startSurvey");
		Map<String, Object> result = new HashMap<String, Object>();

		int dupl = surveyService.getEmailCount(email);
		
		// 이메일이 있는지, 설문 완료여부
//		result.put("code", 200); // 설문한 기록이 있음
		result.put("code", 406); // 설문 처음 시작 이메일 중복만 확인
//		result.put("code", 403); // 설문이 완료된 이메일
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 설문문항 정보 조회
	@GetMapping("/question/{sType}/{sPage}")
	public ResponseEntity<Map<String, Object>> getSurveyInfo(@PathVariable("sType") String sType, @PathVariable("sPage") int sPage,
			@RequestHeader("token") String token) {
		System.out.println("getSurveyInfo");
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> dataResult = new HashMap<String, Object>();
		
		Claims tokenInfo = tokenService.parseJwtToken(token);
		String email = (String) tokenInfo.get("email");
		
		String store_data = surveyService.getStore_data(sType, sPage, email);
		Page_survey survey_result = surveyService.getSurveyInfo(sType, sPage, email);
		survey_result.setStore_data(store_data);
		
		result.put("data", survey_result);
		result.put("code", 200); // 가져옴
//		result.put("code", 406); // 이래저래 문제일 때 ex) 완료된 설문, 없는 설문, 기간이 지남 
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 테스트 설문문항 정보 조회
	@GetMapping("/question-tester/{sType}/{sPage}")
	public ResponseEntity<Map<String, Object>> getTestSurveyInfo(@RequestParam("sType") String sType, @RequestParam("sPage") int sPage) {
		System.out.println("getTestSurveyInfo");
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 설문문항 답변 저장
	@PostMapping("/answer/{sType}/{sPage}")
	public ResponseEntity<Map<String, Object>> store_survey(@PathVariable("sType") String sType,
			@PathVariable("sPage") int sPage,
			@RequestHeader(value="token", required = false) String token,
			@ModelAttribute Common_result common_result) {
		System.out.println("store_survey");
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(sPage == 0) {
			surveyService.addCommon_result(sType, common_result);
			result.put("token", tokenService.makeJwtToken(60L * 24, common_result.getR_Email()));
		}
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
}
