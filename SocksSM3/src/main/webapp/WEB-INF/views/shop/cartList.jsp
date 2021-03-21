<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<title>장바구니 목록</title>
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
		display:none; 
		position:absolute; 
		top:0; 
		left:180px;  
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
	/* selection#content ul li {
		display: inline-block;
		margin: 10px;
	}
	
	selection#content div socksThumb img {
		width: 200px; height: 200px;
	}
	
	selection#content div socksName {
		padding: 10px 0;
		text-align: center;
	}
	
	selection#content div socksName a {
		color: #000;
	} */
	
	selection#content ul li {
		margin: 10px 0;
		padding: 10px 0;
		border-bottom: 1px solid #999;
	}
	
	selection#content ul li img {
		width: 250px;
		height: 250px;
	}
	
	selection#content ul li::after {
		content: "";
		display: block;
		clear: both;
	}
	
	selection#content div.thumb {
		float: left;
		width: 250px;
	}
	
	selection#content div.socksInfo {
		float: right;
		width: calc(100% - 320px);
		font-size: 20px;
		line-height: 2;
	}
	
	selection#content div.socksInfo span {
		display: inline-block;
		width: 100px;
		font-weight: bold;
		margin-right: 10px;
	}
	
	selection#content div.socksInfo .delete {
		text-align: right;
	}
	
	selection#content div.socksInfo .delete button {
		font-size: 18px;
		padding: 5px 10px;
		border: 1px solid #eee;
		background: #eee;
	}
	
	.allCheck {
		float: left;
		width: 200px;
	}
	
	.allCheck input {
		width: 16px;
		height: 16px;
	}
	
	.allCheck label {
		margin-left: 10px;
	}
	
	.delBtn {
		float: right;
		width: 300px;
		text-align: right;
	}
	
	.delBtn button {
		font-size: 18px;
		padding: 5px 10px;
		border: 1px solid #eee;
		background: #eee;
	}
	
	.checkBox {
		float: left;
		width: 30px;
	}
	
	.checkBox input {
		width: 16px;
		height: 16px;
	}
	
	.listResult {
		padding: 20px;
		background: #eee;
	}
	
	.listResult .sum {
		float: left;
		width: 45%;
		font-size: 22px;
	}
	
	.listResult .orderInfoEnter {
		float: right;
		width: 45%;
		text-align: right;
	}
	
	.listResult .orderInfoEnter button {
		font-size: 18px;
		padding: 5px 10px;
		border: 1px solid #999;
		background: #fff;
	}
	
	.listResult::after {
		content: "";
		display: block;
		clear: both;
	}
	
	.orderInfo {
		border: 5px solid #eee;
		padding: 20px;
		display: none;
	}
	
	.orderInfo .inputArea {
		margin: 10px 0;
	}
	
	.orderInfo .inputArea label {
		display: inline-block;
		width: 120px;
		margin-right: 10px;
	}
	
	.orderInfo .inputArea input {
		font-size: 14px;
		padding: 5px;
	}
	
	#userAdd2, #userAdd3 {
		margin-top: 30px;
	}
	
	.orderInfo .inputArea:last-child {
		margin-top: 30px; 
	}
	
	.orderInfo .inputArea button {
		font-size: 20px;
		border: 2px solid #ccc;
		padding: 5px 10px;
		background: #fff;
		margin-right: 20px;
	}
	
	.orderInfo .inputArea #sample2_address {
		width: 230px;
	}
	
	.orderInfo .inputArea #sample2_detailAddress {
		width: 280px;
	}
	
	.orderInfo .inputArea #sample2_extraaddress {
		display: none;
	}
