<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
	<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
#body{
width:1280px;
margin:0 auto;
}

.displaynone{
display:none;
}

#emp_sub{
  margin: 10 0 0 0;
}
#emp_sub_menu input{
float:left;
}

#emp_sub_cnt{
border:1px solid black;
}
#emp_sub_cnt div{
padding:10px;
}
.emp_sub_list_table{
border: 1px solid gray;
border-top: 2px solid red;
width: 100%;
height: 300px;
    
}
.emp_sub_list_table th{
  border: 1px solid lightgrey;
  background-color: rgb(232, 232, 232);
}
.border_none{
border:0;
}
#cmp_name{
  display: inline-table;
  border: 1px solid black;
  float: right;

}


#sub_penel{
  width: 100%;
  height: 100%;
  position: absolute;
  background-color: rgba(0,0,0,0.7);
}
.sub_penel_back{
  width: 750px;
  height: 410px;
  background-color: rgba(255,255,255,0.9);
  position: relative;
  margin: 150px auto;
}
.fns35center{
  text-align: center;
  font-size: 35px;
  padding: 20px;
}
.penel_table{
width: 90%;
  margin: 0 auto;
  border: 1px solid gray;
  padding:10px;
}
.penel_table th{
  border: 1px solid gray;
border-top:3px solid red;
height:30px;
}
.penel_table td{
text-align:center;
height:30px;
}
#closeSubPenel{
  float: right;
  border: 1px solid black;
  padding: 5px 10px;
  font-size: 25px;
  margin: 10px;
}
#closeSubPenel:hover{
background-color: rgba(100,100,100,0.5);
}
.margin10{
margin:10px;
}
#insaimg{
width:250px;
height:150px;
}
</style>
<link rel="stylesheet" href="<c:url value='/resources/css/MainTop.css'/>">
<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $("#insa_post").val(data.postcode1 + "-" + data.postcode2);
            $("#insa_adres1").val(fullAddr);

            // 커서를 상세주소 필드로 이동한다.
            $("#insa_adres2").focus();
        }
    }).open();
}
function select_pos_gbn(input){
	console.log(input);
}
function insa_resum_open(){
	$("#insa_resum_file").trigger("click");
	$("#insa_resum").val("파일 수정 중");
}
function insa_img_open(){
	$("#insa_img").trigger("click");
}
function emp_sub_cnt_open(grup){
	$("#"+$("#emp_sub_cnt_temp").val()).hide();
	$("#penel_"+$("#emp_sub_cnt_temp").val()).hide();
	
	$("#"+grup).show();
	$("#penel_"+grup).show();
	
	$("#emp_sub_cnt_temp").val(grup);
	emp_sub_list_ajax(grup);
}

function emp_sub_list_ajax(grup){
	var urlName = "select" + grup.substring(grup.indexOf("_"),grup.length);
	var tableName = "insa" + grup.substring(grup.indexOf("_"),grup.length);
	var insano = $("#insano").val(); 
	
	$.ajax({
		url:urlName,
		data:{"insano":insano},
		type:"POST",
		success:function(data){
			
			var obj = eval("(" + data + ")");
			var cnt = 0;
			$("#"+grup).find("tbody tr").remove();
			if(obj.length == 0){
				$("#"+grup).find("tbody").
				append('<tr><td colspan="100%" class="txtalign">검색된 데이터가 없습니다.를 검색된 데이터가 없을때 넣는다.</td></tr>');
				
			}else{
				var i = 0;
				switch(grup){
				case "emp_input":
					for(i; i < obj.length ; i++){
						select_input(grup,obj[i]);
					}
					break;
				case "emp_acad":
					for(i; i < obj.length ; i++){
						select_acad(grup,obj[i]);
					}
					break;
				case "emp_carrier":
					for(i; i < obj.length ; i++){
						select_carrier(grup,obj[i]);
					}
					break;
				case "emp_edu":
					for(i; i < obj.length ; i++){
						select_edu(grup,obj[i]);
					}
					break;
				case "emp_stech":
					for(i; i < obj.length ; i++){
						select_stech(grup,obj[i]);
					}
					break;
				case "emp_qual":
					for(i; i < obj.length ; i++){
						select_qual(grup,obj[i]);
					}
					break;
				case "emp_cont":
					for(i; i < obj.length ; i++){
						select_cont(grup,obj[i]);
					}
					break;
				case "emp_eqm":
					for(i; i < obj.length ; i++){
						select_eqm(grup,obj[i]);
					}
					break;
				case "emp_skill":
					for(i; i < obj.length ; i++){
						select_skill(grup,obj[i]);
					}
					break;
				}
				$("#"+grup+" tbody tr").each(function(i){
					this.style.backgroundColor =(i%2)?'rgb(255, 230, 245)':'rgb(244, 244, 244)';
				});
				if(i<12){
					for(i; i < 12 ; i++){
						$("#"+grup).find("tbody").append("<tr><td></td></tr>");
					}		
				}
				
				
			}
		},
		error:function(xhr,statusText,error){
			console.log("status text : " + statusText);
		}
	});
}

