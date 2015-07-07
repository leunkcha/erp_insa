function currency(obj){
	if(event.keyCode < 48 || event.keyCode > 57){
		event.returnValue=false;
	}else{
	
		event.returnValue=true;
	}
}

