package me._hanho.hrSurvey.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me._hanho.hrSurvey.mapper.AdminMapper;
import me._hanho.hrSurvey.model.Common_info;
import me._hanho.hrSurvey.model.Survey;
import me._hanho.hrSurvey.model.SurveyInfo;

@Repository
public class AdminRepository {
	
	@Autowired
	private AdminMapper adminMapper;

	public Common_info getCommonInfo(int s_year) {
		return adminMapper.getCommonInfo(s_year);
	}

	public void addCommonInfo(int s_year) {
		adminMapper.addCommonInfo(s_year);
	}

	public List<Survey> getSurveys(int s_year) {
		return adminMapper.getSurveys(s_year);
	}
	
	public void addSurvey(Survey survey) {
		adminMapper.addSurvey(survey);
	}

	public void adminSetCommon(Common_info c_info, int s_year) {
		adminMapper.adminSetCommon(c_info, s_year);
	}

	public void adminSetSurvey(Survey survey, int s_year) {
		adminMapper.adminSetSurvey(survey, s_year);
	}

	public SurveyInfo getSurveyInfo(String sType, String sPage) {
		return adminMapper.getSurveyInfo(sType, sPage);
	}
	
	public int getSurveyId(String sType) {
		return adminMapper.getSurveyId(sType);
	}

	public void updateSurvey(String sType, SurveyInfo surveyInfo) {
		adminMapper.updateSurvey(sType, surveyInfo);
	}

	public void updatePageSurvey(String sPage, SurveyInfo surveyInfo) {
		adminMapper.updatePageSurvey(sPage, surveyInfo);
	}

	public void insertPageSurvey(String sPage, SurveyInfo surveyInfo) {
		adminMapper.insertPageSurvey(sPage, surveyInfo);
	}


	


}