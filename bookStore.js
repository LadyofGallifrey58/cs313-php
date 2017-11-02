$(".browse").click(function(){
	$("#choice").val($(this).val());
	$("#choice").html($(this).html());
    });

/* attempted, didn’t work
   used onfocusout in the newUserEmail id input */
function loadDoc(file, cFunction, str) {
   var xhttp;
   if (window.XMLHttpRequest) {
      xhttp = new XMLHttpRequest();
   }
   else {
      xhttp = new ActiveXObject("Microsoft.XMLHTTP");
   }
   xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
         cFunction(this);
      }
   };
   xhttp.open("POST", file, true);
   xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
   xhttp.send(str);
}

function checkEmail(xhttp){
   document.getElementById("nUEmailInvalid").innerHTML = xhttp.responseText;
} /**/