function select_acad(grup ,obj){
	$("#"+grup).find("tbody").append($("<tr>")
		.append("<td class='txtalignR'>"+obj.acanum+"</td>")
		.append("<td>"+obj.aca_major+"</td>")
		.append("<td>"+obj.aca_grat+"</td>")
		.append("<td class='txtalignR'>"+obj.aca_year+"</td>")
		.append("<td class='txtalignR'>"+obj.aca_month+"</td>")
		.append("<td>"+obj.aca_school+"</td>")
		.append("<td>"+obj.aca_date+"</td>")
		);
	
}
function select_eqm(grup ,obj){
	$("#"+grup).find("tbody").append($("<tr>")
			.append("<td class='txtalignR'>"+obj.eqmno+"</td>")
			.append("<td>"+obj.eqm_name+"</td>")
			.append("<td>"+obj.eqm_ser+"</td>")
			.append("<td>"+obj.eqm_assign+"</td>")
			.append("<td>"+obj.eqm_reg+"</td>")
			.append("<td>"+obj.eqm_return+"</td>")
			.append("<td>"+obj.eqm_app+"</td>")
			.append("<td>"+obj.eqm_get_gbn+"</td>")
			.append("<td class='txtalignR'>"+comma(uncomma(obj.eqm_price))+"</td>")
			.append("<td>"+obj.eqm_start+"</td>")
			.append("<td>"+obj.eqm_end+"</td>")
			.append("<td>"+obj.eqm_etc+"</td>")
			.append("<td>"+obj.eqm_date+"</td>")
			);
}
function select_skill(grup ,obj){
	$("#"+grup).find("tbody").append($("<tr>")
			.append("<td class='txtalignR'>"+obj.skilno+"</td>")
			.append("<td>"+obj.skil_pjt+"</td>")
			.append("<td>"+obj.skil_cmp+"</td>")
			.append("<td>"+obj.skil_wrk_cmp+"</td>")
			.append("<td>"+obj.skil_indu+"</td>")
			.append("<td>"+obj.skil_appli+"</td>")
			.append("<td>"+obj.skil_role+"</td>")
			.append("<td>"+obj.skil_model+"</td>")
			.append("<td>"+obj.skil_os+"</td>")
			.append("<td>"+obj.skil_lang+"</td>")
			.append("<td>"+obj.skil_dbms+"</td>")
			.append("<td>"+obj.skil_tool+"</td>")
			.append("<td>"+obj.skil_telec+"</td>")
			.append("<td>"+obj.skil_etc+"</td>")
			.append("<td>"+obj.skil_start+"</td>")
			.append("<td>"+obj.skil_end+"</td>")
			.append("<td>"+obj.skil_date+"</td>")
			);
}
function select_cont(grup ,obj){
	$("#"+grup).find("tbody").append($("<tr>")
			.append("<td class='txtalignR'>"+comma(uncomma(obj.contno))+"</td>")
			.append("<td class='txtalignR'>"+comma(uncomma(obj.cont_price))+"</td>")
			.append("<td>"+obj.cont_start+"</td>")
			.append("<td>"+obj.cont_end+"</td>")
			.append("<td>"+obj.cont_type+"</td>")
			.append("<td>"+obj.cont_date+"</td>")
			);
}
function select_qual(grup ,obj){
	$("#"+grup).find("tbody").append($("<tr>")
			.append("<td class='txtalignR'>"+obj.qualno+"</td>")
			.append("<td>"+obj.qual_code+"</td>")
			.append("<td>"+obj.qual_day+"</td>")
			.append("<td>"+obj.qual_org+"</td>")
			.append("<td>"+obj.qual_yn+"</td>")
			.append("<td>"+obj.qual_etc+"</td>")
			.append("<td>"+obj.qual_date+"</td>")
			);
}
function select_stech(grup ,obj){
	$("#"+grup).find("tbody").append($("<tr>")
			.append("<td class='txtalignR'>"+obj.stechnum+"</td>")
			.append("<td>"+obj.ste_tech+"</td>")
			.append("<td>"+obj.ste_skill+"</td>")
			.append("<td>"+obj.ste_date+"</td>")
			);
	
}
function select_edu(grup ,obj){
	$("#"+grup).find("tbody").append($("<tr>")
			.append("<td class='txtalignR'>"+obj.eduno+"</td>")
			.append("<td>"+obj.edu_start+"</td>")
			.append("<td>"+obj.edu_end+"</td>")
			.append("<td>"+obj.edu_org+"</td>")
			.append("<td>"+obj.edu_cont+"</td>")
			.append("<td>"+obj.edu_yn+"</td>")
			.append("<td>"+obj.edu_ass+"</td>")
			.append("<td>"+obj.edu_rem+"</td>")
			.append("<td>"+obj.edu_date+"</td>")
			);
}
function select_carrier(grup ,obj){
	$("#"+grup).find("tbody").append($("<tr>")
			.append("<td class='txtalignR'>"+obj.carnum+"</td>")
			.append("<td>"+obj.car_cmp_name+"</td>")
			.append("<td>"+obj.car_wrk_start+"</td>")
			.append("<td>"+obj.car_wrk_end+"</td>")
			.append("<td>"+obj.car_pos_gbn+"</td>")
			.append("<td>"+obj.car_respon+"</td>")
			.append("<td>"+obj.car_work+"</td>")
			.append("<td>"+obj.car_date+"</td>")
			);
}
function select_input(grup ,obj){
	$("#"+grup).find("tbody").append($("<tr>")
			.append("<td class='txtalignR'>"+obj.inputno+"</td>")
			.append("<td>"+obj.input_posb+"</td>")
			.append("<td class='txtalignR'>"+comma(uncomma(obj.input_price))+"</td>")
			.append("<td>"+obj.input_pjt+"</td>")
			.append("<td>"+obj.input_eqm_yn+"</td>")
			.append("<td class='txtalignR'>"+comma(uncomma(obj.input_salary))+"</td>")
			.append("<td>"+obj.input_sido+"</td>")
			.append("<td>"+obj.input_date+"</td>")
			);
}

