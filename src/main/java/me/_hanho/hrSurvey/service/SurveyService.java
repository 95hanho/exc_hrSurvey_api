package me._hanho.hrSurvey.service;

import me._hanho.hrSurvey.model.Common_info;
import me._hanho.hrSurvey.model.Common_result;
import me._hanho.hrSurvey.model.Page_survey;

public interface SurveyService {

	Common_info getCommon_info(int s_year);
	
	int hasSurvey(String sType);

	int getEmailCount(String email);
	
	
	
	String getStore_data(String sType, int sPage, String email);
	
	Page_survey getSurveyInfo(String sType, int sPage, String email);

	void addCommon_result(String sType, Common_result common_result);

	


	

}
