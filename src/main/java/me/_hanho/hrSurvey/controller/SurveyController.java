package me._hanho.hrSurvey.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import me._hanho.hrSurvey.model.Common_info;
import me._hanho.hrSurvey.service.SurveyService;

@RestController
@RequestMapping("/api/expert/survey")
public class SurveyController {
	
	@Autowired
	private SurveyService surveyService;

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
	public ResponseEntity<Map<String, Object>> getStartSurveyInfo(@RequestParam("sType") String sType) {
		System.out.println("getStartSurveyInfo");
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("code", 200);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 이메일 입력 후 설문정보 들어가기
	@PostMapping("/default/process/{sType}")
	public ResponseEntity<Map<String, Object>> startSurvey(@RequestParam("sType") String sType, @RequestParam("email") String email) {
		System.out.println("startSurvey");
		Map<String, Object> result = new HashMap<String, Object>();

		int dupl = surveyService.getEmailCount(email);
		if(dupl == 0) {
			
		} else {
			result.put("code", 406);
			result.put("code", 403);
			return new ResponseEntity<>(result, HttpStatus.OK);
		}
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 설문문항 정보 조회
	@GetMapping("/question/{sType}/{sPage}")
	public ResponseEntity<Map<String, Object>> getSurveyInfo(@RequestParam("sType") String sType, @RequestParam("sPage") int sPage,
			@RequestHeader("token") String token) {
		System.out.println("getSurveyInfo");
		Map<String, Object> result = new HashMap<String, Object>();
		
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
	public ResponseEntity<Map<String, Object>> store_survey(@RequestParam("sType") String sType, @RequestParam("sPage") int sPage,
			@RequestHeader("token") String token) {
		System.out.println("store_survey");
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
}
