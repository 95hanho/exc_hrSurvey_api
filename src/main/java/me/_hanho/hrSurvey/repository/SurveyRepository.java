package me._hanho.hrSurvey.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me._hanho.hrSurvey.mapper.SurveyMapper;
import me._hanho.hrSurvey.model.Common_info;
import me._hanho.hrSurvey.model.Common_result;
import me._hanho.hrSurvey.model.Page_survey;
import me._hanho.hrSurvey.model.Store_survey;

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

	public void store_progress_raw(Store_survey store_survey) {
		surveyMapper.store_progress_raw(store_survey);
	}

	public void store_store_data(Store_survey store_survey) {
		if(surveyMapper.has_store_survey(store_survey) == 0) {
			surveyMapper.insert_store_data(store_survey);
		} else {
			surveyMapper.update_store_data(store_survey);
		}
		
	}

	public void complete_survey(Store_survey store_survey) {
		surveyMapper.complete_survey(store_survey);
	}












}
