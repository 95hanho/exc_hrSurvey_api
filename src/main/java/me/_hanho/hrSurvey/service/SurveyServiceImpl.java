package me._hanho.hrSurvey.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me._hanho.hrSurvey.model.Common_info;
import me._hanho.hrSurvey.model.Common_result;
import me._hanho.hrSurvey.model.Page_survey;
import me._hanho.hrSurvey.repository.SurveyRepository;

@Service
public class SurveyServiceImpl implements SurveyService {

	@Autowired
	private SurveyRepository surveyDAO;
	
	@Override
	public Common_info getCommon_info(int s_year) {
		return surveyDAO.getCommon_info(s_year);
	}
	
	@Override
	public int hasSurvey(String sType) {
		return surveyDAO.hasSurvey(sType);
	}

	@Override
	public int getEmailCount(String email) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public String getStore_data(String sType, int sPage, String email) {
		return surveyDAO.getStore_data(sType, sPage, email);
	}
	
	@Override
	public Page_survey getSurveyInfo(String sType, int sPage, String email) {
		return surveyDAO.getSurveyInfo(sType, sPage, email);
	}



	@Override
	public void addCommon_result(String sType, Common_result common_result) {
		surveyDAO.addCommon_result(sType, common_result);
	}





	
	
}
