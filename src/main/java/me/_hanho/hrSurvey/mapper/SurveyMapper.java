package me._hanho.hrSurvey.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import me._hanho.hrSurvey.model.Common_info;
import me._hanho.hrSurvey.model.Common_result;
import me._hanho.hrSurvey.model.Page_survey;
import me._hanho.hrSurvey.model.Store_survey;

@Mapper
public interface SurveyMapper {

	Common_info getCommon_info(int s_year);

	int hasSurvey(String sType);
	
	int getEmailCount(@Param("sType") String sType, @Param("email") String email);
	
	boolean getComplete(@Param("sType") String sType, @Param("email") String email);

	Common_info getCommon_info2(String sType);

	String getStore_data(@Param("sType") String sType, @Param("sPage") int sPage, @Param("email") String email);
	
	Page_survey getSurveyInfo(@Param("sType") String sType, @Param("sPage") int sPage);

	String get_progress_raw(@Param("sType") String sType, @Param("email") String email);
	
	void addCommon_result(@Param("sType") String sType, @Param("c_r") Common_result common_result);

	void store_progress_raw(Store_survey store_survey);

	int has_store_survey(Store_survey store_survey);
	
	void insert_store_data(Store_survey store_survey);

	void update_store_data(Store_survey store_survey);

	void complete_survey(Store_survey store_survey);
	
	
}
