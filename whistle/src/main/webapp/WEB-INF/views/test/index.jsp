<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/whistle/resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="/whistle/resources/css/base.css">
<script type="text/javascript" src="/whistle/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#obtn').click(function() {
			$(location).attr('href', '/whistle/test/logout.pink');
		});
		$('#lbtn').click(function() {
			$(location).attr('href', '/whistle/test/login.pink');
		});
		$('.cbtn').click(function(){
			$('#detail').css('display', 'none');
		});
		
		$.ajax( {
			url: '/whistle/test/myInfo.pink',
			type: 'post',
			dataType: 'json',
			data: {
				id: '${SID}'
			},
			success: function(data) {
				var mno = data.mno;
				var name = data.name;
				var mail = data.mail;
				var id = data.id;
				var tel = data.tel;
				var gen = ((data.gen == 'M') ? '남자':'여자');
				var sname = data.savename;
				var date = data.sdate;
				
				$('#ibtn').click(function() {
					$('#mmno').html(mno);
					$('#mname').html(name);
					$('#mmail').html(mail);
					$('#mid').html(id);
					$('#mtel').html(tel);
					$('#mgen').html(gen);
					$('.avtimg').attr('src', '/whistle/resources/img/avatar/' + sname);
					$('#mdate').html(date);
					
					$('#detail').css('display', 'block');
				});
			},
			error: function() {
				alert('### 통신 에러 ###');
			}
		});
		
	});
</script>
</head>
<body>
	<div class="w3-content mx650">
	<c:if test="${not empty SID}">
		<h1 class="w3-blue w3-padding w3-center">Hello ${SID}</h1>
		<div class="w3-col m2 w3-button w3-red" id="obtn">logout</div>
		<div class="w3-col m2 w3-button w3-green w3-right" id="ibtn">myInfo</div>
	</c:if>
	<c:if test="${empty SID}">
		<h1 class="w3-blue w3-padding w3-center">Hello JSP!</h1>
		<div class="w3-col m2 w3-button w3-pink" id="lbtn">login</div>
	</c:if>
	</div>
	<div id="detail" class="w3-modal">
		<div class="w3-modal-content w3-animate-top w3-card-4 mx650">
			<header class="w3-container w3-blue">
				<span class="w3-button w3-display-topright w3-hover-red cbtn">&times;</span>
	        	<h2 class="w3-center">MY INFO</h2>
			</header>
			<div class="w3-container w3-margin-top">
	      		<div class="w3-col w3-padding w3-margin-top w3-margin-left" style="width: 170px;">
	      			<div class="box avtbox overhidden w3-circle w3-margin-bottom">
	      				<img class="avtimg" src="/whistle/resources/img/avatar/noimage.jpg" id="avtimg">
	      			</div>
	      		</div>
	      		<div class="w3-rest w3-padding w3-margin-bottom" style="position: relative; top: 5px; left: 20px;">
	      			<div>
		      			<h5 style="display: inline-block; width: 25%; text-align: right;">회원번호 : </h5>
	      				<h5 id="mmno" style="display: inline-block; width: 50%; margin-left: 10px;"></h5>
	      			</div>
	      			<div>
			      		<h5 style="display: inline-block; width: 25%; text-align: right;">이름 : </h5>
	      				<h5 id="mname" style="display: inline-block; width: 50%; margin-left: 10px;"></h5>
	      			</div>
	      			<div>
			      		<h5 style="display: inline-block; width: 25%; text-align: right;">아이디 : </h5>
	      				<h5 id="mid" style="display: inline-block; width: 50%; margin-left: 10px;"></h5>
	      			</div>
	      			<div>
			      		<h5 style="display: inline-block; width: 25%; text-align: right;">메일 : </h5>
	      				<h5 id="mmail" style="display: inline-block; width: 50%; margin-left: 10px;"></h5>
	      			</div>
	      			<div>
			      		<h5 style="display: inline-block; width: 25%; text-align: right;">전화번호 : </h5>
	      				<h5 id="mtel" style="display: inline-block; width: 50%; margin-left: 10px;"></h5>
	      			</div>
	      			<div>
			      		<h5 style="display: inline-block; width: 25%; text-align: right;">가입일 : </h5>
	      				<h5 id="mdate" style="display: inline-block; width: 50%; margin-left: 10px;"></h5>
	      			</div>
	      			<div>
			      		<h5 style="display: inline-block; width: 25%; text-align: right;">성별 : </h5>
	      				<h5 id="mgen" style="display: inline-block; width: 50%; margin-left: 10px;"></h5>
	      			</div>
	      		</div>
	      	</div>
	      	<div class="w3-margin-top">
	      		<button class="w3-half w3-pink w3-hover-orange w3-button w3-card-4 cbtn">cancel</button>
	      		<button class="w3-half w3-blue w3-hover-cyan w3-button w3-card-4" id="ebtn">edit</button>
	      	</div>
		</div>
	</div>
</body>
</html>