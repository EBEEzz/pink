<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		$('#cbtn, #lbtn').click(function(){
			$('#detail').css('display', 'none');
		});
		
		$.ajax( {
			url: '/whistle/test/myInfo.pink',
			type: 'post',
			dataType: 'json',
			success: function(arr) {
				$.each(arr, function(idx, data) {
					$('#ibtn').click(function() {
						
						
						$('#detail').css('display', 'block');
					});
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
				<span id="cbtn" class="w3-button w3-display-topright">&times;</span>
	        	<h2 class="w3-center">MY INFO</h2>
			</header>
			<div class="w3-container w3-margin-top">
	      		<div class="w3-col w3-padding w3-margin-top" style="width: 170px;">
	      			<div class="box avtbox overhidden w3-circle w3-margin-bottom">
	      				<img class="avtimg" src="/whistle/resources/img/avatar/img_avatar4.png" id="avtimg">
	      			</div>
	      		</div>
	      		<div class="w3-rest w3-padding" style="position: relative; top: 10px; left: 20px;">
		      		<h5>회원번호 : <span id="mmno"></span></h5>
		      		<h5>이름 : <span id="mname"></span></h5>
		      		<h5>아이디 : <span id="mid"></span></h5>
		      		<h5>메일 : <span id="mmail"></span></h5>
		      		<h5>전화번호 : <span id="mtel"></span></h5>
		      		<h5>가입일 : <span id="mdate"></span></h5>
		      		<h5>성별 : <span id="mgen"></span></h5>
	      		</div>
	      	</div>
		</div>
	</div>
</body>
</html>