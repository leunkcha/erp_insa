<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
<title>Insert title here</title>


<script src="<c:url value='/resources/kr/co/softbowl/js/Library/json-minified.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/kr/co/softbowl/js/Library/jquery-1.7.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/kr/co/softbowl/js/Library/json2.js'/>" type="text/javascript"></script>

<script src="<c:url value='/resources/kr/co/softbowl/SBGrid.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/kr/co/softbowl/DATA_JSON_POI_100.js'/>" type="text/javascript"></script>
<style>
table td{
border:1px solid black;
}
table td div{
  display: table-cell;
}
#tb_search1 div{
	border:1px solid black;
	display:table-cell;
}
#tb_search2 div{
	border:1px solid black;
	display:table-cell;
}
</style>
<link href="<c:url value='/resources/kr/co/softbowl/css/Sbgrid_default.css'/>" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" href="<c:url value='/resources/css/MainTop.css'/>">
<script type="text/javascript">			
SBGrid.DEF.DOMAIN = "<c:url value='/resources/'/>";
var datagrid1;
var grid_data = [];
var combo_sex = [{"label":"미정","value":"0"},
                 {"label":"남","value":"1"},
                 {"label":"여","value":"2"}];
var combo_insa_class = [
						{"label":"--","value":"0"},
						{"label":"초하","value":"1"},
						{"label":"초중","value":"2"},
						{"label":"초상","value":"3"}
                       ];
var combo_insa_join_gbn = [
						{"label":"정규직","value":"1"},
						{"label":"계약직","value":"2"},
						{"label":"기타","value":"3"}
                       ];
var combo_insa_put = [
						{"label":"--","value":"0"},
						{"label":"투입","value":"1"},
						{"label":"미투입","value":"2"}
                       ];
var combo_insa_pos_gbn = [
						{"label":"--","value":"0"},
						{"label":"주임","value":"1"},
						{"label":"대리","value":"2"},
						{"label":"과장","value":"3"}
                       ];
                     

