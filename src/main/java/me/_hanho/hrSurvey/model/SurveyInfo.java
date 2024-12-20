package me._hanho.hrSurvey.model;

import java.util.List;

public class SurveyInfo {
	
	private String initData;
	private String initData_JSON;
	private String munhangs;
	private String requiredList;
	private List<String> top_menuList;
		
	private int p_survey_id;
	private String top_menu_list_jsonData;
	private String jsonData;
	private int survey_id;
	
	public SurveyInfo() {
		// TODO Auto-generated constructor stub
	}

	public SurveyInfo(String initData, String initData_JSON, String munhangs, String requiredList,
			List<String> top_menuList, String jsonData, String top_menu_list_jsonData) {
		super();
		this.initData = initData;
		this.initData_JSON = initData_JSON;
		this.munhangs = munhangs;
		this.requiredList = requiredList;
		this.top_menuList = top_menuList;
		this.jsonData = jsonData;
		this.top_menu_list_jsonData = top_menu_list_jsonData;
	}
	
	public SurveyInfo(String initData, String initData_JSON, String munhangs, String requiredList,
			List<String> top_menuList, String top_menu_list_jsonData, String jsonData, int survey_id) {
		super();
		this.initData = initData;
		this.initData_JSON = initData_JSON;
		this.munhangs = munhangs;
		this.requiredList = requiredList;
		this.top_menuList = top_menuList;
		this.top_menu_list_jsonData = top_menu_list_jsonData;
		this.jsonData = jsonData;
		this.survey_id = survey_id;
	}

	public SurveyInfo(String initData, String initData_JSON, String munhangs, String requiredList,
			List<String> top_menuList, int p_survey_id, String top_menu_list_jsonData, String jsonData, int survey_id) {
		super();
		this.initData = initData;
		this.initData_JSON = initData_JSON;
		this.munhangs = munhangs;
		this.requiredList = requiredList;
		this.top_menuList = top_menuList;
		this.p_survey_id = p_survey_id;
		this.top_menu_list_jsonData = top_menu_list_jsonData;
		this.jsonData = jsonData;
		this.survey_id = survey_id;
	}

	public String getInitData() {
		return initData;
	}

	public void setInitData(String initData) {
		this.initData = initData;
	}

	public String getInitData_JSON() {
		return initData_JSON;
	}

	public void setInitData_JSON(String initData_JSON) {
		this.initData_JSON = initData_JSON;
	}

	public String getMunhangs() {
		return munhangs;
	}

	public void setMunhangs(String munhangs) {
		this.munhangs = munhangs;
	}

	public String getRequiredList() {
		return requiredList;
	}

	public void setRequiredList(String requiredList) {
		this.requiredList = requiredList;
	}

	public List<String> getTop_menuList() {
		return top_menuList;
	}

	public void setTop_menuList(List<String> top_menuList) {
		this.top_menuList = top_menuList;
	}

	public String getJsonData() {
		return jsonData;
	}

	public void setJsonData(String jsonData) {
		this.jsonData = jsonData;
	}

	public String getTop_menu_list_jsonData() {
		return top_menu_list_jsonData;
	}

	public void setTop_menu_list_jsonData(String top_menu_list_jsonData) {
		this.top_menu_list_jsonData = top_menu_list_jsonData;
	}

	public int getSurvey_id() {
		return survey_id;
	}

	public void setSurvey_id(int survey_id) {
		this.survey_id = survey_id;
	}
	
	public int getP_survey_id() {
		return p_survey_id;
	}

	public void setP_survey_id(int p_survey_id) {
		this.p_survey_id = p_survey_id;
	}

	@Override
	public String toString() {
		return "SurveyInfo [initData=" + initData + ", initData_JSON=" + initData_JSON + ", munhangs=" + munhangs
				+ ", requiredList=" + requiredList + ", top_menuList=" + top_menuList + ", p_survey_id=" + p_survey_id
				+ ", top_menu_list_jsonData=" + top_menu_list_jsonData + ", jsonData=" + jsonData + ", survey_id="
				+ survey_id + "]";
	}

}
