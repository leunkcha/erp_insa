package com.itnbize.dao;

import java.util.ArrayList;

import com.itnbize.dto.EmpDto;

public interface EmpDao {
	public EmpDto INSA_LIST_SELECT(int insano);
	public void Insa_update(EmpDto empDto);
	public int Insa_Id_Max(int insa_join_gbn);
	public void Insa_Insert(EmpDto empDto);
	public ArrayList<EmpDto> Insa_List(String insano, String insa_name,
			String insa_join_gbn, String insa_put,String insa_pos_gbn,
			String insa_start,String insa_end );
}
