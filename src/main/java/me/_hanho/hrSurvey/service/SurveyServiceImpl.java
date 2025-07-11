package me._hanho.hrSurvey.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import me._hanho.hrSurvey.model.Common_info;
import me._hanho.hrSurvey.model.Common_result;
import me._hanho.hrSurvey.model.Page_survey;
import me._hanho.hrSurvey.model.Store_survey;
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
	public int getEmailCount(String sType, String email) {
		return surveyDAO.getEmailCount(sType, email);
	}
	
	@Override
	public boolean getComplete(String sType, String email) {
		return surveyDAO.getComplete(sType, email);
	}
	
	@Override
	public Common_info getCommon_info(String sType) {
		return surveyDAO.getCommon_info(sType);
	}
	
	@Override
	public String getStore_data(String sType, int sPage, String email) {
		return surveyDAO.getStore_data(sType, sPage, email);
	}
	
	@Override
	public Page_survey getSurveyInfo(String sType, int sPage, String email) {
		Page_survey page_survey = new Page_survey();
		Page_survey ps = surveyDAO.getSurveyInfo(sType, sPage);
		System.out.println(ps);
		if(ps != null) {
			page_survey = new Page_survey(ps.getTop_menu_list_jsonData(), ps.getJsonData());
		}
		String progress_raw = surveyDAO.get_progress_raw(sType, email);
		page_survey.setProgress_raw(progress_raw);
		return page_survey;
	}

	@Override
	public void addCommon_result(String sType, Common_result common_result) {
		surveyDAO.addCommon_result(sType, common_result);
	}

	@Override
	@Transactional
	public void store_survey(Store_survey store_survey) {
		surveyDAO.store_progress_raw(store_survey);
		surveyDAO.store_store_data(store_survey);
	}

	@Override
	public void complete_survey(Store_survey store_survey) {
		surveyDAO.complete_survey(store_survey);
	}





	
	
}
