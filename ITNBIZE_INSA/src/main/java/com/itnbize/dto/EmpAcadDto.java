package com.itnbize.dto;

public class EmpAcadDto {
	private int acanum;
	private String aca_major;
    private String aca_grat;
    private String aca_year;
    private String aca_month;
    private String aca_school;
    private String aca_date;
    private String insano;
    
    public EmpAcadDto() {
		// TODO Auto-generated constructor stub
	}

	public int getAcanum() {
		return acanum;
	}

	public void setAcanum(int acanum) {
		this.acanum = acanum;
	}

	public String getAca_major() {
		return aca_major;
	}

	public void setAca_major(String aca_major) {
		this.aca_major = aca_major;
	}

	public String getAca_grat() {
		return aca_grat;
	}

	public void setAca_grat(String aca_grat) {
		this.aca_grat = aca_grat;
	}

	public String getAca_year() {
		return aca_year;
	}

	public void setAca_year(String aca_year) {
		this.aca_year = aca_year;
	}

	public String getAca_month() {
		return aca_month;
	}

	public void setAca_month(String aca_month) {
		this.aca_month = aca_month;
	}

	public String getAca_school() {
		return aca_school;
	}

	public void setAca_school(String aca_school) {
		this.aca_school = aca_school;
	}

	public String getAca_date() {
		return aca_date;
	}

	public void setAca_date(String aca_date) {
		this.aca_date = aca_date;
	}

	public String getInsano() {
		return insano;
	}

	public void setInsano(String insano) {
		this.insano = insano;
	}

	public EmpAcadDto(int acanum, String aca_major, String aca_grat,
			String aca_year, String aca_month, String aca_school,
			String aca_date, String insano) {
		this.acanum = acanum;
		this.aca_major = aca_major;
		this.aca_grat = aca_grat;
		this.aca_year = aca_year;
		this.aca_month = aca_month;
		this.aca_school = aca_school;
		this.aca_date = aca_date;
		this.insano = insano;
	}

	@Override
	public String toString() {
		return "{ 'acanum' : '" + acanum + "', 'aca_major' : '" + aca_major
				+ "', 'aca_grat' : '" + aca_grat + "', 'aca_year' : '"
				+ aca_year + "', 'aca_month' : '" + aca_month
				+ "', 'aca_school' : '" + aca_school + "', 'aca_date' : '"
				+ aca_date + "', 'insano' : '" + insano + "' }";
	}

	
	
    
}
