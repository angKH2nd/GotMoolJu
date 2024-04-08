function sendSms() {
	$.ajax({
		type: "POST",
		url:"sendSms",
		data:{userPhone:$("#userPhone").val()},
		success:function(result){
			$("#sms-result").text(result);
		}, error: function(){
			$("#sms-result").text("통신실패");
		}
	})
}