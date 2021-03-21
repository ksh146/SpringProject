<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<title>이젠 양말가게</title>
	<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
<style>

    body { 
 		margin: 0; 
 		padding: 0; 
 		font-family: '맑은 고딕', verdana; 
 	}
 
 	a { 
		color: #05f; 
		text-decoration: none; 
	}
 
	a:hover { 
		text-decoration: underline; 
	}
 
	h1, h2, h3, h4, h5, h6 { 
 		margin: 0; 
		padding: 0; 
 	}
 
 	ul, lo, li { 
 		margin: 0; 
 		padding: 0; 
		list-style: none; 
 	}

 	div#root { 
 		width: 900px; 
 		margin: 0 auto; 
 	}
 
 	header#header {
  
 	}
 	
 	nav#nav { 
 
 	}
 	
 	section#container { 
 
 	}
 	
  	section#content { 
  		float: right; 
  		width: 700px; 
  	}
  
  	aside#aside { 
  		float: left; 
  		width: 180px; 
  	}
  
  	section#container::after { 
  		content: ""; 
  		display: block; 
  		clear: both; 
  	}
  	 
  	footer#footer { 
  		background: #eee; 
  		padding: 20px; 
  	}
 
   	header#header div#header_box { 
 		text-align: center; 
  		padding: 30px 0; 
  	}
  
 	header#header div#header_box h1 { 
 		font-size: 50px; 
 	}
 
 	header#header div#header_box h1 a { 
 		color: #000; 
 	}
 
 	nav#nav div#nav_box { 
 		font-size: 14px; 
 		padding: 10px; 
 		text-align: right; 
 	}
 
 	nav#nav div#nav_box li { 
 		display: inline-block; 
 		margin: 0 10px; 
 	}
 
 	nav#nav div#nav_box li a { 
 		color: #333; 
 	}	
 
 	section#container { 
 
 	}
 
 	aside#aside h3 { 
 		font-size: 22px; 
 		margin-bottom: 20px; 
 		text-align: center; 
 	}
 
 	aside#aside li { 
 		font-size: 16px; 
 		text-align: center; 
 	}
 
 	aside#aside li a { 
 		color: #000;
 		display: block; 
 		padding: 10px 0; 
 	}
 
 	aside#aside li a:hover { 
 		text-decoration: none; 
 		background: #eee; 
 	}
 	
 	aside#aside li { 
 		position: relative; 
 	}
 	
	aside#aside li:hover { 
		background: #eee; 
	}   

	aside#aside li > ul.low { 
		display: none; 
		position: absolute; 
		top: 0; 
		left: 180px;  
	}

	aside#aside li:hover > ul.low { 
		display: block; 
	}

	aside#aside li:hover > ul.low li a { 
		background: #eee; 
		border: 1px solid #eee; 
	}

	aside#aside li:hover > ul.low li a:hover { 
		background: #fff;
	}

	aside#aside li > ul.low li { 
		width: 180px; 
	}
 
 	footer#footer { 
 		margin-top: 100px; 
 		border-radius: 50px 50px 0 0; 
 	}
 
 	footer#footer div#footer_box {
 		padding: 0 20px; 
 	}
 
</style>	

<style>
	div.socks div.socksImg {
		float: left;
		width: 350px;
	}
	
	div.socks div.socksImg img {
		width: 350px;
		height: auto;
	}
	
	div.socks div.socksInfo {
		float: right;
		width: 330px;
		font-size: 22px;
	}
	
	div.socks div.socksInfo p {
		margin: 0 0 20px 0;
	}
	
	div.socks div.socksInfo p span {
		display: inline-block;
		width: 100px;
		margin-right: 15px;
	}
	
	div.socks div.socksInfo p.cartStock input {
		font-size: 22px;
		width: 50px;
		padding: 5px;
		margin: 0;
		border: 1px solid #eee;
	}
	
	div.socks div.socksInfo p.cartStock button {
		font-size: 26px;
		border: none;
		background: none;
	}
	
	div.socks div.socksInfo p.addToCart {
		text-align: right;
	}
	
	div.socks div.socksInfo p.addToCart button {
		font-size: 22px;
		padding: 5px 10px;
		border: 1px solid #eee;
		background: #eee;
	}
	
	div.socks div.socksDes {
		font-size: 18px;
		clear: both;
		padding-top: 30px;
	}	
</style>