function changeReg(obj){
	if(event.keyCode < 48 || event.keyCode > 57){
		event.returnValue=false;
	}else{
		if($(obj).val().length==6){
			$(obj).val($(obj).val() + "-");
		}
		event.returnValue=true;
	}
}
function checkinputNum(obj){
	if(event.keyCode < 48 || event.keyCode > 57){
		event.returnValue=false;
	}else{
		event.returnValue=true;
		console.log("d");
	}
}
function changinputNum(obj){
	obj.value = uncomma(obj.value);
	obj.value = comma(obj.value);
}

function create_sub_penel(){
	clean_penel();
	$("#sub_penel").show();
}
function open_insert_emp(){
	location.href="view";
}
function move_list(){
	location.href="list";
}
function returnTempleteDown(id){
	location.href="templeteFileDownload?fileName="+id;
	/* $.ajax({
		url:"templeteFileDownload",
		data:{"fileName":id},
	}); */
}
$(function($){
	$("#insa_pos_gbn option:eq("+$("#input_pos_gbn").val()+")").attr("selected","selected");
	$("#insa_dept option:eq("+$("#input_dept").val()+")").attr("selected","selected");
	$("#insa_join_gbn option:eq("+$("#input_join_gbn").val()+")").attr("selected","selected");
	$("#insa_class option:eq("+$("#input_class").val()+")").attr("selected","selected");
	$("#insa_put option:eq("+$("#input_put").val()+")").attr("selected","selected");
	$("#insa_armyn option:eq("+$("#input_armyn").val()+")").attr("selected","selected");
	$("#insa_army_type option:eq("+$("#input_army_type").val()+")").attr("selected","selected");
	$("#insa_army_lev option:eq("+$("#input_army_lev").val()+")").attr("selected","selected");
	$("#insa_kosa option:eq("+$("#input_kosa").val()+")").attr("selected","selected");
	$("#insa_kosa_class option:eq("+$("#input_kosa_class").val()+")").attr("selected","selected");
	$("#insa_sex option:eq("+$("#input_sex").val()+")").attr("selected","selected");
	$("#sub_penel").hide();
	
	$("#emp_sub_cnt div[id^=emp_]").each(function(index){
		$(this).hide();
	});
	$("#penel_body div[id^=penel_emp_]").each(function(index){
		$(this).hide();
	});
	
	
	
	
	$("#closeSubPenel").on("click",function(){
		$("#sub_penel").hide();
	});
	
	if($("#emptype").val() == "insert"){
		$("#emp_sub").hide();
	}else{
		emp_sub_cnt_open('emp_input');	
	}
	
	
});
function comma(str) {
    /* str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); */
	var inputString = new String;  
	var outputString = new String;  
	var counter = 0;  
	var decimalPoint = 0;  
	var end = 0;  
	var modval = 0;  
	
	inputString = str.toString();  
	outputString = '';  
	
		
	decimalPoint = inputString.indexOf('.', 1);  
	
	
	
	
	if(decimalPoint == -1) {  
		end = inputString.length - (inputString.charAt(0)=='0' ? 1:0);
		
		for (counter=1;counter <=inputString.length; counter++)  
		{  
			var modval =counter - Math.floor(counter/3)*3;  
			outputString = (modval==0 && counter <end ? ',' : '') + inputString.charAt(inputString.length - counter) + outputString;
			
		}  
	} else {
		end = decimalPoint - ( inputString.charAt(0)=='-' ? 1 :0);  
		for (counter=1; counter <= decimalPoint ; counter++)  
		{  
		outputString = (counter==0  && counter <end ? ',' : '') +  inputString.charAt(decimalPoint - counter) + outputString;  
		}  
		for (counter=decimalPoint; counter < decimalPoint+3; counter++)  
		{  
		outputString += inputString.charAt(counter);  
		}  
	}  
	return (outputString);
}

function uncomma(str) {
	var inputString = new String;  
	var outputString = new String;  
	var outputNumber = new Number;  
	var counter = 0;  
	if (str == '')  
	{  
		return 0;  
	}  
	inputString=str;  
	outputString='';  
	for (counter=0;counter <inputString.length; counter++)  
	{  
		outputString += (inputString.charAt(counter) != ',' ?inputString.charAt(counter) : '');  
	}  
	outputNumber = parseFloat(outputString);  
	return (outputNumber);  
}

</script>
<script src="<c:url value='/resources/js/view_penel_emp_input.js'/>"></script>
<script src="<c:url value='/resources/js/currencycomma.js'/>"></script>
</head>
<body>

<fmt:setLocale value="ko" scope="session"/>
<fmt:parseDate value="${emp.insa_army_start}" pattern="yyyyMMdd" var="input_army_start_temp" />
<fmt:formatDate value="${input_army_start_temp}" pattern="yyyy-MM-dd" var="input_army_start"/>
<fmt:parseDate value="${emp.insa_army_end}" pattern="yyyyMMdd" var="input_army_end_temp" />
<fmt:formatDate value="${input_army_end_temp}" pattern="yyyy-MM-dd" var="input_army_end"/>

<fmt:parseDate value="${emp.insa_start}" pattern="yyyyMMdd" var="input_start_temp" />
<fmt:formatDate value="${input_start_temp}" pattern="yyyy-MM-dd" var="input_start"/>
<fmt:parseDate value="${emp.insa_end}" pattern="yyyyMMdd" var="input_end_temp" />
<fmt:formatDate value="${input_end_temp}" pattern="yyyy-MM-dd" var="input_end"/>


