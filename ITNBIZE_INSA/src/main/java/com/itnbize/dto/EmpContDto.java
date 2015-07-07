package com.itnbize.dto;

public class EmpContDto {
	private int contno;
	private int cont_price;
	private String cont_start;
	private String cont_end;
	private String cont_type;
	private String cont_date;
	private String insano;
	
	public EmpContDto() {
		// TODO Auto-generated constructor stub
	}

	public int getContno() {
		return contno;
	}

	public void setContno(int contno) {
		this.contno = contno;
	}

	public int getCont_price() {
		return cont_price;
	}

	public void setCont_price(int cont_price) {
		this.cont_price = cont_price;
	}

	public String getCont_start() {
		return cont_start;
	}

	public void setCont_start(String cont_start) {
		this.cont_start = cont_start;
	}

	public String getCont_end() {
		return cont_end;
	}

	public void setCont_end(String cont_end) {
		this.cont_end = cont_end;
	}

	public String getCont_type() {
		return cont_type;
	}

	public void setCont_type(String cont_type) {
		this.cont_type = cont_type;
	}

	public String getCont_date() {
		return cont_date;
	}

	public void setCont_date(String cont_date) {
		this.cont_date = cont_date;
	}

	public String getInsano() {
		return insano;
	}

	public void setInsano(String insano) {
		this.insano = insano;
	}

	public EmpContDto(int contno, int cont_price, String cont_start,
			String cont_end, String cont_type, String cont_date, String insano) {
		this.contno = contno;
		this.cont_price = cont_price;
		this.cont_start = cont_start;
		this.cont_end = cont_end;
		this.cont_type = cont_type;
		this.cont_date = cont_date;
		this.insano = insano;
	}

	@Override
	public String toString() {
		return "{ 'contno' : '" + contno + "', 'cont_price' : '" + cont_price
				+ "', 'cont_start' : '" + cont_start + "', 'cont_end' : '"
				+ cont_end + "', 'cont_type' : '" + cont_type
				+ "', 'cont_date' : '" + cont_date + "', 'insano' : '" + insano
				+ "' }";
	}
	
}