<style>
	section.replyForm {
		padding: 30px 0;
	}
	
	section.replyForm div.input_area {
		margin: 10px 0;
	}
	
	section.replyForm textarea {
		font-size: 16px;
		font-family: '맑은 고딕', verdana;
		padding: 10px;
		width: 500px;
		height: 150px;
	}
	
	section.replyForm button {
		font-size: 20px;
		padding: 5px 10px;
		margin: 10px 0;
		background: #fff;
		border: 1px solid #ccc;
	}
	
	section.replyList {
		padding: 30px 0;
	}
	
	section.replyList ol {
		padding: 0;
		margin: 0;
	}
	
	section.replyList ol li {
		padding: 10px 0;
		border-bottom: 2px solid #eee;
	}
	
	section.replyList div.userInfo {
		
	}
	
	section.replyList div.userInfo .userName {
		font-size: 24px;
		font-weight: bold;
	}
	
	section.replyList div.userInfo .date {
		color: #999;
		display: inline-block;
		margin-left: 10px;
	}
	
	section.replyList div.replyContent {
		padding: 10px;
		margin: 20px 0;
	}
	
	section.replyList div.replyFooter {
		margin-bottom: 10px;
	}
	
	section.replyList div.replyFooter button {
		font-size: 14px;
		border: 1px solid #999;
		background: none;
		margin-right: 10px;
	}
</style>

<style>
	div.replyModal {
		position: relative; 
		z-index: 1;
		display: none;
	}
	
	div.modalBackground {
		position: fixed; 
		top: 0; 
		left: 0; 
		width: 100%; 
		height: 100%;
		background: rgba(0, 0, 0, 0.8);
		z-index: -1;
	}
	
	div.modalContent {
		position: fixed;
		top: 20%;
		left: calc(50% - 250px);
		width: 500px;
		height: 250px;
		padding: 20px 10px;
		background: #fff;
		border: 2px solid #666;
	}
	
	div.modalContent textarea {
		font-size: 16px;
		font-family: '맑은 고딕' verdana;
		padding: 10px;
		width: 500px;
		height: 200px;
	}
	
	div.modalContent button {
		font-size: 20px;
		padding: 5px 10px;
		margin: 10px 0;
		background: #fff;
		border: 1px solid #ccc;
	}
	
	div.modalContent button.modal_cancel {
		margin-left: 20px;
	}
</style>
<script>
	function replyList() {
							
		var socksNum = ${view.socksNum};
		$.getJSON("/shop/view/replyList" + "?n=" + socksNum, function(data) {
			var str = "";
								
			$(data).each(function() {
				console.log(data);
									
				var replyDate = new Date(this.replyDate);
				replyDate = replyDate.toLocaleDateString("ko-US")
									
				str += "<li data-replyNum='" + this.replyNum + "'>" // "<li data-socksNum='" + this.socksNum + "'>"
					+ "<div class='userInfo'>"
					+ "<span class='userName'>" + this.userName + "</span>"
					+ "<span class='date'>" + replyDate + "</span>"
					+ "</div>"
					+ "<div class='replyContent'>" + this.replyCon + "</div>"
					
					+ "<c:if test='${member != null}'>"
					
					+ "<div class='replyFooter'>"
					+ "<button type='button' class='update' data-replyNum='" + this.replyNum + "'>수정</button>"
					+ "<button type='button' class='delete' data-replyNum='" + this.replyNum + "'>삭제</button>"
					+ "</div>"
					
					+ "</c:if>"
					
					+ "</li>";
			});
								
			$("section.replyList ol").html(str);
		});
	}
