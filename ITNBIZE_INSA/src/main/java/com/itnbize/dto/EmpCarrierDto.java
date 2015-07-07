package com.itnbize.dto;

public class EmpCarrierDto {
	private int carnum;
	private String car_cmp_name;
    private String car_wrk_start;
    private String car_wrk_end;
    private String car_pos_gbn;
    private String car_respon;
    private String car_work;
    private String car_date;
    private String insano;
    
    public EmpCarrierDto() {
		// TODO Auto-generated constructor stub
	}

	public int getCarnum() {
		return carnum;
	}

	public void setCarnum(int carnum) {
		this.carnum = carnum;
	}

	public String getCar_cmp_name() {
		return car_cmp_name;
	}

	public void setCar_cmp_name(String car_cmp_name) {
		this.car_cmp_name = car_cmp_name;
	}

	public String getCar_wrk_start() {
		return car_wrk_start;
	}

	public void setCar_wrk_start(String car_wrk_start) {
		this.car_wrk_start = car_wrk_start;
	}

	public String getCar_wrk_end() {
		return car_wrk_end;
	}

	public void setCar_wrk_end(String car_wrk_end) {
		this.car_wrk_end = car_wrk_end;
	}

	public String getCar_pos_gbn() {
		return car_pos_gbn;
	}

	public void setCar_pos_gbn(String car_pos_gbn) {
		this.car_pos_gbn = car_pos_gbn;
	}

	public String getCar_respon() {
		return car_respon;
	}

	public void setCar_respon(String car_respon) {
		this.car_respon = car_respon;
	}

	public String getCar_work() {
		return car_work;
	}

	public void setCar_work(String car_work) {
		this.car_work = car_work;
	}

	public String getCar_date() {
		return car_date;
	}

	public void setCar_date(String car_date) {
		this.car_date = car_date;
	}

	public String getInsano() {
		return insano;
	}

	public void setInsano(String insano) {
		this.insano = insano;
	}

	public EmpCarrierDto(int carnum, String car_cmp_name, String car_wrk_start,
			String car_wrk_end, String car_pos_gbn, String car_respon,
			String car_work, String car_date, String insano) {
		this.carnum = carnum;
		this.car_cmp_name = car_cmp_name;
		this.car_wrk_start = car_wrk_start;
		this.car_wrk_end = car_wrk_end;
		this.car_pos_gbn = car_pos_gbn;
		this.car_respon = car_respon;
		this.car_work = car_work;
		this.car_date = car_date;
		this.insano = insano;
	}

	@Override
	public String toString() {
		return "{ 'carnum' : '" + carnum + "', 'car_cmp_name' : '"
				+ car_cmp_name + "', 'car_wrk_start' : '" + car_wrk_start
				+ "', 'car_wrk_end' : '" + car_wrk_end + "', 'car_pos_gbn' : '"
				+ car_pos_gbn + "', 'car_respon' : '" + car_respon
				+ "', 'car_work' : '" + car_work + "', 'car_date' : '"
				+ car_date + "', 'insano' : '" + insano + "' }";
	}
    
}
