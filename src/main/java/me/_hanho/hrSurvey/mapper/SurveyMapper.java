package me._hanho.hrSurvey.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import me._hanho.hrSurvey.model.Common_info;
import me._hanho.hrSurvey.model.Common_result;
import me._hanho.hrSurvey.model.Page_survey;

@Mapper
public interface SurveyMapper {

	Common_info getCommon_info(int s_year);

	int hasSurvey(String sType);

	String getStore_data(@Param("sType") String sType, @Param("sPage") int sPage, @Param("email") String email);
	
	Page_survey getSurveyInfo(@Param("sType") String sType, @Param("sPage") int sPage, @Param("email") String email);

	void addCommon_result(@Param("sType") String sType, @Param("c_r") Common_result common_result);

	
	
	
}
