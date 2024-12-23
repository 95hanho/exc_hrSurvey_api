package me._hanho.hrSurvey.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me._hanho.hrSurvey.mapper.SurveyMapper;
import me._hanho.hrSurvey.model.Common_info;
import me._hanho.hrSurvey.model.Common_result;
import me._hanho.hrSurvey.model.Page_survey;

@Repository
public class SurveyRepository {
	
	@Autowired
	private SurveyMapper surveyMapper;

	public Common_info getCommon_info(int s_year) {
		return surveyMapper.getCommon_info(s_year);
	}

	public int hasSurvey(String sType) {
		return surveyMapper.hasSurvey(sType);
	}
	
	public int getEmailCount(String sType, String email) {
		return surveyMapper.getEmailCount(sType, email);
	}

	public boolean getComplete(String sType, String email) {
		return surveyMapper.getComplete(sType, email);
	}
	
	public Common_info getCommon_info(String sType) {
		return surveyMapper.getCommon_info2(sType);
	}
	
	public String getStore_data(String sType, int sPage, String email) {
		return surveyMapper.getStore_data(sType, sPage, email);
	}
	
	public Page_survey getSurveyInfo(String sType, int sPage) {
		return surveyMapper.getSurveyInfo(sType, sPage);
	}
	
	public String get_progress_raw(String sType, String email) {
		return surveyMapper.get_progress_raw(sType, email);
	}
	
	public void addCommon_result(String sType, Common_result common_result) {
		surveyMapper.addCommon_result(sType, common_result);
	}












}
