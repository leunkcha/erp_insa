package com.itnbize.dto;

public class EmpQualDto {
	private int qualno;
	private String insano;
	private String qual_code;
	private String qual_day;
	private String qual_org;
	private String qual_yn;
	private String qual_etc;
	private String qual_date;
	
	public EmpQualDto() {
		// TODO Auto-generated constructor stub
	}

	public int getQualno() {
		return qualno;
	}

	public void setQualno(int qualno) {
		this.qualno = qualno;
	}

	public String getInsano() {
		return insano;
	}

	public void setInsano(String insano) {
		this.insano = insano;
	}

	public String getQual_code() {
		return qual_code;
	}

	public void setQual_code(String qual_code) {
		this.qual_code = qual_code;
	}

	public String getQual_day() {
		return qual_day;
	}

	public void setQual_day(String qual_day) {
		this.qual_day = qual_day;
	}

	public String getQual_org() {
		return qual_org;
	}

	public void setQual_org(String qual_org) {
		this.qual_org = qual_org;
	}

	public String getQual_yn() {
		return qual_yn;
	}

	public void setQual_yn(String qual_yn) {
		this.qual_yn = qual_yn;
	}

	public String getQual_etc() {
		return qual_etc;
	}

	public void setQual_etc(String qual_etc) {
		this.qual_etc = qual_etc;
	}

	public String getQual_date() {
		return qual_date;
	}

	public void setQual_date(String qual_date) {
		this.qual_date = qual_date;
	}

	public EmpQualDto(int qualno, String insano, String qual_code,
			String qual_day, String qual_org, String qual_yn, String qual_etc,
			String qual_date) {
		this.qualno = qualno;
		this.insano = insano;
		this.qual_code = qual_code;
		this.qual_day = qual_day;
		this.qual_org = qual_org;
		this.qual_yn = qual_yn;
		this.qual_etc = qual_etc;
		this.qual_date = qual_date;
	}

	@Override
	public String toString() {
		return "{ 'qualno' : '" + qualno + "', 'insano' : '" + insano
				+ "', 'qual_code' : '" + qual_code + "', 'qual_day' : '"
				+ qual_day + "', 'qual_org' : '" + qual_org
				+ "', 'qual_yn' : '" + qual_yn + "', 'qual_etc' : '" + qual_etc
				+ "', 'qual_date' : '" + qual_date + "' }";
	}
	
}
