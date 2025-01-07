package me._hanho.hrSurvey.model;

public class Page_survey {
	
	private String progress_raw;
	private String top_menu_list_jsonData;
//	initData
	private String store_data;
	private String jsonData;
//	munhangs
//	requiredList
	
	public Page_survey() {
		// TODO Auto-generated constructor stub
	}
	public Page_survey(String progress_raw, String top_menu_list_jsonData, String jsonData) {
		super();
		this.progress_raw = progress_raw;
		this.top_menu_list_jsonData = top_menu_list_jsonData;
		this.jsonData = jsonData;
	}
	public Page_survey(String progress_raw, String top_menu_list_jsonData, String store_data, String jsonData) {
		super();
		this.progress_raw = progress_raw;
		this.top_menu_list_jsonData = top_menu_list_jsonData;
		this.store_data = store_data;
		this.jsonData = jsonData;
	}
	public Page_survey(String top_menu_list_jsonData, String jsonData) {
		super();
		this.top_menu_list_jsonData = top_menu_list_jsonData;
		this.jsonData = jsonData;
	}
	public String getProgress_raw() {
		return progress_raw;
	}
	public void setProgress_raw(String progress_raw) {
		this.progress_raw = progress_raw;
	}
	public String getTop_menu_list_jsonData() {
		return top_menu_list_jsonData;
	}
	public void setTop_menu_list_jsonData(String top_menu_list_jsonData) {
		this.top_menu_list_jsonData = top_menu_list_jsonData;
	}
	public String getJsonData() {
		return jsonData;
	}
	public void setJsonData(String jsonData) {
		this.jsonData = jsonData;
	}
	public String getStore_data() {
		return store_data;
	}
	public void setStore_data(String store_data) {
		this.store_data = store_data;
	}
	@Override
	public String toString() {
		return "Page_survey [progress_raw=" + progress_raw + ", top_menu_list_jsonData=" + top_menu_list_jsonData
				+ ", store_data=" + store_data + ", jsonData=" + jsonData + "]";
	}
}
