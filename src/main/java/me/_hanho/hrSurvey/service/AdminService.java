package me._hanho.hrSurvey.service;

import java.util.List;

import me._hanho.hrSurvey.model.Common_info;
import me._hanho.hrSurvey.model.Survey;

public interface AdminService {
	
	Common_info getCommonInfo(int s_year);

	List<Survey> getSurveys(int s_year);

	void adminSetCommon(Common_info c_info, int s_year);

	void adminSetSurvey(Survey survey, int s_year);

}
