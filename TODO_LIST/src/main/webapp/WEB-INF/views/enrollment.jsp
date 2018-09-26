<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#parent{
		text-align: center;
	}
	#child{
		display: inline-block; border: 1px solid red;
		width: 70%;
		height: 400px;
	}
	.span1{
		position: relative; top:0px; right:96px;
	}
	.span2{
		position: relative; right: 84px;
	}
	.span3{
		position: relative; right: 61px;
	}
	input[name=title]{
		width: 40%; height: 30px;
	}
	input[name=name]{
		width: 20%; height: 30px; margin-right: 142px;
	}
	input[value=이전] {
		margin-left: 50px;
	}
</style>
<meta charset="UTF-8">
<title>할 일 등록</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
<div id="parent">
	<div id="child">
	<form action="insert" method="post" name="frm">
		<h1>할 일 등록</h1>
		<span class="span1">어떤일인가요?</span><br>
		<input type="text" name="title" placeholder="swift 공부하기 (24자까지)" size="24" required="required"/><br><br>
		<span class="span2">누가 할일인가요?</span><br>
		<input type="text" name="name" placeholder="홍길동" required="required" /><br><br>
		<span class="span3">우선순위를 선택하세요</span><br>
		<div style="display: inline-block; width: 290px; text-align: left;">
		<input type="radio" name="sequence" value="1" checked="checked"/>1순위 
		<input type="radio" name="sequence" value="2"/>2순위 
		<input type="radio" name="sequence" value="3"/>3순위
		</div>
		<br><br>
		<input type="button" value="이전">
		<div style="display: inline-block; width: 290px; text-align: right ;">
		<input type="submit" value="제출" />
		<input type="reset" value="내용지우기"/>
		</div>		
	</form>
	</div>
</div>	 
</body>
<script type="text/javascript">
	$('[name="frm"] input:button').click(function() {
		location.href="getList";
	});
</script>
</html>