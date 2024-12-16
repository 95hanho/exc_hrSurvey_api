package me._hanho.hrSurvey.service;

import me._hanho.hrSurvey.model.Common_info;

public interface SurveyService {

	Common_info getCommon_info(int s_year);

	int getEmailCount(String email);

}
