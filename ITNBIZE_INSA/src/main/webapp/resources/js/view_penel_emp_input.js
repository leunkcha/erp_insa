function clean_penel(){
	var curnType = $("#emp_sub_cnt_temp").val();
	
	switch(curnType){
	case "emp_input":
		console.log("set_input call");
		set_input("");
		break;
	case "emp_acad":
		set_acad(null);
		break;
	case "emp_carrier":
		set_carrier(null);
		break;
	case "emp_edu":
		set_edu(null);
		break;
	case "emp_stech":
		set_stech(null);
		break;
	case "emp_qual":
		set_qual(null);
		break;
	case "emp_cont":
		set_cont(null);
		break;
	case "emp_eqm":
		set_eqm(null);
		break;
	case "emp_skill":
		set_skill(null);
		break;
	}
}
function set_input(obj){
	
	var input_eqm_yn = obj.input_eqm_yn;
	if(input_eqm_yn == null){
		input_eqm_yn = 0;
	}
	$("#penel_body #penel_emp_input input[name=input_posb]").val(obj.input_posb);
	$("#penel_body #penel_emp_input input[name=input_price]").val(obj.input_price);
	$("#penel_body #penel_emp_input input[name=input_pjt]").val(obj.input_pjt);
	$("#penel_body #penel_emp_input select[name=input_eqm_yn] option:eq("+input_eqm_yn+")").attr("selected","selected");
	$("#penel_body #penel_emp_input input[name=input_salary]").val(obj);
	$("#penel_body #penel_emp_input input[name=input_sigun]").val(obj);
}
function set_acad(obj){
	$("#penel_body #penel_emp_acad input[name=aca_major]").val(obj);
	$("#penel_body #penel_emp_acad input[name=aca_grat]").val(obj);
	$("#penel_body #penel_emp_acad input[name=aca_year]").val(obj);
	$("#penel_body #penel_emp_acad input[name=aca_month]").val(obj);
	$("#penel_body #penel_emp_acad input[name=aca_school]").val(obj);
}
function set_carrier(obj){
	$("#penel_body #penel_emp_carrier input[name=car_cmp_name]").val(obj);
	$("#penel_body #penel_emp_carrier input[name=car_wrk_start]").val(obj);
	$("#penel_body #penel_emp_carrier input[name=car_wrk_end]").val(obj);
	$("#penel_body #penel_emp_carrier input[name=car_pos_gbn]").val(obj);
	$("#penel_body #penel_emp_carrier input[name=car_respon]").val(obj);
	$("#penel_body #penel_emp_carrier input[name=car_work]").val(obj);
}
function set_edu(obj){
	$("#penel_body #penel_emp_edu input[name=edu_name]").val(obj);
	$("#penel_body #penel_emp_edu input[name=edu_start]").val(obj);
	$("#penel_body #penel_emp_edu input[name=edu_end]").val(obj);
	$("#penel_body #penel_emp_edu input[name=edu_org]").val(obj);
	$("#penel_body #penel_emp_edu input[name=edu_cont]").val(obj);
	$("#penel_body #penel_emp_edu input[name=edu_yn]").val(obj);
	$("#penel_body #penel_emp_edu input[name=edu_ass]").val(obj);
	$("#penel_body #penel_emp_edu input[name=edu_rem]").val(obj);
}
function set_stech(obj){
	$("#penel_body #penel_emp_stech input[name=ste_tech]").val(obj);
	$("#penel_body #penel_emp_stech input[name=ste_skill]").val(obj);
}
function set_qual(obj){
	$("#penel_body #penel_emp_qual input[name=qual_code]").val(obj);
	$("#penel_body #penel_emp_qual input[name=qual_day]").val(obj);
	$("#penel_body #penel_emp_qual input[name=qual_org]").val(obj);
	$("#penel_body #penel_emp_qual input[name=qual_yn]").val(obj);
	$("#penel_body #penel_emp_qual input[name=qual_etc]").val(obj);
}
function set_cont(obj){
	$("#penel_body #penel_emp_cont input[name=cont_price]").val(obj);
	$("#penel_body #penel_emp_cont input[name=cont_start]").val(obj);
	$("#penel_body #penel_emp_cont input[name=cont_end]").val(obj);
	$("#penel_body #penel_emp_cont input[name=cont_type]").val(obj);
}
function set_eqm(obj){
	$("#penel_body #penel_emp_eqm input[name=eqm_name]").val(obj);
	$("#penel_body #penel_emp_eqm input[name=eqm_ser]").val(obj);
	$("#penel_body #penel_emp_eqm input[name=eqm_assign]").val(obj);
	$("#penel_body #penel_emp_eqm input[name=eqm_app]").val(obj);
	$("#penel_body #penel_emp_eqm input[name=eqm_reg]").val(obj);
	$("#penel_body #penel_emp_eqm input[name=eqm_return]").val(obj);
	$("#penel_body #penel_emp_eqm input[name=eqm_get_gbn]").val(obj);
	$("#penel_body #penel_emp_eqm input[name=eqm_price]").val(obj);
	$("#penel_body #penel_emp_eqm input[name=eqm_start]").val(obj);
	$("#penel_body #penel_emp_eqm input[name=eqm_end]").val(obj);
	$("#penel_body #penel_emp_eqm input[name=eqm_etc]").val(obj);
}
function set_skill(obj){
	$("#penel_body #penel_emp_skill input[name=skill_pjt]").val(obj);
	$("#penel_body #penel_emp_skill input[name=skill_cmp]").val(obj);
	$("#penel_body #penel_emp_skill input[name=skill_wrk_cmp]").val(obj);
	$("#penel_body #penel_emp_skill input[name=skill_role]").val(obj);
	$("#penel_body #penel_emp_skill input[name=skill_model]").val(obj);
	$("#penel_body #penel_emp_skill input[name=skill_indu]").val(obj);
	$("#penel_body #penel_emp_skill input[name=skill_appli]").val(obj);
	$("#penel_body #penel_emp_skill input[name=skill_os]").val(obj);
	$("#penel_body #penel_emp_skill input[name=skill_lang]").val(obj);
	$("#penel_body #penel_emp_skill input[name=skill_dbms]").val(obj);
	$("#penel_body #penel_emp_skill input[name=skill_tool]").val(obj);
	$("#penel_body #penel_emp_skill input[name=skill_telec]").val(obj);
	$("#penel_body #penel_emp_skill input[name=skill_start]").val(obj);
	$("#penel_body #penel_emp_skill input[name=skill_end]").val(obj);
	$("#penel_body #penel_emp_skill input[name=skill_etc]").val(obj);
	
}