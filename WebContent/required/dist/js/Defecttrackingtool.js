/*function ValidateEmail() {
    var email = document.getElementById("UserEmail").value;
    var lblError = document.getElementById("snackEmail");
    lblError.innerHTML = "";
    var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (!expr.test(email)) {
        lblError.innerHTML = "Invalid email address.";
    }
}*/

function validateEmail(){                                                                       
	var a=document.getElementById("UserEmail").value;
    var isEmpty=false;
    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
  if(a.length!=0){
    if(reg.test(a)==false){
    	var x=document.getElementById("snackEmail");
    	x.className="show";
    	setTimeout(function(){
    		x.className=x.className.replace("show","");
    	},3000)
    	isEmpty=true;
    }}
    return isEmpty;
}

function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : evt.keyCode
    return !(charCode > 31 && (charCode < 48 || charCode > 57));
}

function validateContact(){
	var isEmpty=false;
	var a=document.getElementById("tele1").value;
	if(a.length!=0){
	if(a.length<10 || a.length>10){
		var x=document.getElementById("snackContact1");
		x.className="show";
		setTimeout(function(){
			x.className=x.className.replace("show","");},3000)
			isEmpty=true;
	}}
	return isEmpty;
}

function alphaOnly(evt) {
    
    var charCode = (evt.which) ? evt.which : window.event.keyCode;

    if (charCode <= 13 || charCode==32) {
        return true;
    }
    else {
        var keyChar = String.fromCharCode(charCode);
        var re = /^[a-zA-Z]+$/
        return re.test(keyChar);
    }
}