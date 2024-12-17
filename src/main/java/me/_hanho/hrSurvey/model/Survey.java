package me._hanho.hrSurvey.model;

public class Survey {
	
	private int tesci_idx;
	private String tesci_bottom_img;
	private String survey_description;
	private String tesci_description;
	private String tesci_image;
	private String survey_name;
	private String tesci_name;
	private String survey_url;
	private String tesci_url;
	private int tesci_year;
	
	public Survey() {
		// TODO Auto-generated constructor stub
	}

	public Survey(int tesci_idx, String tesci_bottom_img, String survey_description, String tesci_description,
			String tesci_image, String survey_name, String tesci_name, String survey_url, String tesci_url,
			int tesci_year) {
		super();
		this.tesci_idx = tesci_idx;
		this.tesci_bottom_img = tesci_bottom_img;
		this.survey_description = survey_description;
		this.tesci_description = tesci_description;
		this.tesci_image = tesci_image;
		this.survey_name = survey_name;
		this.tesci_name = tesci_name;
		this.survey_url = survey_url;
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

	@Override
	public String toString() {
		return "Survey [tesci_idx=" + tesci_idx + ", tesci_bottom_img=" + tesci_bottom_img + ", survey_description="
				+ survey_description + ", tesci_description=" + tesci_description + ", tesci_image=" + tesci_image
				+ ", survey_name=" + survey_name + ", tesci_name=" + tesci_name + ", survey_url=" + survey_url
				+ ", tesci_url=" + tesci_url + ", tesci_year=" + tesci_year + "]";
	}

}