<div id="sub_penel">
	
	<div id="penel_body" class="sub_penel_back">
		<div id="closeSubPenel">X</div>
		<div id="penel_emp_input">
			<form id="frm_emp_input" name="frm_emp_input" method="POST" action="#">
			<div class="fns35center">투입가능정보</div>
				<table class="penel_table">
					<thead><tr>
						<th>근무가능일</th>
						<th>월 제시금액(단위:만원)</th>
						<th>PJ형태구분코드</th>
						<th>장비유무</th>
					</tr></thead>
					<tbody><Tr>
						<td>
							<input type="date" name="input_posb" value=""/>
						</td>
						<td>
							<input type="text" name="input_price" value=""/>
						</td>
						<td>
							<input type="text" name="input_pjt" value=""/>
						</td>
						<td>
							<select name="input_eqm_yn">
								<option value="0"></option>
								<option value="1">유</option>
								<option value="2">무</option>
							</select>
						</td>
					</Tr></tbody>
					<thead><tr>
						<th>현재연봉(단위:만원)</th>
						<th colspan="3">근무지</th>
					</tr></thead>
					<tbody><tr>
						<td>
							<input type="text" name="input_salary" value=""/>
						</td>
						<td colspan="3">
							<input type="text" name="input_sigun" value=""/>
						</td>
					</tr></tbody>
				</table>
			<div class="txtalign margin10">
				<input type="button" value="저장"/>
			</div>
			</form>
		</div>
		<div id="penel_emp_acad">
			<form id="frm_emp_acad" name="frm_emp_acad" method="POST" action="#">
			<div class="fns35center">학력사항</div>
				<table class="penel_table">
					<thead><tr>
						<th>전공구분</th>
						<th>졸업구분코드</th>
						<th>졸업년도</th>
						<th>졸업월</th>
						<th>학교명</th>
					</tr></thead>
					<tbody><Tr>
						<td>
							<input type="text" name="aca_major"/>
						</td>
						<td>
							<input type="text" name="aca_grat"/>
						</td>
						<td>
							<select name="aca_year">
								<option value="0"></option>
								<c:forEach var="forYear" begin="0" end="${2015-1980 }" step="1" varStatus="status">
									<option value="${status.count}">${2015-forYear}</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<select name="aca_month">
								<option value="0"></option>
								<c:forEach var="forMonth" begin="1" end="12" step="1" varStatus="status">
									<option value="${status.count}">${forMonth}</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<input type="text" name="aca_school"/>
						</td>
					</Tr></tbody>
				</table>
			<div class="txtalign margin10">
				<input type="button" value="저장"/>
			</div>
			</form>
		</div>
		<div id="penel_emp_carrier">
			<form id="frm_emp_carrier" name="frm_emp_carrier" method="POST" action="#">
			<div class="fns35center">경력사항</div>
				<table class="penel_table">
					<thead><tr>
						<th>회사명</th>
						<th>근무시작일</th>
						<th>근무종료일</th>
						<th>직위구분</th>
					</tr></thead>
					<tbody><Tr>
						<td>
							<input type="text" name="car_cmp_name"/>
						</td>
						<td>
							<input type="date" name="car_wrk_start"/>
						</td>
						<td>
							<input type="date" name="car_wrk_end"/>
						</td>
						<td>
							<select name="car_pos_gbn">
								<option value="0"></option>
								<option value="1"></option>
								<option value="2"></option>
							</select>
						</td>
					</Tr></tbody>
					<thead><tr>
						<th colspan="2">담당업무</th>
						<th colspan="2">근무내용</th>
					</tr></thead>
					<tbody><Tr>
						<td colspan="2">
							<input type="text" name="car_respon"/>
						</td>
						<td colspan="2">
							<input type="text" name="car_work"/>
						</td>
						
					</Tr></tbody>
				</table>
			<div class="txtalign margin10">
				<input type="button" value="저장"/>
			</div>
			</form>
		</div>
		<div id="penel_emp_edu">
			<form id="frm_emp_edu" name="frm_emp_edu" method="POST" action="#">
			<div class="fns35center">교육사항</div>
				<table class="penel_table">
					<thead><tr>
						<th>교육명</th>
						<th>교육시작일</th>
						<th>교육종료일</th>
						<th>교육기관</th>
					</tr></thead>
					<tbody><Tr>
						<td>
							<input type="text" name="edu_name"/>
						</td>
						<td>
							<input type="date" name="edu_start"/>
						</td>
						<td>
							<input type="date" name="edu_end"/>
						</td>
						<td>
							<input type="text" name="edu_org"/>
						</td>
					</Tr></tbody>
					<thead><tr>	
						<th>교육내용</th>
						<th>수료여부</th>
						<th>교육이수시간</th>
						<th>교육잔여시간</th>
					</tr></thead>
					<tbody><Tr>
						<td>
							<input type="text" name="edu_cont"/>
						</td>
						<td>
							<input type="date" name="edu_yn"/>
						</td>
						<td>
							<input type="text" name="edu_ass"/>
						</td>
						<td>
							<input type="text" name="edu_rem"/>
						</td>
					</Tr></tbody>
				</table>
			<div class="txtalign margin10">
				<input type="button" value="저장"/>
			</div>
			</form>
		</div>
		<div id="penel_emp_stech">
			<form id="frm_emp_stech" name="frm_emp_stech" method="POST" action="#">
			<div class="fns35center">보유기술</div>
				<table class="penel_table">
					<thead><tr>
						<th>보유기술코드</th>
						<th>숙련도</th>
					</tr></thead>
					<tbody><Tr>
						<td>
							<input type="text" name="ste_tech"/>
						</td>
						<td>
							<input type="text" name="ste_skill"/>
						</td>
					</Tr></tbody>
				</table>
			<div class="txtalign margin10">
				<input type="button" value="저장"/>
			</div>
			</form>
		</div>
		<div id="penel_emp_qual">
			<form id="frm_emp_qual" name="frm_emp_qual" method="POST" action="#">
			<div class="fns35center">자격사항</div>
				<table class="penel_table">
					<thead><tr>
						<th>자격증코드</th>
						<th>취득일자</th>
						<th>자격기관</th>
						<th>자격여부</th>
					</tr></thead>
					<tbody><Tr>
						<td>
							<input type="text" name="qual_code"/>
						</td>
						<td>
							<input type="date" name="qual_day"/>
						</td>
						<td>
							<input type="text" name="qual_org"/>
						</td>
						<td>
							<select name="qual_yn">
								<option value="0"></option>
								<option value="1"></option>
								<option value="2"></option>
							</select>
						</td>
					</Tr></tbody>
					<thead><tr>
						<th colspan="4">비고</th>
					</tr></thead>
					<tbody><tr>
						<td colspan="4">
							<input type="text" name="qual_etc"/>
						</td>
					</tr></tbody>
				</table>
			<div class="txtalign margin10">
				<input type="button" value="저장"/>
			</div>
			</form>
		</div>
		<div id="penel_emp_cont">
			<form id="frm_emp_cont" name="frm_emp_cont" method="POST" action="#">
			<div class="fns35center">계약정보</div>
				<table class="penel_table">
					<thead><tr>
						<th>계약금액</th>
						<th>계약시작일</th>
						<th>계약종료일</th>
						<th>계약형태</th>
					</tr></thead>
					<tbody><Tr>
						<td>
							<input type="text" name="cont_price"/>
						</td>
						<td>
							<input type="date" name="cont_start"/>
						</td>
						<td>
							<input type="date" name="cont_end"/>
						</td>
						<td>
							<select name="cont_type">
								<option value="0"></option>
								<option value="1"></option>
								<option value="2"></option>
							</select>
						</td>
					</Tr></tbody>
				</table>
			<div class="txtalign margin10">
				<input type="button" value="저장"/>
			</div>
			</form>
		</div>
		<div id="penel_emp_eqm">
			<form id="frm_emp_eqm" name="frm_emp_eqm" method="POST" action="#">
			<div class="fns35center">장비정보</div>
				<table class="penel_table">
					<thead><tr>
						<th>장비명</th>
						<th>장비시리얼넘버</th>
						<th>접수일자</th>
						<th>대여승인여부</th>
					</tr></thead>
					<tbody><Tr>
						<td>
							<input type="text" name="eqm_name"/>
						</td>
						<td>
							<input type="text" name="eqm_ser"/>
						</td>
						<td>
							<input type="date" name="eqm_assign"/>
						</td>
						<td>
							<input type="date" name="eqm_app"/>
						</td>
					</Tr></tbody>
					<thead><tr>
						<th>장비신청일자</th>
						<th>장비반환일자</th>
						<th>취득구분코드</th>
						<th>구입/렌탈비용</th>
					</tr></thead>
					<tbody><tr>
						<td>
							<input type="text" name="eqm_reg"/>
						</td>
						<td>
							<input type="text" name="eqm_return"/>
						</td>
						<td>
							<input type="text" name="eqm_get_gbn"/>
						</td>
						<td>
							<input type="date" name="eqm_price"/>
						</td>
					</tr></tbody>
					<thead><tr>
						<th>구입/렌탈시작일</th>
						<th>폐기/렌탈종료일</th>
						<th colspan="2">비고</th>
					</tr></thead>
					<tbody><tr>
						<td>
							<input type="date" name="eqm_start"/>
						</td>
						<td>
							<input type="date" name="eqm_end"/>
						</td>
						<td colspan="2">
							<input type="text" name="eqm_etc"/>
						</td>
					</tr></tbody>
				</table>
			<div class="txtalign margin10">
				<input type="button" value="저장"/>
			</div>
			</form>
		</div>
		<div id="penel_emp_skill">
			<form id="frm_emp_skill" name="frm_emp_skill" method="POST" action="#">
			<div class="fns35center">Skill Inventory</div>
				<table class="penel_table">
					<thead><tr>
						<th>프로젝트명</th>
						<th>고객사</th>
						<th>근무회사</th>
						<th>역할</th>
					</tr></thead>
					<tbody><Tr>
						<td>
							<input type="text" name="skill_pjt"/>
						</td>
						<td>
							<input type="text" name="skill_cmp"/>
						</td>
						<td>
							<input type="text" name="skill_wrk_cmp"/>
						</td>
						<td>
							<input type="text" name="skill_role"/>
						</td>
					</Tr></tbody>
					<thead><tr>
						<th>기종</th>
						<th>개발분여산업여부</th>
						<th>개발분야응용여부</th>
						<th>OS</th>
					</tr></thead>
					<tbody><tr>
						<td>
							<input type="text" name="skill_model"/>
						</td>
						<td>
							<input type="text" name="skill_indu"/>
						</td>
						<td>
							<input type="text" name="skill_appli"/>
						</td>
						<td>
							<input type="text" name="skill_os"/>
						</td>
					</tr></tbody>
					<thead><tr>
						<th>언어</th>
						<th>DBMS</th>
						<th>TOOL</th>
						<th>통신</th>
					</tr></thead>
					<tbody><tr>
						<td>
							<input type="text" name="skill_lang"/>
						</td>
						<td>
							<input type="text" name="skill_dbms"/>
						</td>
						<td>
							<input type="text" name="skill_tool"/>
						</td>
						<td>
							<input type="text" name="skill_telec"/>
						</td>
					</tr></tbody>
					<thead><tr>
						<th>시작년월</th>
						<th>종료년월</th>
						<th colspan="2">기타</th>
					</tr></thead>
					<tbody><tr>
						<td>
							<input type="text" name="skill_start"/>
						</td>
						<td>
							<input type="text" name="skill_end"/>
						</td>
						<td>
							<input type="text" name="skill_etc"/>
						</td>
					</tr></tbody>
				</table>
			<div class="txtalign margin10">
				<input type="button" value="저장"/>
			</div>
			</form>
		</div>
		
	</div>
