package com.itnbize.dto;

public class EmpSkillDto {

	private int skilno;
    private String skil_pjt;
    private String skil_cmp;
    private String skil_wrk_cmp;
    private String skil_indu;
    private String skil_appli;
    private String skil_role;
    private String skil_model;
    private String skil_os;
    private String skil_lang;
    private String skil_dbms;
    private String skil_tool;
    private String skil_telec;
    private String skil_etc;
    private String skil_start;
    private String skil_end;
    private String skil_date;
    private String insano;
    
    public EmpSkillDto() {
		// TODO Auto-generated constructor stub
	}
    
	public int getSkilno() {
		return skilno;
	}
	public void setSkilno(int skilno) {
		this.skilno = skilno;
	}
	public String getSkil_pjt() {
		return skil_pjt;
	}
	public void setSkil_pjt(String skil_pjt) {
		this.skil_pjt = skil_pjt;
	}
	public String getSkil_cmp() {
		return skil_cmp;
	}
	public void setSkil_cmp(String skil_cmp) {
		this.skil_cmp = skil_cmp;
	}
	public String getSkil_wrk_cmp() {
		return skil_wrk_cmp;
	}
	public void setSkil_wrk_cmp(String skil_wrk_cmp) {
		this.skil_wrk_cmp = skil_wrk_cmp;
	}
	public String getSkil_indu() {
		return skil_indu;
	}
	public void setSkil_indu(String skil_indu) {
		this.skil_indu = skil_indu;
	}
	public String getSkil_appli() {
		return skil_appli;
	}
	public void setSkil_appli(String skil_appli) {
		this.skil_appli = skil_appli;
	}
	public String getSkil_role() {
		return skil_role;
	}
	public void setSkil_role(String skil_role) {
		this.skil_role = skil_role;
	}
	public String getSkil_model() {
		return skil_model;
	}
	public void setSkil_model(String skil_model) {
		this.skil_model = skil_model;
	}
	public String getSkil_os() {
		return skil_os;
	}
	public void setSkil_os(String skil_os) {
		this.skil_os = skil_os;
	}
	public String getSkil_lang() {
		return skil_lang;
	}
	public void setSkil_lang(String skil_lang) {
		this.skil_lang = skil_lang;
	}
	public String getSkil_dbms() {
		return skil_dbms;
	}
	public void setSkil_dbms(String skil_dbms) {
		this.skil_dbms = skil_dbms;
	}
	public String getSkil_tool() {
		return skil_tool;
	}
	public void setSkil_tool(String skil_tool) {
		this.skil_tool = skil_tool;
	}
	public String getSkil_telec() {
		return skil_telec;
	}
	public void setSkil_telec(String skil_telec) {
		this.skil_telec = skil_telec;
	}
	public String getSkil_etc() {
		return skil_etc;
	}
	public void setSkil_etc(String skil_etc) {
		this.skil_etc = skil_etc;
	}
	public String getSkil_start() {
		return skil_start;
	}
	public void setSkil_start(String skil_start) {
		this.skil_start = skil_start;
	}
	public String getSkil_end() {
		return skil_end;
	}
	public void setSkil_end(String skil_end) {
		this.skil_end = skil_end;
	}
	public String getSkil_date() {
		return skil_date;
	}
	public void setSkil_date(String skil_date) {
		this.skil_date = skil_date;
	}
	public String getInsano() {
		return insano;
	}
	public void setInsano(String insano) {
		this.insano = insano;
	}
	public EmpSkillDto(int skilno, String skil_pjt, String skil_cmp,
			String skil_wrk_cmp, String skil_indu, String skil_appli,
			String skil_role, String skil_model, String skil_os,
			String skil_lang, String skil_dbms, String skil_tool,
			String skil_telec, String skil_etc, String skil_start,
			String skil_end, String skil_date, String insano) {
		this.skilno = skilno;
		this.skil_pjt = skil_pjt;
		this.skil_cmp = skil_cmp;
		this.skil_wrk_cmp = skil_wrk_cmp;
		this.skil_indu = skil_indu;
		this.skil_appli = skil_appli;
		this.skil_role = skil_role;
		this.skil_model = skil_model;
		this.skil_os = skil_os;
		this.skil_lang = skil_lang;
		this.skil_dbms = skil_dbms;
		this.skil_tool = skil_tool;
		this.skil_telec = skil_telec;
		this.skil_etc = skil_etc;
		this.skil_start = skil_start;
		this.skil_end = skil_end;
		this.skil_date = skil_date;
		this.insano = insano;
	}

	@Override
	public String toString() {
		return "{ 'skilno' : '" + skilno + "', 'skil_pjt' : '" + skil_pjt
				+ "', 'skil_cmp' : '" + skil_cmp + "', 'skil_wrk_cmp' : '"
				+ skil_wrk_cmp + "', 'skil_indu' : '" + skil_indu
				+ "', 'skil_appli' : '" + skil_appli + "', 'skil_role' : '"
				+ skil_role + "', 'skil_model' : '" + skil_model
				+ "', 'skil_os' : '" + skil_os + "', 'skil_lang' : '"
				+ skil_lang + "', 'skil_dbms' : '" + skil_dbms
				+ "', 'skil_tool' : '" + skil_tool + "', 'skil_telec' : '"
				+ skil_telec + "', 'skil_etc' : '" + skil_etc
				+ "', 'skil_start' : '" + skil_start + "', 'skil_end' : '"
				+ skil_end + "', 'skil_date' : '" + skil_date
				+ "', 'insano' : '" + insano + "' }";
	}
    
    
}
