<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String project = this.getServletContext().getContextPath();
%>
<!DOCTYPE HTML>
<head>
<title>订票</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="<%=project %>/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="<%=project %>/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="<%=project %>/js/move-top.js"></script>
<script type="text/javascript" src="<%=project %>/js/easing.js"></script>
</head>
<body>
<div class="header">
	<div class="headertop_desc">
		<div class="wrap">
			<div class="account_desc">
				<ul>
					<li>
						<a>欢迎您，${sessionScope.user.email}</a>
						<a>|</a>
						<a href="javascript:void(0)" onclick="quit()">退出</a>
					</li>
					
				</ul>
			</div>
			<div class="clear">
			</div>
		</div>
	</div>
	<div class="wrap">
		<div class="header_top">
			<div class="logo">
				<a href="#"><img src="<%=project %>/images/logo.png" alt=""/></a>
			</div>
			<div class="header_top_right">
				<div class="search_box">
					<form>
						<input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}"><input type="submit" value="">
					</form>
				</div>
				<div class="clear">
				</div>
			</div>
			<div class="clear">
			</div>
		</div>
	</div>
</div>
<div class="main">
	<div class="wrap">
		<div class="content_top">
			<div class="back-links">
				<p>
					<a href="<%=project %>/film/filmInfos.do" >首页</a>&gt;&gt;&gt;<a href="#" class="active">订票</a>
				</p>
			</div>
			<div class="clear">
			</div>
		</div>
		<div class="section group">
			<input type="hidden" id="filmId" name="filmId" value="${film.id }" />
			<div class="cont-desc span_1_of_2">
				<div class="product-details">
					<div class="grid images_3_of_2">
						<img src="<%=project %>/images/test.jpg" alt="测试，用同一张图片"/>
					</div>
					<div class="desc span_3_of_2">
						<h2>${film.filmName }</h2>
						<p>
							${film.detail.substring(0,40) } ...
						</p>
						<div class="price">
							<p>
								票价: <span>$${film.ticketPrice }</span>
							</p>
						</div>
						<div class="available">
							<ul>
								<li><span>当前余票 :</span>&nbsp;&nbsp;<span id="totalNum">${film.ticketNum }</span></li>
							</ul>
						</div>
						<div class="share-desc">
							<div class="share">
								<p>
									购买票数 :
								</p>
								<input class="text_box" type="text" id="saleNum">
							</div>
							<div class="button">
								<span><a href="javascript:void(0)" onclick="shopping()">抢&nbsp;&nbsp;购</a></span>
							</div>
							<div class="clear">
							</div>
						</div>
					</div>
					<div class="clear">
					</div>
				</div>
				<div class="product_desc">
					<h2>影片简介 :</h2>
					<p>
						${film.detail }
					</p>
				</div>
			</div>
			<div class="rightsidebar span_3_of_1 sidebar">
				<h2>热映大片</h2>
				<c:forEach items = "${hotFilms }" var = "hotFilm">
				<div class="special_movies">
					<div class="movie_poster">
						<a><img src="<%=project %>/images/${hotFilm.icon}" alt=""/></a>
					</div>
					<div class="movie_desc">
						<h3><a>${hotFilm.filmName }</a></h3>
						<p>
							$${hotFilm.ticketPrice }元&nbsp;&nbsp;T${hotFilm.ticketNum }张
						</p>
						<span><a href="<%=project%>/film/snap.do?filmId=${hotFilm.id }">抢&nbsp;&nbsp;购</a></span>
					</div>
					<div class="clear">
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<div class="footer">
	<div class="wrap">
		<div class="copy_right">
			<p>
				Copyright &copy; 2016.Company name All rights reserved CITIC Bank
			</p>
		</div>
	</div>
</div>
<a href="#" id="toTop"><span id="toTopHover"></span></a>
</body>
<script type="text/javascript">

	$(document).ready(function() {			
		$().UItoTop({ easingType: 'easeOutQuart' });
		
		var dd = new DropDown( $('#dd') );
		$(document).click(function() {
			$('.wrapper-dropdown-2').removeClass('active');
		});
	});
	
	function DropDown(el) {
		this.dd = el;
		this.initEvents();
	}
	
	DropDown.prototype = {
		initEvents : function() {
			var obj = this;
			obj.dd.on('click', function(event){
				$(this).toggleClass('active');
				event.stopPropagation();
			});	
		}
	}
	
	function quit() {
		if (confirm("您确定退出么？")) {
			$.ajax({
				url:"<%=project%>/film/quit.do",
				dataType:"text",
				success:function(data) {
					if (data == "success") {
						window.location.href = "<%=project%>/film/filmInfos.do";
					}
				},
				error:function(e) {
					alert("服务器出错啦");
				}
			});
		}
	}
	
	function shopping() {
		var totalNum = parseInt($("#totalNum").text());
		var saleNum = $("#saleNum").val();
		if (saleNum == "") {
			alert("您还没有输入购买票数");
			return;
		}
		saleNum = parseInt(saleNum); 
		if (saleNum > totalNum) {
			alert("购买票数不能超过库存量");
			return;
		}
		var filmId = $("#filmId").val();
		$.ajax({
			url:"<%=project%>/film/shopping.do?filmId="+filmId+"&ticketNum="+saleNum,
			dataType:"text",
			success:function(data) {
				if (data == "success") {
					alert("抢购成功，相关细则已发送至邮箱，请查阅。");
					window.location.href = "<%=project%>/film/filmInfos.do";
				}
			},
			error:function(e) {
				alert("服务器出错啦");
			}
		});
		
	}
	
</script>
</html>