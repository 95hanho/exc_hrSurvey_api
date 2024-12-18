package me._hanho.hrSurvey.model;

public class Survey_JSON {

	private String jsonData;
	private String top_menu_list_jsonData;
	
	public Survey_JSON() {
		// TODO Auto-generated constructor stub
	}

	public Survey_JSON(String jsonData, String top_menu_list_jsonData) {
		super();
		this.jsonData = jsonData;
		this.top_menu_list_jsonData = top_menu_list_jsonData;
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

	@Override
	public String toString() {
		return "Survey_JSON [jsonData=" + jsonData + ", top_menu_list_jsonData=" + top_menu_list_jsonData + "]";
	}
	
}
