<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${!empty msg }"><script type="text/javascript">alert('${msg}');</script></c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<title>Insert title here</title>
<style>
	#whole{
		border: 1px solid black; width: 1300px;	height: 1200px;
	}
	.sec{
		display: inline-block;	width: 380px; height: 600px;
	}
	.sec div{
		width: 380px; height: 100px;	text-align: left;
		display: table; margin: 10px auto;  
	}
	.sec .title{
		font-size: 30px; display: table-cell; vertical-align: middle;
		padding-left: 30px; background-color: #0B3B2E; color: white;
	}
	.center{
		text-align: right; margin-right: 20px;
	}
 	.title ~ div{
		background-color: #81F7BE;
	}
	.title ~ div p{
		font-weight: bold; font-size: 1.3em; margin-left: 1em; margin-bottom: 8px;
		margin-top: 21px;
	}
	.title ~ div span{
		color:gray; margin-left: 1.3em; font-weight: bold;
	}
	.title ~ div button{
		margin-left: 15px;
	}
	#tt{
		display: inline; padding-top: 40px;
	}
	h1{
		display: inline; 
		color: #0B3B2E;
	}
	h1 span{
	} 
	#btn{
		float: right; width: 200px; background-color: #01A9DB; height: 44px;
		margin: 40px auto; margin-right: 22px; font-size: 17px; font-weight:bold;
		text-align: center; display: table;
	}
	#btn:hover{
		background-color: black;
	}
	#btn span{
		vertical-align: middle; display: table-cell; color: white;
		cursor: pointer;
	}
</style>
</head>
<body>
<div id="whole">
	<div style="height: 135px;" id="nav">
	<div id="btn"><span>새로운 TODO등록</span></div>
	</div>
	<div class="center">
	 <div id="todo" class="sec">
	  <div class="title">
	  	<span>TODO</span>
	  </div>
	  <c:forEach var="vo" items="${map.TODO }">
	  <div>
	  	<p>${vo.title }</p>
		<span>등록날짜:<fmt:formatDate value="${vo.regdate }" pattern="yyyy.MM.dd."/> ${vo.name }, 우선순위${vo.sequence }</span>
		<button type="button" value="${vo.id }">></button>
	  </div>
	  </c:forEach>
	 </div>
	 
	 <div id="doing" class="sec">
	  <div class="title">
	  	<span>DOING</span>
	  </div>
	  <c:forEach var="vo" items="${map.DOING }">
	  <div>
	  	<p>${vo.title }</p>
		<span>등록날짜:<fmt:formatDate value="${vo.regdate }" pattern="yyyy.MM.dd."/> ${vo.name }, 우선순위${vo.sequence }</span>
		<button type="button" value="${vo.id }">></button>
	  </div>
	  </c:forEach>
	 </div>
	 
	 <div id="done" class="sec">
	  <div class="title">
	  	<span>DONE</span>
	  </div>
	 <c:forEach var="vo" items="${map.DONE }">
	  <div>
	  	<p>${vo.title }</p>
		<span>등록날짜:<fmt:formatDate value="${vo.regdate }" pattern="yyyy.MM.dd."/> ${vo.name }, 우선순위${vo.sequence }</span>
	  </div>
	  </c:forEach>
	 </div>
	</div>
</div>	
</body>
<script type="text/javascript">
	$('#btn').on({
		click: function() {
			location.href="enrollment";
		}
	});
	$('button').click(function() {
		var id = $(this).prop('value');
		$.ajax({
			url : "update",
			dataType : "json",
			data : {'id' : id},
			success : function(data) {
				if(data.code == 'success'){
					location.href="getList";
				}else{
					alert('실패');
				}
			}
		})
	});
</script>
</html>