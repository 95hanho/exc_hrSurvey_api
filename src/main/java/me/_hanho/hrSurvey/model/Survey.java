package me._hanho.hrSurvey.model;

public class Survey {
	
	private int survey_id;
	private String survey_description;
	private String survey_url;
	private String survey_name;
	private String jsonData;
	private String top_menu_list_jsonData;
	private int year;
	
	private int tesci_idx;
	private String tesci_bottom_img;
	private String tesci_description;
	private String tesci_image;
	private String tesci_name;
	private String tesci_url;
	private int tesci_year;
	
	public Survey() {
		// TODO Auto-generated constructor stub
	}
	
	public Survey(String survey_url, String survey_name, int year) {
		super();
		this.survey_url = survey_url;
		this.survey_name = survey_name;
		this.year = year;
	}

	public Survey(int survey_id, String survey_description, String survey_url, String survey_name, String jsonData,
			String top_menu_list_jsonData, int year, int tesci_idx, String tesci_bottom_img, String tesci_description,
			String tesci_image, String tesci_name, String tesci_url, int tesci_year) {
		super();
		this.survey_id = survey_id;
		this.survey_description = survey_description;
		this.survey_url = survey_url;
		this.survey_name = survey_name;
		this.jsonData = jsonData;
		this.top_menu_list_jsonData = top_menu_list_jsonData;
		this.year = year;
		this.tesci_idx = tesci_idx;
		this.tesci_bottom_img = tesci_bottom_img;
		this.tesci_description = tesci_description;
		this.tesci_image = tesci_image;
		this.tesci_name = tesci_name;
		this.tesci_url = tesci_url;
		this.tesci_year = tesci_year;
	}

	public int getTesci_idx() {
		return tesci_idx;
	}

	public void setTesci_idx(int tesci_idx) {
		this.tesci_idx = tesci_idx;
	}

	public String getTesci_bottom_img() {
		return tesci_bottom_img;
	}

	public void setTesci_bottom_img(String tesci_bottom_img) {
		this.tesci_bottom_img = tesci_bottom_img;
	}

	public String getTesci_description() {
		return tesci_description;
	}

	public void setTesci_description(String tesci_description) {
		this.tesci_description = tesci_description;
	}

	public String getTesci_image() {
		return tesci_image;
	}

	public void setTesci_image(String tesci_image) {
		this.tesci_image = tesci_image;
	}

	public String getTesci_name() {
		return tesci_name;
	}

	public void setTesci_name(String tesci_name) {
		this.tesci_name = tesci_name;
	}

	public String getTesci_url() {
		return tesci_url;
	}

	public void setTesci_url(String tesci_url) {
		this.tesci_url = tesci_url;
	}

	public int getTesci_year() {
		return tesci_year;
	}

	public void setTesci_year(int tesci_year) {
		this.tesci_year = tesci_year;
	}

	public String getSurvey_description() {
		return survey_description;
	}

	public void setSurvey_description(String survey_description) {
		this.survey_description = survey_description;
	}

	public String getSurvey_name() {
		return survey_name;
	}

	public void setSurvey_name(String survey_name) {
		this.survey_name = survey_name;
	}

	public String getSurvey_url() {
		return survey_url;
	}

	public void setSurvey_url(String survey_url) {
		this.survey_url = survey_url;
	}
	
	public int getSurvey_id() {
		return survey_id;
	}

	public void setSurvey_id(int survey_id) {
		this.survey_id = survey_id;
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

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	@Override
	public String toString() {
		return "Survey [survey_id=" + survey_id + ", survey_description=" + survey_description + ", survey_url="
				+ survey_url + ", survey_name=" + survey_name + ", jsonData=" + jsonData + ", top_menu_list_jsonData="
				+ top_menu_list_jsonData + ", year=" + year + ", tesci_idx=" + tesci_idx + ", tesci_bottom_img="
				+ tesci_bottom_img + ", tesci_description=" + tesci_description + ", tesci_image=" + tesci_image
				+ ", tesci_name=" + tesci_name + ", tesci_url=" + tesci_url + ", tesci_year=" + tesci_year + "]";
	}

}
