package me._hanho.hrSurvey.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;
import me._hanho.hrSurvey.model.Common_info;
import me._hanho.hrSurvey.model.Survey;
import me._hanho.hrSurvey.model.SurveyInfo;
import me._hanho.hrSurvey.service.AdminService;


@RestController
@RequestMapping("/api/expert/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private AdminService adminService;
	
	// 설문 목록 조회
	@GetMapping("/company")
	public ResponseEntity<Map<String, Object>> adminGetSurvey(@RequestParam("s_year") int s_year) {
		logger.info("adminGetSurvey");
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		if(s_year < 2000 ||  2999 < s_year) {
			return new ResponseEntity<>(result, HttpStatus.BAD_REQUEST);
		}
		
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
			@RequestParam("s_year") int s_year, HttpServletRequest request) {
		logger.info("adminSetCommon");
		Map<String, Object> result = new HashMap<String, Object>();
		
		String ipAddress = request.getRemoteAddr();
		logger.info("ipAddress : " + ipAddress);
<<<<<<< HEAD
=======
		
		// 허용 IP 리스트
	    List<String> allowedIps = Arrays.asList("203.245.44.21"); // 허용할 IP를 리스트에 추가
	    
	    // IP 제한 체크
	    if (!allowedIps.contains(ipAddress)) {
	        result.put("msg", "Access denied: Unauthorized IP");
	        return new ResponseEntity<>(result, HttpStatus.FORBIDDEN);
	    }
>>>>>>> d2873edca6bd862b124b75c03e73dffd2438349b
		
		// 허용 IP 리스트
	    List<String> allowedIps = Arrays.asList("203.245.44.21"); // 허용할 IP를 리스트에 추가
	    
	    // IP 제한 체크
	    if (!allowedIps.contains(ipAddress)) {
	        result.put("msg", "Access denied: Unauthorized IP");
	        return new ResponseEntity<>(result, HttpStatus.FORBIDDEN);
	    }
		
	    logger.info("c_info : " + c_info);
	    
		adminService.adminSetCommon(c_info, s_year);
		
		result.put("code", 200);
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 설문 수정
	@PostMapping("/company")
	public ResponseEntity<Map<String, Object>> adminSetSurvey(@ModelAttribute Survey survey,
			@RequestParam("s_year") int s_year, HttpServletRequest request) {
		logger.info("adminSetSurvey");
		Map<String, Object> result = new HashMap<String, Object>();
		
		String ipAddress = request.getRemoteAddr();
		logger.info("ipAddress : " + ipAddress);
		
		// 허용 IP 리스트
	    List<String> allowedIps = Arrays.asList("203.245.44.21"); // 허용할 IP를 리스트에 추가
	    
	    // IP 제한 체크
	    if (!allowedIps.contains(ipAddress)) {
	        result.put("msg", "Access denied: Unauthorized IP");
	        return new ResponseEntity<>(result, HttpStatus.FORBIDDEN);
	    }
		
		adminService.adminSetSurvey(survey, s_year);
		
		result.put("code", 200);
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 설문 정보 조회
	@GetMapping("/question/{sType}/{sPage}")
	public ResponseEntity<Map<String, Object>> adminGetSurveyInfo(@PathVariable("sType") String sType,
			@PathVariable("sPage") int sPage) {
		logger.info("adminGetSurveyInfo");
		Map<String, Object> result = new HashMap<String, Object>();
		
		SurveyInfo surveyInfo = adminService.getSurveyInfo(sType, sPage);
		System.out.println(surveyInfo);
		
		if(surveyInfo == null) {
			if(sPage != 1) {
				result.put("code", 4035); // 설문이 아예 없을 때
			} else {
				int hasSurvey = adminService.hasSurvey(sType);
				if(hasSurvey == 0) {
					result.put("code", 4035); // 설문이 아예 없을 때
				} else {
					adminService.addPageSurvey(sType, 1);
					surveyInfo = adminService.getSurveyInfo(sType, sPage);
					result.put("code", 4033); // 처음 들어왔을 때 
				}
			}
		} else if(surveyInfo.getTop_menu_list_jsonData() == null && sPage == 1) {
			result.put("code", 4033); // 처음 들어왔을 때 
		} else {
			result.put("data", surveyInfo);
			result.put("code", 200); // 있음
		}
		
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 설문 정보 저장
	@PostMapping("/question/{sType}/{sPage}")
	public ResponseEntity<Map<String, Object>> adminSetSurveyInfo(@PathVariable("sType") String sType,
			@PathVariable("sPage") int sPage, @ModelAttribute SurveyInfo surveyInfo,
			@RequestParam("top_menuList") List<String> top_menuList, HttpServletRequest request) {
		logger.info("adminSetSurveyInfo");
		Map<String, Object> result = new HashMap<String, Object>();
		
		String ipAddress = request.getRemoteAddr();
		logger.info("ipAddress : " + ipAddress);
		
		// 허용 IP 리스트
	    List<String> allowedIps = Arrays.asList("203.245.44.21"); // 허용할 IP를 리스트에 추가
	    
	    // IP 제한 체크
	    if (!allowedIps.contains(ipAddress)) {
	        result.put("msg", "Access denied: Unauthorized IP");
	        return new ResponseEntity<>(result, HttpStatus.FORBIDDEN);
	    }
		
		adminService.setSurveyInfo(sType, sPage, surveyInfo, top_menuList.size());
//		top_menuList
		
		result.put("code", 200); // 있음
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	/* =============================================== */
	
	// 설문 답 조회
	@GetMapping("/answer/data/{sType}/{page}")
	public ResponseEntity<Map<String, Object>> getAdminSurveyResult(@PathVariable("sType") String sType, @PathVariable("page") String page) {
		logger.info("getAdminSurveyResult");
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 설문내용 하나 삭제
	@PostMapping("/member/remove/{sType}")
	public ResponseEntity<Map<String, Object>> adminDeleteSurvey(@PathVariable("sType") String sType, @RequestParam("email") String email, HttpServletRequest request) {
		logger.info("adminDeleteSurvey");
		Map<String, Object> result = new HashMap<String, Object>();
		
		String ipAddress = request.getRemoteAddr();
		logger.info("ipAddress : " + ipAddress);
		
		// 허용 IP 리스트
	    List<String> allowedIps = Arrays.asList("203.245.44.21"); // 허용할 IP를 리스트에 추가
	    
	    // IP 제한 체크
	    if (!allowedIps.contains(ipAddress)) {
	        result.put("msg", "Access denied: Unauthorized IP");
	        return new ResponseEntity<>(result, HttpStatus.FORBIDDEN);
	    }
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 수주용 설문Info 조회
	@PostMapping("/suju/answer/data/{sType}")
	public ResponseEntity<Map<String, Object>> serviceGetSurvey(@PathVariable("sType") String sType, @RequestParam("password") String password) {
		logger.info("serviceGetSurvey");
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	// 수주용 담당자 변경
	@PostMapping("/member/suju")
	public ResponseEntity<Map<String, Object>> serviceUpdateRecommend() {
		logger.info("serviceUpdateRecommend");
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("msg", "success");
		return new ResponseEntity<>(result, HttpStatus.OK);
	}


}
