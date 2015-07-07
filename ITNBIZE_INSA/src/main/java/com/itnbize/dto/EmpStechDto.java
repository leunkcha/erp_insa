package com.itnbize.dto;

public class EmpStechDto {
	private int stechnum;
	private String ste_tech;
	private String ste_skill;
	private String ste_date;
	
	public EmpStechDto() {
		// TODO Auto-generated constructor stub
	}

	public int getStechnum() {
		return stechnum;
	}

	public void setStechnum(int stechnum) {
		this.stechnum = stechnum;
	}

	public String getSte_tech() {
		return ste_tech;
	}

	public void setSte_tech(String ste_tech) {
		this.ste_tech = ste_tech;
	}

	public String getSte_skill() {
		return ste_skill;
	}

	public void setSte_skill(String ste_skill) {
		this.ste_skill = ste_skill;
	}

	public String getSte_date() {
		return ste_date;
	}

	public void setSte_date(String ste_date) {
		this.ste_date = ste_date;
	}

	public EmpStechDto(int stechnum, String ste_tech, String ste_skill,
			String ste_date) {
		this.stechnum = stechnum;
		this.ste_tech = ste_tech;
		this.ste_skill = ste_skill;
		this.ste_date = ste_date;
	}

	@Override
	public String toString() {
		return "{ 'stechnum' : '" + stechnum + "', 'ste_tech' : '" + ste_tech
				+ "', 'ste_skill' : '" + ste_skill + "', 'ste_date' : '"
				+ ste_date + "' }";
	}
	
}
