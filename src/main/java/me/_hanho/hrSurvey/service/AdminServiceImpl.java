package me._hanho.hrSurvey.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import me._hanho.hrSurvey.model.Common_info;
import me._hanho.hrSurvey.model.Survey;
import me._hanho.hrSurvey.model.SurveyInfo;
import me._hanho.hrSurvey.repository.AdminRepository;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminRepository adminDAO;
	
	@Override
	@Transactional
	public Common_info getCommonInfo(int s_year) {
		Common_info common_info = adminDAO.getCommonInfo(s_year);
		if(common_info == null) {
			adminDAO.addCommonInfo(s_year);
			common_info = adminDAO.getCommonInfo(s_year);
		}
		return common_info;
	}
	
	@Override
	@Transactional
	public List<Survey> getSurveys(int s_year) {
		List<Survey> company_list = adminDAO.getSurveys(s_year);
		if(company_list.size() == 0) {
			int firstYear = 2000;
			int count = s_year - firstYear;
			
			Survey survey1 = new Survey("hrd_" + s_year, "제 " + count + "회 인재개발 실태조사", s_year);
			Survey survey2 = new Survey("hrm_" + s_year, "제 " + (count + 1) + "회 인재채용 실태조사", s_year);
			adminDAO.addSurvey(survey1);
			adminDAO.addSurvey(survey2);
			company_list = adminDAO.getSurveys(s_year);
		}
		
		return company_list;
	}

	@Override
	public void adminSetCommon(Common_info c_info, int s_year) {
		adminDAO.adminSetCommon(c_info, s_year);
	}

	@Override
	public void adminSetSurvey(Survey survey, int s_year) {
		adminDAO.adminSetSurvey(survey, s_year);
	}

	@Override
	public SurveyInfo getSurveyInfo(String sType, String sPage) {
		return adminDAO.getSurveyInfo(sType, sPage);
	}
	
	@Override
	public int hasSurvey(String sType) {
		return adminDAO.hasSurvey(sType);
	}


	@Override
	@Transactional
	public void setSurveyInfo(String sType, String sPage, SurveyInfo surveyInfo) {
		SurveyInfo before = adminDAO.getSurveyInfo(sType, sPage);
		int survey_id = adminDAO.getSurveyId(sType);
		if(before != null) {
			adminDAO.updateSurvey(sType, surveyInfo);
			adminDAO.updatePageSurvey(sPage, surveyInfo);
		} else {
			adminDAO.updateSurvey(sType, surveyInfo);
			surveyInfo.setSurvey_id(survey_id);
			adminDAO.insertPageSurvey(sPage, surveyInfo);
		}
	}


}
