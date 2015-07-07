package com.itnbize.dto;

public class EmpEduDto {
	private int eduno;
	private String edu_name;
	private String edu_start;
	private String edu_end;
	private String edu_org;
	private String edu_cont;
	private String edu_yn;
	private int edu_ass;
	private int edu_rem;
	private String edu_date;
	private String insano;
	
	public EmpEduDto() {
		// TODO Auto-generated constructor stub
	}

	public int getEduno() {
		return eduno;
	}

	public void setEduno(int eduno) {
		this.eduno = eduno;
	}

	public String getEdu_name() {
		return edu_name;
	}

	public void setEdu_name(String edu_name) {
		this.edu_name = edu_name;
	}

	public String getEdu_start() {
		return edu_start;
	}

	public void setEdu_start(String edu_start) {
		this.edu_start = edu_start;
	}

	public String getEdu_end() {
		return edu_end;
	}

	public void setEdu_end(String edu_end) {
		this.edu_end = edu_end;
	}

	public String getEdu_org() {
		return edu_org;
	}

	public void setEdu_org(String edu_org) {
		this.edu_org = edu_org;
	}

	public String getEdu_cont() {
		return edu_cont;
	}

	public void setEdu_cont(String edu_cont) {
		this.edu_cont = edu_cont;
	}

	public String getEdu_yn() {
		return edu_yn;
	}

	public void setEdu_yn(String edu_yn) {
		this.edu_yn = edu_yn;
	}

	public int getEdu_ass() {
		return edu_ass;
	}

	public void setEdu_ass(int edu_ass) {
		this.edu_ass = edu_ass;
	}

	public int getEdu_rem() {
		return edu_rem;
	}

	public void setEdu_rem(int edu_rem) {
		this.edu_rem = edu_rem;
	}

	public String getEdu_date() {
		return edu_date;
	}

	public void setEdu_date(String edu_date) {
		this.edu_date = edu_date;
	}

	public String getInsano() {
		return insano;
	}

	public void setInsano(String insano) {
		this.insano = insano;
	}

	public EmpEduDto(int eduno, String edu_name, String edu_start,
			String edu_end, String edu_org, String edu_cont, String edu_yn,
			int edu_ass, int edu_rem, String edu_date, String insano) {
		this.eduno = eduno;
		this.edu_name = edu_name;
		this.edu_start = edu_start;
		this.edu_end = edu_end;
		this.edu_org = edu_org;
		this.edu_cont = edu_cont;
		this.edu_yn = edu_yn;
		this.edu_ass = edu_ass;
		this.edu_rem = edu_rem;
		this.edu_date = edu_date;
		this.insano = insano;
	}

	@Override
	public String toString() {
		return "{ 'eduno' : '" + eduno + "', 'edu_name' : '" + edu_name
				+ "', 'edu_start' : '" + edu_start + "', 'edu_end' : '"
				+ edu_end + "', 'edu_org' : '" + edu_org + "', 'edu_cont' : '"
				+ edu_cont + "', 'edu_yn' : '" + edu_yn + "', 'edu_ass' : '"
				+ edu_ass + "', 'edu_rem' : '" + edu_rem + "', 'edu_date' : '"
				+ edu_date + "', 'insano' : '" + insano + "' }";
	}
	
}
