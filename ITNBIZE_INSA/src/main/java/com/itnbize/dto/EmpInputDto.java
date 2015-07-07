package com.itnbize.dto;

public class EmpInputDto {
	private int inputno;
	private String input_posb;
	private int input_price;
	private String input_pjt;
	private String input_eqm_yn;
	private String input_sido;
	private int input_salary;
	private String input_sigun;
	private String input_date;
	private String insano;
	
	public EmpInputDto() {
		// TODO Auto-generated constructor stub
	}

	public int getInputno() {
		return inputno;
	}

	public void setInputno(int inputno) {
		this.inputno = inputno;
	}

	public String getInput_posb() {
		return input_posb;
	}

	public void setInput_posb(String input_posb) {
		this.input_posb = input_posb;
	}

	public int getInput_price() {
		return input_price;
	}

	public void setInput_price(int input_price) {
		this.input_price = input_price;
	}

	public String getInput_pjt() {
		return input_pjt;
	}

	public void setInput_pjt(String input_pjt) {
		this.input_pjt = input_pjt;
	}

	public String getInput_eqm_yn() {
		return input_eqm_yn;
	}

	public void setInput_eqm_yn(String input_eqm_yn) {
		this.input_eqm_yn = input_eqm_yn;
	}

	public String getInput_sido() {
		return input_sido;
	}

	public void setInput_sido(String input_sido) {
		this.input_sido = input_sido;
	}

	public int getInput_salary() {
		return input_salary;
	}

	public void setInput_salary(int input_salary) {
		this.input_salary = input_salary;
	}

	public String getInput_sigun() {
		return input_sigun;
	}

	public void setInput_sigun(String input_sigun) {
		this.input_sigun = input_sigun;
	}

	public String getInput_date() {
		return input_date;
	}

	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}

	public String getInsano() {
		return insano;
	}

	public void setInsano(String insano) {
		this.insano = insano;
	}

	public EmpInputDto(int inputno, String input_posb, int input_price,
			String input_pjt, String input_eqm_yn, String input_sido,
			int input_salary, String input_sigun, String input_date,
			String insano) {
		this.inputno = inputno;
		this.input_posb = input_posb;
		this.input_price = input_price;
		this.input_pjt = input_pjt;
		this.input_eqm_yn = input_eqm_yn;
		this.input_sido = input_sido;
		this.input_salary = input_salary;
		this.input_sigun = input_sigun;
		this.input_date = input_date;
		this.insano = insano;
	}

	@Override
	public String toString() {
		return "{ 'inputno' : '" + inputno + "', 'input_posb' : '" + input_posb
				+ "', 'input_price' : '" + input_price + "', 'input_pjt' : '"
				+ input_pjt + "', 'input_eqm_yn' : '" + input_eqm_yn
				+ "', 'input_sido' : '" + input_sido + "', 'input_salary' : '"
				+ input_salary + "', 'input_sigun' : '" + input_sigun
				+ "', 'input_date' : '" + input_date + "', 'insano' : '"
				+ insano + "' }";
	}
	
}
