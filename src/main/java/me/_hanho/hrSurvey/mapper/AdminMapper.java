package me._hanho.hrSurvey.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import me._hanho.hrSurvey.model.Common_info;
import me._hanho.hrSurvey.model.Survey;
import me._hanho.hrSurvey.model.SurveyInfo;

@Mapper
public interface AdminMapper {

	Common_info getCommonInfo(int s_year);

	void addCommonInfo(int s_year);

	List<Survey> getSurveys(int s_year);

	void addSurvey(Survey survey);

	void adminSetCommon(@Param("c_info") Common_info c_info, @Param("s_year") int s_year);

	void adminSetSurvey(@Param("survey") Survey survey, @Param("s_year") int s_year);

	SurveyInfo getSurveyInfo(@Param("sType") String sType, @Param("sPage") int sPage);
	
	int hasSurvey(String sType);
	
	void addPageSurvey(@Param("sType") String sType, @Param("pageNum") int pageNum);
	
	int getSurveyPageCount(String sType);
	
	int getSurveyPageCount2(@Param("sType") String sType, @Param("pageNum") int pageNum);
	
	int getSurveyId(String sType);
	
	void updateSurvey(@Param("sType") String sType, @Param("surveyInfo") SurveyInfo surveyInfo);

	void updatePageSurvey(@Param("sPage") int sPage, @Param("sType") String sType, @Param("surveyInfo") SurveyInfo surveyInfo);


	
}
