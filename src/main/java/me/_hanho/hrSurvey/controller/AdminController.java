package me._hanho.hrSurvey.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import me._hanho.hrSurvey.model.Common_info;
import me._hanho.hrSurvey.model.Survey;
import me._hanho.hrSurvey.service.AdminService;
import me._hanho.hrSurvey.service.SurveyService;


@RestController
@RequestMapping("/api/expert/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	// 설문 목록 조회
	@GetMapping("/company")
	public ResponseEntity<Map<String, Object>> adminGetSurvey(@RequestParam("s_year") int s_year) {
		System.out.println("adminGetSurvey");
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		Common_info common_info = adminService.getCommonInfo(s_year);
		
		List<Survey> company_list = adminService.getSurveys(s_year);
		
		resultMap.put("common_info", common_info);
		resultMap.put("company_list", company_list);
		result.put("result", resultMap);
		result.put("code", 200);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 설문 공통 정보 저장
	@PostMapping("/company/common")
	public ResponseEntity<Map<String, Object>> adminSetCommon(@ModelAttribute Common_info c_info,
			@RequestParam("s_year") int s_year) {
		System.out.println("adminSetCommon");
		Map<String, Object> result = new HashMap<String, Object>();
		
		adminService.adminSetCommon(c_info, s_year);
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 설문 수정
	@PostMapping("/company")
	public ResponseEntity<Map<String, Object>> adminSetSurvey(@ModelAttribute Survey survey,
			@RequestParam("s_year") int s_year) {
		System.out.println("adminSetSurvey");
		Map<String, Object> result = new HashMap<String, Object>();
		
		adminService.adminSetSurvey(survey);
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 설문 배너 조회
	@GetMapping("/company/detail/{sType}")
	public ResponseEntity<Map<String, Object>> adminGetSurveyBanner(@PathVariable("sType") String sType) {
		System.out.println("adminGetSurveyBanner");
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 설문 베너 저장
	@PostMapping("/company/detail/{sType}")
	public ResponseEntity<Map<String, Object>> adminSetSurveyBanner(@PathVariable("sType") String sType) {
		System.out.println("adminSetSurveyBanner");
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 설문 정보 조회
	@GetMapping("/question/{sType}/{sPage}")
	public ResponseEntity<Map<String, Object>> adminGetSurveyInfo(@PathVariable("sType") String sType, @PathVariable("sPage") String sPage) {
		System.out.println("adminGetSurveyInfo");
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 설문 정보 저장
	@PostMapping("/question/{sType}/{sPage}")
	public ResponseEntity<Map<String, Object>> adminSetSurveyInfo(@PathVariable("sType") String sType, @PathVariable("sPage") String sPage) {
		System.out.println("adminSetSurveyInfo");
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 설문 답 조회
	@GetMapping("/answer/data/{sType}/{page}")
	public ResponseEntity<Map<String, Object>> getAdminSurveyResult(@PathVariable("sType") String sType, @PathVariable("page") String page) {
		System.out.println("getAdminSurveyResult");
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 설문내용 하나 삭제
	@PostMapping("/member/remove/{sType}")
	public ResponseEntity<Map<String, Object>> adminDeleteSurvey(@PathVariable("sType") String sType, @RequestParam("email") String email) {
		System.out.println("adminDeleteSurvey");
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 수주용 설문Info 조회
	@PostMapping("/suju/answer/data/{sType}")
	public ResponseEntity<Map<String, Object>> serviceGetSurvey(@PathVariable("sType") String sType, @RequestParam("password") String password) {
		System.out.println("serviceGetSurvey");
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 수주용 담당자 변경
	@PostMapping("/member/suju")
	public ResponseEntity<Map<String, Object>> serviceUpdateRecommend() {
		System.out.println("serviceUpdateRecommend");
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}


}
