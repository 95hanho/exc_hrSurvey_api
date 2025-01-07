package me._hanho.hrSurvey.model;

public class Store_survey {

	private String sType;
	private int sPage;
	private String store_data;
	private String progress_raw;
	private String email;
	
	public Store_survey() {
		// TODO Auto-generated constructor stub
	}

	public Store_survey(String sType, int sPage, String store_data, String progress_raw, String email) {
		super();
		this.sType = sType;
		this.sPage = sPage;
		this.store_data = store_data;
		this.progress_raw = progress_raw;
		this.email = email;
	}

	public String getsType() {
		return sType;
	}

	public void setsType(String sType) {
		this.sType = sType;
	}

	public int getsPage() {
		return sPage;
	}

	public void setsPage(int sPage) {
		this.sPage = sPage;
	}

	public String getStore_data() {
		return store_data;
	}

	public void setStore_data(String store_data) {
		this.store_data = store_data;
	}

	public String getProgress_raw() {
		return progress_raw;
	}

	public void setProgress_raw(String progress_raw) {
		this.progress_raw = progress_raw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Store_survey [sType=" + sType + ", sPage=" + sPage + ", store_data=" + store_data + ", progress_raw="
				+ progress_raw + ", email=" + email + "]";
	}
}
