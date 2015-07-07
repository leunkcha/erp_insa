package com.itnbize.dto;

public class EmpEqmDto {
	private int eqmno;
	private String eqm_name;
	private String eqm_ser;
	private String eqm_assign;
	private String eqm_reg;
	private String eqm_return;
	private String eqm_app;
	private String eqm_get_gbn;
	private int eqm_price;
	private String eqm_start;
	private String eqm_end;
	private String eqm_etc;
	private String eqm_date;
	private String insano;
	
	public EmpEqmDto() {
		// TODO Auto-generated constructor stub
	}

	public int getEqmno() {
		return eqmno;
	}

	public void setEqmno(int eqmno) {
		this.eqmno = eqmno;
	}

	public String getEqm_name() {
		return eqm_name;
	}

	public void setEqm_name(String eqm_name) {
		this.eqm_name = eqm_name;
	}

	public String getEqm_ser() {
		return eqm_ser;
	}

	public void setEqm_ser(String eqm_ser) {
		this.eqm_ser = eqm_ser;
	}

	public String getEqm_assign() {
		return eqm_assign;
	}

	public void setEqm_assign(String eqm_assign) {
		this.eqm_assign = eqm_assign;
	}

	public String getEqm_reg() {
		return eqm_reg;
	}

	public void setEqm_reg(String eqm_reg) {
		this.eqm_reg = eqm_reg;
	}

	public String getEqm_return() {
		return eqm_return;
	}

	public void setEqm_return(String eqm_return) {
		this.eqm_return = eqm_return;
	}

	public String getEqm_app() {
		return eqm_app;
	}

	public void setEqm_app(String eqm_app) {
		this.eqm_app = eqm_app;
	}

	public String getEqm_get_gbn() {
		return eqm_get_gbn;
	}

	public void setEqm_get_gbn(String eqm_get_gbn) {
		this.eqm_get_gbn = eqm_get_gbn;
	}

	public int getEqm_price() {
		return eqm_price;
	}

	public void setEqm_price(int eqm_price) {
		this.eqm_price = eqm_price;
	}

	public String getEqm_start() {
		return eqm_start;
	}

	public void setEqm_start(String eqm_start) {
		this.eqm_start = eqm_start;
	}

	public String getEqm_end() {
		return eqm_end;
	}

	public void setEqm_end(String eqm_end) {
		this.eqm_end = eqm_end;
	}

	public String getEqm_etc() {
		return eqm_etc;
	}

	public void setEqm_etc(String eqm_etc) {
		this.eqm_etc = eqm_etc;
	}

	public String getEqm_date() {
		return eqm_date;
	}

	public void setEqm_date(String eqm_date) {
		this.eqm_date = eqm_date;
	}

	public String getInsano() {
		return insano;
	}

	public void setInsano(String insano) {
		this.insano = insano;
	}

	public EmpEqmDto(int eqmno, String eqm_name, String eqm_ser,
			String eqm_assign, String eqm_reg, String eqm_return,
			String eqm_app, String eqm_get_gbn, int eqm_price,
			String eqm_start, String eqm_end, String eqm_etc, String eqm_date,
			String insano) {
		this.eqmno = eqmno;
		this.eqm_name = eqm_name;
		this.eqm_ser = eqm_ser;
		this.eqm_assign = eqm_assign;
		this.eqm_reg = eqm_reg;
		this.eqm_return = eqm_return;
		this.eqm_app = eqm_app;
		this.eqm_get_gbn = eqm_get_gbn;
		this.eqm_price = eqm_price;
		this.eqm_start = eqm_start;
		this.eqm_end = eqm_end;
		this.eqm_etc = eqm_etc;
		this.eqm_date = eqm_date;
		this.insano = insano;
	}

	@Override
	public String toString() {
		return "{ 'eqmno' : '" + eqmno + "', 'eqm_name' : '" + eqm_name
				+ "', 'eqm_ser' : '" + eqm_ser + "', 'eqm_assign' : '"
				+ eqm_assign + "', 'eqm_reg' : '" + eqm_reg
				+ "', 'eqm_return' : '" + eqm_return + "', 'eqm_app' : '"
				+ eqm_app + "', 'eqm_get_gbn' : '" + eqm_get_gbn
				+ "', 'eqm_price' : '" + eqm_price + "', 'eqm_start' : '"
				+ eqm_start + "', 'eqm_end' : '" + eqm_end + "', 'eqm_etc' : '"
				+ eqm_etc + "', 'eqm_date' : '" + eqm_date + "', 'insano' : '"
				+ insano + "' }";
	}
	
}