</script>
</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>

	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../include/nav.jsp" %>
		</div>
	</nav>
	
	<section id="container">
		<div id="container_box">
		
			<section id="content">
				<form role="form" method="post">
					<input type="hidden" name="socksNum" value="${view.socksNum}" />
				</form>
				
				<div class="socks">
					<div class="socksImg">
						<img src="${view.socksImg}">
					</div>
					
					<div class="socksImfo">
						<p class="socksName"><span>상품명 </span>${view.socksName}</p>
						<p class="cateName"><span>카테고리 </span>${view.cateName}</p>
						
						<p class="socksPrice">
							<span>가격 </span><fmt:formatNumber pattern="###,###,###" value="${view.socksPrice}"/>원
						</p>
						
						<p class="socksStock">
							<span>수량 </span><fmt:formatNumber pattern="###,###,###" value="${view.socksStock}"/>개
						</p>
						
						<c:if test="${view.socksStock != 0}">
						
						<p class="cartStock">
							<span>구매 수량 </span>
							<button type="button" class="plus">+</button>
							<input type="number" class="numBox" min="1" max="${view.socksStock}" value="1" readonly="readonly"/>
							<button type="button" class="minus">-</button>
							
							<script>
								$(".plus").click(function() {
									var num = $(".numBox").val();
									var plusNum = Number(num) + 1;
									
									if (plusNum >= ${view.socksStock}) {
										$(".numBox").val(num);
									} else {
										$(".numBox").val(plusNum);
									}
								});
								
								$(".minus").click(function() {
									var num = $(".numBox").val();
									var minusNum = Number(num) - 1;
									
									if (minusNum <= 0) {
										$(".numBox").val(num);
									} else {
										$(".numBox").val(minusNum);
									}
								});
							</script>
						</p>
						
						<p class="addToCart">
							<button type="button" class="addCart_btn">장바구니</button>
							
							<script>
								$(".addCart_btn").click(function() {
									var socksNum = $("#socksNum").val();
									var cartStock = $(".numBox").val();
									
									var data = {
										socksNum : socksNum,
										cartStock : cartStock
									};
									
									$.ajax({
										url : "/shop/view/addCart",
										type : "post",
										data : data,
										success : function(result) {
											
											if (result == 1) {
												alert("장바구니에 담았습니다.");
												$(".numBox").val("1");
											} else {
												alert("회원만 사용 가능합니다.");
												$(".numBox").val("1");
											}
										},
										error : function() {
											alert("장바구니 담기에 실패했습니다.");
										}
									});
								});
							</script>
						</p>
						
						</c:if>
						
						<c:if test="${view.socksStock == 0}">
							<p>수량이 부족합니다.</p>
						</c:if>
					</div>
					
				<div class="socksDes">${view.socksDes}</div>
				</div>
				
				<div id="reply">
				
					<c:if test="${member == null}">
						<p>댓글 작성시<a href="/member/login"> 로그인</a> 하세요</p>
					</c:if>
					
					<c:if test="${member != null}">
					<section class="replyForm">
						<form role="form" method="post" autocomplete="off">
						
							<input type="hidden" name="socksNum" id="socksNum" value="${view.socksNum}">
							
							<div class="input_area">
								<textarea name="replyCon" id="replyCon"></textarea>
							</div>
							
							<div class="input_area">
								<button type="button" id="reply_btn">댓글 작성</button>
								
								<script>
									$("#reply_btn").click(function() {
										var formObj = $(".replyForm form[role='form']");
										var socksNum = $("#socksNum").val();
										var replyCon = $("#replyCon").val();
										
										var data = {
												socksNum : socksNum,
												replyCon : replyCon
										};
										
										$.ajax({
											url : "/shop/view/registReply",
											type : "post",
											data : data,
											success : function() {
												replyList();
												$("#replyCon").val("");
											}
										});
									});
								</script>
							</div>
						</form>
					</section>
					</c:if>
					
					<section class="replyList">
						<ol>
							<%-- <c:forEach items="${reply}" var="reply">
							<li>
								<div class="userInfo">
									<span class="userName">${reply.userName}</span>
									<span class="date"><fmt:formatDate value="${reply.replyDate}" pattern="yyyy-MM-dd"/></span>
								</div>
								<div class="replyContent">${reply.replyCon}</div>
							</li>
							</c:forEach> --%>
						</ol>
						
						<script>
							replyList();
						</script>
						
						<script>
						
							$(document).on("click", ".update", function() {
								// $(".replyModal").attr("style", "display:block;");
								$(".replyModal").fadeIn(200);
								
								var replyNum = $(this).attr("data-replyNum");
								var replyCon = $(this).parent().parent().children(".replyContent").text();
								
								$(".modal_replyCon").val(replyCon);
								$(".modal_update_btn").attr("data-replyNum", replyNum);
							});
												
							$(document).on("click", ".delete", function() {
								var deleteConfirm = confirm("삭제해도 되겠습니까?");
								
								if(deleteConfirm) {
								
									var data = {
										replyNum : $(this).attr("data-replyNum")
									};
								
									$.ajax({
										url : "/shop/view/deleteReply",
										type : "post",
										data : data,
										success : function(result) {
											if (result == 1) {
												replyList();
											} else {
												alert("작성자만 할 수 있습니다.")
											}
										},
										error : function() {
											alert("로그인 하세요.")
										}
									});
								}
							});
							
						</script>
						
					</section>
				</div>
				
			</section>
			
			<aside id="aside">
				<%@ include file="../include/aside.jsp" %>
			</aside>
			
		</div>
	</section>
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>		
	</footer>

</div>

<div class="replyModal">

	<div class="modalContent">
		<div>
			<textarea class="modal_replyCon" name="modal_replyCon"></textarea>
		</div>
		
		<div>
			<button type="button" class="modal_update_btn">수정</button>
			<button type="button" class="modal_cancel">취소</button>
		</div>
	</div>
	
	<div class="modalBackground"></div>

</div>

<script>
$(".modal_update_btn").click(function() {
	var updateConfirm = confirm("수정해도 되겠습니까?");
	
	if (updateConfirm) {
		var data = {
				replyNum : $(this).attr("data-replyNum"),
				replyCon : $(".modal_replyCon").val()
		};
		
		$.ajax({
			url : "/shop/view/updateReply",
			type : "post",
			data : data,
			success : function(result) {
				
				if (result == 1) {
					replyList();
					$(".replyModal").fadeOut(200);
				} else {
					alert("작성자만 할 수 있습니다.")
				}
			},
			error : function() {
				alert("로그인 하세요.")
			}
		});
	}
});
</script>

<script>
$(".modal_cancel").click(function() {
	// $(".replyModal").attr("style", "display:none;");
	$(".replyModal").fadeOut(200);
});
</script>
</body>
</html>
