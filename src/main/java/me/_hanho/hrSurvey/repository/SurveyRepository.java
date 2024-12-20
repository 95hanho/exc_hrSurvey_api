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
	
	public String getStore_data(String sType, int sPage, String email) {
		return surveyMapper.getStore_data(sType, sPage, email);
	}
	
	public Page_survey getSurveyInfo(String sType, int sPage, String email) {
		return surveyMapper.getSurveyInfo(sType, sPage, email);
	}

	public void addCommon_result(String sType, Common_result common_result) {
		surveyMapper.addCommon_result(sType, common_result);
	}





}
