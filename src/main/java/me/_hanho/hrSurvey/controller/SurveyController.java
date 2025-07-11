package me._hanho.hrSurvey.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import me._hanho.hrSurvey.model.Store_survey;
import me._hanho.hrSurvey.service.SurveyService;
import me._hanho.hrSurvey.service.TokenService;

@RestController
@RequestMapping("/api/expert/survey")
public class SurveyController {
	
	private static final Logger logger = LoggerFactory.getLogger(SurveyController.class);
	
	@Autowired
	private SurveyService surveyService;
	
	@Autowired
	private TokenService tokenService;

	// 공통 정보 조회
	@GetMapping("/company/common/material")
	public ResponseEntity<Map<String, Object>> getCommonInfo(@RequestParam("s_year") int s_year) {
		logger.info("getCommonInfo");
		Map<String, Object> result = new HashMap<String, Object>();
		
		Common_info common_info = surveyService.getCommon_info(s_year);
		
		System.out.println(common_info);
		
		result.put("result", common_info);
		result.put("code", 200);	
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 설문 시작 조회
	@GetMapping("/company/{sType}")
	public ResponseEntity<Map<String, Object>> getStartSurveyInfo(@PathVariable("sType") String sType) {
		logger.info("getStartSurveyInfo");
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
	public ResponseEntity<Map<String, Object>> startSurvey(@PathVariable("sType") String sType, 
			@RequestParam("email") String email) {
		logger.info("startSurvey");
		Map<String, Object> result = new HashMap<String, Object>();

		int dupl = surveyService.getEmailCount(sType, email);
		
		if(dupl == 0) {
			result.put("code", 406); // 설문 처음 시작 이메일 중복만 확인
		} else {
			boolean survey_complete = surveyService.getComplete(sType, email);
			if(survey_complete) {
				result.put("code", 403); // 설문이 완료된 이메일
			} else {
				Map<String, Object> resultMap = new HashMap<String, Object>();
				String token = tokenService.makeJwtToken(60L * 24, email);
				resultMap.put("token", token);
				result.put("result", resultMap);
				result.put("code", 200); // 설문한 기록이 있음
			}
		}
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 설문문항 정보 조회
	@GetMapping("/question/{sType}/{sPage}")
	public ResponseEntity<Map<String, Object>> getSurveyInfo(@PathVariable("sType") String sType, @PathVariable("sPage") int sPage,
			@RequestHeader("token") String token) {
		logger.info("getSurveyInfo");
		Map<String, Object> result = new HashMap<String, Object>();
		
		int hasSurvey = surveyService.hasSurvey(sType);
		if(hasSurvey == 0) {
			result.put("code", 406);
			result.put("msg", "없는 설문입니다."); 
		} else {
			Claims tokenInfo = tokenService.parseJwtToken(token);
			String email = (String) tokenInfo.get("email");
			int dupl = surveyService.getEmailCount(sType, email);
			
			if(dupl == 0) {
				result.put("code", 406);
				result.put("msg", "잘 못 된 이메일 입니다."); 
			} else {
				boolean survey_complete = surveyService.getComplete(sType, email);
				if(survey_complete) {
					result.put("code", 406);
					result.put("msg", "완료된 설문입니다.");
				} else {
					Common_info common_info = surveyService.getCommon_info(sType);
					Date now = new Date();
					if(common_info.getStart_date().compareTo(now) <= 0 && common_info.getEnd_date().compareTo(now) >= 0) {
						String store_data = surveyService.getStore_data(sType, sPage, email);
						Page_survey survey_result = surveyService.getSurveyInfo(sType, sPage, email);
						System.out.println("store_data : " + store_data);
						System.out.println("survey_result : " + survey_result);
						survey_result.setStore_data(store_data);
						
						result.put("data", survey_result);
						result.put("code", 200); // 가져옴
					} else {
						result.put("code", 406); // 기간이 지남 
						result.put("msg", "설문 기간이 아닙니다.");
					}
				}
			}
		}
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 테스트 설문문항 정보 조회
	@GetMapping("/question-tester/{sType}/{sPage}")
	public ResponseEntity<Map<String, Object>> getTestSurveyInfo(@RequestParam("sType") String sType, @RequestParam("sPage") int sPage) {
		logger.info("getTestSurveyInfo");
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 설문문항 답변 저장
	@PostMapping("/answer/{sType}/{sPage}")
	public ResponseEntity<Map<String, Object>> store_survey(@PathVariable("sType") String sType,
			@PathVariable("sPage") int sPage,
			@RequestHeader(value="token", required = false) String token,
			@RequestParam(value="store_data", required = false) String store_data, 
			@RequestParam(value="progress_raw", required = false) String progress_raw,
			@RequestParam(value = "end", required = false) boolean end,
			@ModelAttribute Common_result common_result) {
		logger.info("store_survey");
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(sPage == 0) {
			surveyService.addCommon_result(sType, common_result);
			result.put("token", tokenService.makeJwtToken(60L * 24, common_result.getR_Email()));
		} else {
			Claims tokenInfo = tokenService.parseJwtToken(token);
			String email = (String) tokenInfo.get("email");
			
//			String sType, String sPage, String store_data, String progress_raw, String email
			Store_survey store_survey = new Store_survey(sType, sPage, store_data, progress_raw, email);
			
			surveyService.store_survey(store_survey);
			
			System.out.println("end : " + end);
			if(end) {
				surveyService.complete_survey(store_survey);
			}
		}
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
}