</div>



<jsp:include page="../common/top.jsp"/>
<div id="body">
	<form action="save" enctype="multipart/form-data"  method="post">
	<input type="hidden" id="emptype" name="emptype" value="${emptype }" />
	<div class="fns35center">
		직원상세정보
	</div>
	
	<div class="floatLeft">
		<label><input type="radio" name="JOIN_GBN" value="1"/>정규직</label>
		<label><input type="radio" name="JOIN_GBN" value="2"/>계약직</label>
		<label><input type="radio" name="JOIN_GBN" value="3"/>기타</label>
	</div>
	<div class="floatRight">
		<input type="file" name="insa_resum_file" id="insa_resum_file" class="displaynone"/>
		<input type="text" id="insa_resum" name="txt_INSA_RESUM" value="${emp.insa_resum }" readonly/>
		<input type="button" name="btn_INSA_RESUM" value="이력서등록" onclick="insa_resum_open()" />
		<input type="button" name="" value="미리보기" onclick="returnTempleteDown('${emp.insa_resum}')"/>
		<input type="submit" name="" value="저장"/>
		<input type="button" value="목록으로" onclick="move_list()"/>
		<input type="button" value="신규" onclick="open_insert_emp()"/>
	</div>
	<div>
		<table border="1" width="100%">
		    <tr>
		        <td width="402" rowspan="6" colspan="2" class="txtalign">
		        	<i>
		        		<c:if test="${emp.insa_img == null}">
		        			<img id="insaimg" src="http://placehold.it/250x150"/>
		        		</c:if>
		        		<c:if test="${emp.insa_img != null}">
		        			<img id="insaimg" src="<c:url value='/resources/images/${emp.insa_img }'/>"/>
		        		</c:if>
		        				        	
		        	</i>
		        	<div>
		        		<input type="file" class="displaynone" name="insa_img_file" id="insa_img"/>
		        		<input type="button" value="이미지등록" onclick="insa_img_open()"/>
		        	</div>
		        </td>
		        <td width="198">사번</td>
		        <td width="198">
		        	<input type="text" class="border_none txtalignR" id="insano" name="insano" value="${emp.insano }" maxlength="9" readonly/>
		        </td>
		        <td width="198">성명</td>
		        <td width="198">
		        	<input type="text" class="border_none" id="insa_name" name="insa_name" value="${emp.insa_name }" maxlength="20"/>
		        </td>
		        <td width="198">영문성명</td>
		        <td width="198">
		        	<input type="text" class="border_none" id="insa_name_en" name="insa_name_en" value="${emp.insa_name_en }" maxlength="20"/>
		        </td>
		    </tr>
		    <tr>
		        <td width="198">아이디</td>
		        <td width="198">
		        	<c:if test="${emptype eq 'insert'}">
			        	<input type="text" class="border_none" id="insa_id" name="insa_id" value="${emp.insa_id }" maxlength="20"/>
		        	</c:if>
		        	<c:if test="${emptype eq 'update'}">
		        		<input type="text" class="border_none" id="insa_id" name="insa_id" value="${emp.insa_id }" maxlength="20" readonly />
		        	</c:if>
		        </td>
		        <td width="198">패스워드</td>
		        <td width="198">
		        	<input type="text" class="border_none" id="insa_pw" name="insa_pw" value="${emp.insa_pw }" maxlength="20"/>
		        </td>
		        <td width="198">성별</td>
		        <td width="198">
		        	<select name="insa_sex" id="insa_sex">
		                <option value="0"></option>
		                <option value="1">남성</option>
		                <option value="2">여성</option>
					</select>
					<input type="hidden" id="input_sex" value="${emp.insa_sex }"/>
		        </td>
		    </tr>
		    <tr>
		        <td width="198">전화번호</td>
		        <td width="198">
		        	<input type="text" class="border_none" id="insa_phone" name="insa_phone" value="${emp.insa_phone }"
		        	 maxlength="15"/>
		        </td>
		        <td width="198">핸드폰번호</td>
		        <td width="198">
		        	<input type="text" class="border_none" id="insa_hp" name="insa_hp" value="${emp.insa_hp }"
		        	 maxlength="15"/>
		        </td>
		        <td width="198">주민번호</td>
		        <td width="198">
	        		<input type="text" class="border_none" id="insa_regno" name="insa_regno" value="${emp.insa_regno }"
	        		 onkeypress="changeReg(this)" maxlength="14"/>
		        </td>
		    </tr>
		    <tr>
		        <td width="198">연령</td>
		        <td width="198">
		        	<input type="text" class="border_none txtalignR" id="insa_age" name="insa_age" value="${emp.insa_age }" maxlength="20" readonly/>
		        </td>
		        <td width="198">이메일</td>
		        <td width="611" colspan="3">
		        	<input type="text" class="border_none" id="insa_email" name="insa_email" value="${emp.insa_email }" maxlength="20"/>
		        </td>
		    </tr>
		    <tr>
		        <td width="198">주소</td>
		        <td width="1019" colspan="5">
		        	<input type="text" id="insa_post" name="insa_post" value="${emp.insa_post }" readonly/>
		        	<input type="text" id="insa_adres1" name="insa_adres1" value="${emp.insa_adres1 }" readonly/>
		        	<input type="text" id="insa_adres2" name="insa_adres2" value="${emp.insa_adres2 }"/>
		        	<input type="button" onclick="execDaumPostcode()" value="주소검색"/>
		        </td>
		    </tr>
		    <tr>
		        <td width="198">직위</td>
		        <td width="198">
		        	<select name="insa_pos_gbn" id="insa_pos_gbn">
		                <option value="0"></option>
		                <option value="1">주임</option>
		                <option value="2">대리</option>
		                <option value="3">과장</option>
					</select>
					<input type="hidden" id="input_pos_gbn" value="${emp.insa_pos_gbn }"/>
				</td>
		        <td width="198">부서</td>
		        <td width="198">
		        	<select name="insa_dept" id="insa_dept">
		                <option value="0"></option>
		                <option value="1">개발</option>
		                <option value="2">디자인</option>
		                <option value="3">인사</option>
					</select>
					<input type="hidden" id="input_dept" value="${emp.insa_dept}"/>
				</td>
		        <td width="198">연봉(만원)</td>
		        <td width="198">
		        	<input type="text" class="border_none txtalignR" id="insa_salary" name="insa_salary"
		        	 onkeypress="checkinputNum(this)" onkeyup="changinputNum(this)"  
		        	 value='${emp.insa_salary }' />만원
		        </td>
		    </tr>
		    <tr>
		        <td width="198">입사구분</td>
		        <td width="198">
		        	<select name="insa_join_gbn" id="insa_join_gbn">
		                <option value="1">정규직</option>
		                <option value="2">계약직</option>
		                <option value="3">기타</option>
					</select>
					<input type="hidden" id="input_join_gbn" value="${emp.insa_join_gbn-1}"/>
				</td>
		        <td width="198">등급</td>
		        <td width="198">
		        	<select name="insa_class" id="insa_class">
		                <option value="0"></option>
		                <option value="1">초하</option>
		                <option value="2">초중</option>
		                <option value="3">초상</option>
					</select>
					<input type="hidden" id="input_class" value="${emp.insa_class}"/>
				</td>
		        <td width="198">투입여부</td>
		        <td width="198">
		        	<select name="insa_put" id="insa_put">
		                <option value="0"></option>
		                <option value="1">투입</option>
		                <option value="2">미투입</option>
					</select>
					<input type="hidden" id="input_put" value="${emp.insa_put}"/>
				</td>
		        <td width="198">군필여부</td>
		        <td width="198">
		        	<select name="insa_armyn" id="insa_armyn">
		                <option value="0"></option>
		                <option value="1">군필</option>
		                <option value="2">미필</option>
		                <option value="3">면제</option>
					</select>
					<input type="hidden" id="input_armyn" value="${emp.insa_armyn}"/>
				</td>
		    </tr>
		    <tr>
		        <td width="198">군별</td>
		        <td width="198">
		        	<select name="insa_army_type" id="insa_army_type">
		                <option value="0"></option>
		                <option value="1">육군</option>
		                <option value="2">공군</option>
		                <option value="3">해군</option>
					</select>
					<input type="hidden" id="input_army_type" value="${emp.insa_army_type}"/>
				</td>
		        <td width="198">계급</td>
		        <td width="198">
		        	<select name="insa_army_lev" id="insa_army_lev">
		                <option value="0"></option>
		                <option value="1">병장</option>
		                <option value="2">소위</option>
		                <option value="3">중령</option>
					</select>
					<input type="hidden" id="input_army_lev" value="${emp.insa_army_lev}"/>
				</td>
		        <td width="198">입영일자</td>
		        <td width="198">
					<input type="date" name="insa_army_start" value="${input_army_start}"/>
		        </td>
		        <td width="198">전역일자</td>
		        <td width="198">
					<input type="date" name="insa_army_end" value="${input_army_end}"/>
		        </td>
		    </tr>
		    <tr>
		        <td width="198">KOSA등록</td>
		        <td width="198">
		        	<select name="insa_kosa" id="insa_kosa">
		                <option value="0"></option>
		                <option value="1">유</option>
		                <option value="2">무</option>
					</select>
					<input type="hidden" id="input_kosa" value="${emp.insa_kosa}"/>
				</td>
		        <td width="198">KOSA등급</td>
		        <td width="198">
					<select name="insa_kosa_class" id="insa_kosa_class">
						<option value="0"></option>
						<option value="1">초하</option>
						<option value="2">초중</option>
						<option value="3">초상</option>
					</select>			
					<input type="hidden" id="input_kosa_class" value="${emp.insa_kosa_class}"/>
				</td>
		        <td width="198">입사일자</td>
		        <td width="198">
					<input type="date" id="insa_start" name="insa_start" value="${input_start}"/>
		        </td>
		        <td width="198">퇴사일자</td>
		        <td width="198">
					<input type="date" id="insa_end" name="insa_end" value="${input_end}"/>
				</td>
		    </tr>
		    <tr>
		        <td width="198">사업자번호</td>
		        <td width="402" colspan="2">
		        	<input type="text" name="cmpno" value="${emp.cmpno}"/>
		        	<input type="button" value="조회"/>
		        	<div id="cmp_name">업체명</div>
		        </td>
		        <td width="198">
		        	<input type="text" id="" name="" value="" readonly/>
				</td>
		        <td width="198">업체담당자명</td>
		        <td width="198">&nbsp;</td>
		        <td width="406" colspan="2">
		        	<input type="button" value="업체상세정보"/>
		        </td>
		    </tr>
		    <tr>
		        <td width="198">자기소개</td>
		        <td width="606" colspan="3">
		        	${emp.insa_self}
				</td>
		        <td width="198">경력기술서</td>
		        <td width="611" colspan="3">
		        	${emp.insa_carrier}
	        	</td>
		    </tr>
		</table>
	</div>
	</form>
	<div id="emp_sub">
		<div id="emp_sub_menu">
			<input type="button" value="투입가능정보input" onclick="emp_sub_cnt_open('emp_input')"/>
			<input type="button" value="학력사항acad" onclick="emp_sub_cnt_open('emp_acad')"/>
			<input type="button" value="경력사항carr" onclick="emp_sub_cnt_open('emp_carrier')"/>
			<input type="button" value="교육사항edu" onclick="emp_sub_cnt_open('emp_edu')"/>
			<input type="button" value="보유기술stech" onclick="emp_sub_cnt_open('emp_stech')"/>
			<input type="button" value="자격사항qual" onclick="emp_sub_cnt_open('emp_qual')"/>
			<input type="button" value="계약정보cont" onclick="emp_sub_cnt_open('emp_cont')"/>
			<input type="button" value="장비정보eqm" onclick="emp_sub_cnt_open('emp_eqm')"/>
			<input type="button" class="floatnone" value="SKILL INVENTORY" onclick="emp_sub_cnt_open('emp_skill')"/>
			<input type="hidden" id="emp_sub_cnt_temp" value=""/>
		</div>
		<div id="emp_sub_cnt">
			<div class="floatRight">
				<input type="button" value="추가" onclick="create_sub_penel()"/>
				<input type="button" value="삭제"/>
			</div>
			<div id="emp_input">
				<table class="emp_sub_list_table">
					<thead><tr>
						<th>NO</th>
						<th>근무가능일</th>
						<th>월 제시금액(단위:만원)</th>
						<th>PJ형태구분코드</th>
						<th>장비유무</th>
						<th>현재연봉(단위:만원)</th>
						<th>근무지</th>
						<th>등록일</th>
					</tr></thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div id="emp_acad">
				<table class="emp_sub_list_table">
					<thead><tr>
						<th>NO</th>
						<th>전공구분</th>
						<th>졸업구분코드</th>
						<th>졸업년도</th>
						<th>졸업월</th>
						<th>학교명</th>
						<th>등록일</th>
					</tr></thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div id="emp_carrier">
				<table class="emp_sub_list_table">
					<thead><tr>
						<th>NO</th>
						<th>회사명</th>
						<th>근무시작일</th>
						<th>근무종료일</th>
						<th>직위구분</th>
						<th>담당업무</th>
						<th>근무내용</th>
						<th>등록일</th>
					</tr></thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div id="emp_edu">
				<table class="emp_sub_list_table">
					<thead><tr>
						<th>NO</th>
						<th>교육명</th>
						<th>교육시작일</th>
						<th>교육종료일</th>
						<th>교육기관</th>
						<th>교육내용</th>
						<th>수료여부</th>
						<th>교육이수시간</th>
						<th>교육잔여시간</th>
						<th>등록일</th>
					</tr></thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div id="emp_stech">
				<table class="emp_sub_list_table">
					<thead><tr>
						<th>NO</th>
						<th>보유기술코드</th>
						<th>숙련도</th>
						<th>등록일</th>
					</tr></thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div id="emp_qual">
				<table class="emp_sub_list_table">
					<thead><tr>
						<th>NO</th>
						<th>자격증코드</th>
						<th>취득일자</th>
						<th>자격기관</th>
						<th>자격여부</th>
						<th>비고</th>
						<th>등록일</th>
					</tr></thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div id="emp_cont">
				<table class="emp_sub_list_table">
					<thead><tr>
						<th>NO</th>
						<th>계약금액</th>
						<th>계약시작일</th>
						<th>계약종료일</th>
						<th>계약형태</th>
						<th>등록일</th>
					</tr></thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div id="emp_eqm">
				<table class="emp_sub_list_table">
					<thead><tr>
						<th>NO</th>
						<th>장비명</th>
						<th>장비시리얼넘버</th>
						<th>접수일자</th>
						<th>장비신청일자</th>
						<th>장비반환일자</th>
						<th>대여승인여부</th>
						<th>취득구분코드</th>
						<th>구입/렌탈비용</th>
						<th>구입/렌탈시작일</th>
						<th>폐기/렌탈종료일</th>
						<th>비고</th>
						<th>등록일</th>
					</tr></thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div id="emp_skill">
				<table class="emp_sub_list_table">
					<thead><tr>
						<th>NO</th>
						<th>프로젝트명</th>
						<th>고객사</th>
						<th>근무회사</th>
						<th>개발분여산업여부</th>
						<th>개발분야응용여부</th>
						<th>역할</th>
						<th>기종</th>
						<th>OS</th>
						<th>언어</th>
						<th>DBMS</th>
						<th>TOOL</th>
						<th>통신</th>
						<th>기타</th>
						<th>시작년월</th>
						<th>종료년월</th>
						<th>등록일</th>
					</tr></thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>