function createElements() {
	var style;
	style = "left:1px; top:1px; width:100%; height:480px;";
	var GridInitInfo = {
	                        "strParentId": "sbGridArea",
	                        "strId": "datagrid1",
	                        "strCaption": "번호^이름^성별^연락처^나이^주소^연봉^등급^근무여부^투입여부^직위",
	                        "strColWidth": "114,114,114,114,113,113,113,113",
	                        "strJsonRef": "grid_data",
	                        "strStyle": style,
	                        "strJsonNodeSet":"combo_age",
	                        "strDataHeight": "29",
	                        "strBackColorAlternate": "#f7f7f7",
	                        "strExplorerbar": "scroll"
	};
	
	var SBGridColumnInitInfo = [
{ "id": "col1", "type": "output", "ref": "insano", "style": "text-align:center;" },
{ "id": "col2", "type": "output", "ref": "insa_name", "style": "text-align:center;" },
{ "id": "col3", "type": "combo", "ref": "insa_sex","strJsonNodeSet": "combo_sex", "strLabelRef": "label", "strValueRef": "value", "style": "text-align:center;" },
{ "id": "col4", "type": "output", "ref": "insa_hp", "style": "text-align:center;" },
{ "id": "col5", "type": "output", "ref": "insa_age", "style": "text-align:center;" },
{ "id": "col6", "type": "output", "ref": "insa_adres1", "style": "text-align:center;" },
{ "id": "col7", "type": "output", "ref": "insa_salary", "style": "text-align:right;" },
{ "id": "col8", "type": "combo", "ref": "insa_class","strJsonNodeSet": "combo_insa_class", "strLabelRef": "label", "strValueRef": "value", "style": "text-align:center;" },
{ "id": "col9", "type": "combo", "ref": "insa_join_gbn","strJsonNodeSet": "combo_insa_join_gbn", "strLabelRef": "label", "strValueRef": "value", "style": "text-align:center;" },
{ "id": "col10", "type": "combo", "ref": "insa_put","strJsonNodeSet": "combo_insa_put", "strLabelRef": "label", "strValueRef": "value", "style": "text-align:center;" },
{ "id": "col11", "type": "combo", "ref": "insa_pos_gbn","strJsonNodeSet": "combo_insa_pos_gbn", "strLabelRef": "label", "strValueRef": "value", "style": "text-align:center;" }
	];
	if (SBGrid.getGrid('datagrid1') != null) {
	    datagrid1.destroy();
	    datagrid1 = null;
	}
	datagrid1 = createSBGrid(GridInitInfo, SBGridColumnInitInfo);
	
	datagrid1.setColWidth(4,50 , false);//나이
	datagrid1.setColWidth(5,300 , false);//주소
	
	loadDatabyAjax();
	   
	//datagrid1.vscroll.addEventListener("onscrollmax", "loadDatabyAjax", "", "");
	datagrid1.addEventListener("onclick","eventProcess","","");
	datagrid1.addEventListener("ondblclick","eventProcess","","");
	
}		
function createSBGrid(SBGridInitInfo, SBGridColumnInitInfo) {
	
	var objJSONdata = new Object();
	objJSONdata.objSBGridInitInfo = SBGridInitInfo;
	objJSONdata.arSBGridColumnInitInfo = SBGridColumnInitInfo;
	return SBGrid.DEF.createSBGrid(objJSONdata);
};
function loadDatabyAjax() {
	
	var maxRows = datagrid1.rows;
	var maxCols = datagrid1.cols;
	var param = 'axCols=' + maxCols + '&maxRows=' + maxRows;
	var frm_data = $("#frm_search").serialize();
	$.ajax({
		url:"listajax",
		data:frm_data,
		type:"POST",
		success:function(data){
			
			var obj = eval("(" + data + ")");
				if (grid_data != undefined) {
				    grid_data = obj;
				} else {
				    grid_data = obj;
				    
				}
				datagrid1.rebuild();
				//datagrid1.refresh();
				
		},
		error:function(xhr,statusText,error){
			console.log("status text : " + statusText);
		}
	});
};
function eventProcess( event)
{
	var strMessage = "Row = " +datagrid1.getMouseRow() + " Col = " + datagrid1.getMouseCol();
	var strEvent = "event 발생 위치 : " + strMessage + " event 명 :" +event.name; 
	
	
	//console.log(strEvent +  "\n"  +event.name);
	console.log(datagrid1.getTextMatrix(datagrid1.getMouseRow(),7));
	if(event.name == "ondblclick"){
		var empno = datagrid1.getTextMatrix(datagrid1.getMouseRow(),0);
		location.href="view?empno="+empno;
	}
}
function createEmp(){
	location.href="view";
	datagrid1.setRowFiltering([[datagrid1.getColRef('insa_name'), '5', false]]);
}
function actionFrom(){
	console.log("actionform2");
	grid_data = null;
	
	loadDatabyAjax();
}
	</script>
</head>
<body onload="createElements()" class="sbgrid_body" >
<jsp:include page="../common/top.jsp"/>
<div id="body">
	<div>직원관리</div>
	<form id="frm_search">
	
		<div class="floatLeft">직원 조회</div>
		<div class="floatnone txtalignR"><input type="button" value="초기화"/></div>
		<div id="tb_search1">
			<div>사번</div>
			<div><input type="text" name="insano"/></div>
			<div><input type="button" value="검색"/></div>
			<div>성명</div>
			<div><input type="text" name="insa_name"/></div>
			<div>근무여부</div>
			<div><select name="insa_join_gbn">
				<option value="0"></option>
				<option value="1">정규직</option>
				<option value="2">계약직</option>
				<option value="3">기타</option>
			</select></div>
			<div>투입여부</div>
			<div><select name="insa_put">
				<option value="0"></option>
				<option value="1">투입</option>
				<option value="2">미투입</option>
			</select></div>
		</div>
		<div id="tb_search2">
			<div>직위</div>
			<div><select name="insa_pos_gbn">
				<option value="0"></option>
				<option value="1">주임</option>
				<option value="2">대리</option>
				<option value="3">과장</option>
			</select></div>
			<div>입사일자</div>
			<div><input type="date" name="insa_start"/></div>
			<div>퇴사일자</div>
			<div><input type="date" name="insa_end"/></div>
			<div><input type="button" value="업체명조회"/></div>
			<div><input type="text"/></div>
		</div>
	</form>
	<div class="txtalignR">
		<input type="button" value="조회" onclick="actionFrom()"/>
		<input type="button" value="신규" onclick="createEmp()"/>
		<input type="button" value="삭제"/>
		<input type="button" value="엑셀"/>
	</div>
</div>
<div>직원 리스트</div>
<div class="content_group">
	<div id="sbGridArea"></div>
</div>
    	
</body>
</html>