package me._hanho.hrSurvey.service;

import java.util.List;

import me._hanho.hrSurvey.model.Common_info;
import me._hanho.hrSurvey.model.Survey;

public interface AdminService {
	
	Common_info getCommonInfo(int s_year);

	List<Survey> getSurveys(int s_year);

}