</style>

	<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
	
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
				<ul>
					<li>
						<div class="allCheck">
							<input type="checkbox" name="allCheck" id="allCheck"/>
							<label for="allCheck">전부 선택</label>
						</div>
						
						<script>
						$("#allCheck").click(function() {
							var check = $("#allCheck").prop("checked");
							if (check) {
								$(".checkBox").prop("checked", true);
							} else {
								$(".checkBox").prop("checked", false);
							}
						});
						</script>
						
						<div class="delBtn">
							<button type="button" class="selectDelete_btn">선택 삭제</button>
							
							<script>
								$(".selectDelete_btn").click(function() {
									var confirm_val = confirm("삭제해도 되겠습니까?");
									
									if (confirm_val) {
										var checkArr = new Array();
										
										$("input[class='checkBox']:checked").each(function() {
											checkArr.push($(this).attr("data-cartNum"));
										});
										
										$.ajax({
											url : "/shop/deleteCart",
											type : "post",
											data : {checkbox : checkArr},
											success : function(result) {
												
												if (result == 1) {
													location.href = "/shop/cartList";
												} else {
													alert("삭제 실패");
												}				
											}
										});
									}
								});
							</script>
							
						</div>
					</li>
					
					<c:set var="sum" value="0" />
					
					<c:forEach items="${cartList}" var="cartList">
					<li>
						<div class="checkBox">
							<input type="checkbox" name="checkBox" class="checkBox" data-cartNum="${cartList.cartNum}" />
						</div>
						
						<script>
							$(".checkBox").click(function() {
								$("#allCheck").prop("checked", false);
							});
						</script>
						
						<div class="thumb">
							<img src="${cartList.socksThumbImg}" />
						</div>
						
						<div class="socksInfo">
							<p>
								<span>상품명: </span>${cartList.socksName}
								<br>
								<span>가격: </span>
									<fmt:formatNumber pattern="###,###,###" value="${cartList.socksPrice}"/> 원
								<br>		
								<span>구입한 개수: </span>${cartList.cartStock}
								<br>
								<span>총액: </span>
									<fmt:formatNumber pattern="###,###,###" value="${cartList.socksPrice * cartList.cartStock}"/> 원				
							</p>
							
							<div class="delete">
								<button type="button" class="delete_${cartList.cartNum}_btn" data-cartNum="${cartList.cartNum}">삭제</button>
								
								<script>
									$(".delete_${cartList.cartNum}_btn").click(function() {
										var confirm_val = confirm("삭제해도 되겠습니까?");
										
										if (confirm_val) {
											var checkArr = new Array();
											
											checkArr.push($(this).attr("data-cartNum"));
											
											$.ajax({
												url : "/shop/deleteCart",
												type : "post",
												data : {checkbox : checkArr},
												success : function(result) {
													
													if (result == 1) {
														location.href = "/shop/cartList";
													} else {
														alert("삭제 실패");
													}
												}
											});
										}
									});
								</script>
								
							</div>
						</div>
					</li>
					
					<c:set var="sum" value="${sum + (cartList.socksPrice * cartList.cartStock)}" />
					
					</c:forEach>
				</ul>
				
				<div class="listResult">
					<div class="sum">
						총액 : <fmt:formatNumber pattern="###,###,###" value="${sum}"/>원
					</div>
					<div class="orderInfoEnter">
						<button type="button" class="orderInfoEnter_bnt">주문 정보 입력</button>
					</div>
					
					<script>
						$(".orderInfoEnter_bnt").click(function() {
							$(".orderInfo").slideDown();
							$(".orderInfoEnter_bnt").slideUp();
						});
					</script>
				</div>
				
				<div class="orderInfo">
					<form role="form" method="post" autocomplete="off">
					
						<input type="hidden" name="amount" value="${sum}" />
						
						<div class="inputArea">
							<label for="">받는사람</label>
							<input type="text" name="orderRec" id="orderRec" required="required" />
						</div>
						
						<div class="inputArea">
							<label for="orderPhone">수령인 전화번호</label>
							<input type="text" name="orderPhone" id="orderPhone" required="required" />
						</div>
						
						<div class="inputArea">
						
							<p>
								<input type="text" id="sample2_postcode" placeholder="우편번호">
								<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 검색">
							</p>
							<p>
								<input type="text" name="userAdd1" id="sample2_address" placeholder="주소">
								<input type="text" name="userAdd2" id="sample2_detailAddress" placeholder="상세주소">
								<input type="text" name="userAdd3" id="sample2_extraAddress" placeholder="참고">
							</p>
							
							<div id="layer" style="display:none; position:fixed; overflow:hidden; z-index:1; -webkit-overflow-scrolling:touch;">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer; position:absolute; right:-3px; top:-3px; z-index:1" onclick="closeDaumPostcode()" alt="닫기">
							</div>
							
							<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
							<script>
						    
						    	var element_layer = document.getElementById('layer');
						
						    	function closeDaumPostcode() {
						        
						        	element_layer.style.display = 'none';
						    	}
						
						    	function sample2_execDaumPostcode() {
						        	new daum.Postcode({
						            	oncomplete: function(data) {
						               
						                	var addr = ''; 
						                	var extraAddr = ''; 
						
						                		if (data.userSelectedType === 'R') { 
						                    		addr = data.roadAddress;
						                		} else { 
						                    		addr = data.jibunAddress;
						                		}
						      
						                	if(data.userSelectedType === 'R'){
						                    
						                    	if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						                        	extraAddr += data.bname;
						                    	}
						                    
						                    	if(data.buildingName !== '' && data.apartment === 'Y'){
						                        	extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						                    	}
						                    
						                    	if(extraAddr !== ''){
						                        	extraAddr = ' (' + extraAddr + ')';
						                    	}
						                    
						                    	document.getElementById("sample2_extraAddress").value = extraAddr;
						                
						                	} else {
						                    	document.getElementById("sample2_extraAddress").value = '';
						                	}
						
						                	document.getElementById('sample2_postcode').value = data.zonecode;
						                	document.getElementById("sample2_address").value = addr;
						               
						                	document.getElementById("sample2_detailAddress").focus();
						
						                	element_layer.style.display = 'none';
						            	},
						            	width : '100%',
						            	height : '100%',
						            	maxSuggestItems : 5
						        	}).embed(element_layer);
						     
						        	element_layer.style.display = 'block';
							       
						        	initLayerPosition();
						    	}
						
						    	function initLayerPosition(){
						        	var width = 300; 
						        	var height = 400; 
						        	var borderWidth = 5; 
						        
						        	element_layer.style.width = width + 'px';
						        	element_layer.style.height = height + 'px';
						        	element_layer.style.border = borderWidth + 'px solid';
						        
						        	element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
						        	element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
						    	}
							</script>
						</div>
						
						<div class="inputArea">
							<button type="submit" class="order_btn">주문</button>
							<button type="button" class="cancel_btn">취소</button>
						</div>
						
						<script>
						$(".cancel_btn").click(function() {
							$(".orderInfo").slideUp();
							$(".orderInfoEnter_bnt").slideDown();
						});
						</script>
					
					</form>
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
</body>
</html>
