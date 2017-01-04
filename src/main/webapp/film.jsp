<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String project = this.getServletContext().getContextPath();
%>
<!DOCTYPE HTML>
<head>
<title>电影院</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="<%=project %>/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="<%=project %>/js/jquery-1.9.0.min.js"></script> 
<script type="text/javascript" src="<%=project %>/js/move-top.js"></script>
<script type="text/javascript" src="<%=project %>/js/easing.js"></script>
<script type="text/javascript" src="<%=project %>/js/jquery.nivo.slider.js"></script>
<script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>
</head>
<body>
	<div class="header">
	<input type="hidden" id="userEmail" name="userEmail" value="" />
    <div class="headertop_desc">
        <div class="wrap">
            <div class="account_desc">
                <ul>
                    <li id="info">
                        <c:if test="${sessionScope.user == null }">
                        	<input type="text" value="" id="eAddress" placeholder="请输入邮箱" /> 
                        	<a href="javascript:void(0)" onclick="login();">登录</a>  
                        </c:if>
                        <c:if test="${sessionScope.user != null }">
                        	<a>欢迎您，${sessionScope.user.email }</a>
                        	<a>|</a>
                        	<a href="javascript:void(0)" onclick="quit()">退出</a>
                        </c:if>
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
                <a href="index.html">
                    <img src="<%=project %>/images/logo.png" alt="" />
                </a>
            </div>
            <div class="header_top_right">
                <div class="search_box">
                    <form>
                        <input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
                        <input type="submit" value="">
                    </form>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
</div>
</div>
<!------------End Header ------------>
<div class="main">
    <div class="wrap">
        <div class="content">
            <div class="content_top">
                <div class="heading">
                	<select name="filmKind" class="dropdown" id="filmKind"
                		style="font-family: 'ambleregular';font-size:0.90em;" onchange="chooseKind()" >
                		<option value="0">全部分类</option>
                		<c:forEach items="${films.filmKinds }" var="filmKind">
                			<option value="${filmKind.id }">${filmKind.kindName }</option>
                		</c:forEach>
                	</select>
                </div>
            </div>
            <div class="section group">
            	<c:forEach items="${films.firstFilms }" var="firstFilms">
                <div class="grid_1_of_5 images_1_of_5">
                    <img src="<%=project %>/images/${firstFilms.icon }" alt="" />
                    <h2>
                        <a href="preview.html">
                        	${firstFilms.filmName }   
                        </a>
                    </h2>
                    <div class="price-details">
                        <div class="price-number">
                            <p>
                                <span class="rupees">
                                   $${firstFilms.ticketPrice }元&nbsp;&nbsp;&nbsp;T${firstFilms.ticketNum }张
                                </span>
                            </p>
                        </div>
                        <div class="add-cart">
                            <h4>
                            	<c:if test="${sessionScope.user != null }">
                            		<a href="snap.do?filmId=${firstFilms.id }">抢&nbsp;&nbsp;购</a>
                            	</c:if>
                            	<c:if test="${sessionScope.user == null }">
                            		<a href="javascript:void(0)" onclick="alert('抢购请先登录');">抢&nbsp;&nbsp;购</a>
                            	</c:if>
                            </h4>
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
            <div class="section group">
            	<c:forEach items="${films.secondFilms }" var="secondFilms">
                <div class="grid_1_of_5 images_1_of_5">
                    <img src="<%=project %>/images/${secondFilms.icon }" alt="" />
                    <h2>
                        <a href="preview.html">
                            ${secondFilms.filmName }
                        </a>
                    </h2>
                    <div class="price-details">
                        <div class="price-number">
                            <p>
                                <span class="rupees">
                                    $${secondFilms.ticketPrice }元&nbsp;&nbsp;&nbsp;T${secondFilms.ticketNum }张
                                </span>
                            </p>
                        </div>
                        <div class="add-cart">
                            <h4>
                            	<c:if test="${sessionScope.user != null }">
                            		<a href="<%=project %>/film/snap.do?filmId=${secondFilms.id }">抢&nbsp;&nbsp;购</a>
                            	</c:if>
                            	<c:if test="${sessionScope.user == null }">
                            		<a href="javascript:void(0)" onclick="alert('抢购请先登录');">抢&nbsp;&nbsp;购</a>
                            	</c:if>
                            </h4>
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="page" style="text-align:center;font-family:'ambleregular';font-size:0.823em;">
    	<p>${films.toolBar }</p>
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
</body>
    <script type="text/javascript">
		$(document).ready(function() {			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
			var dd = new DropDown( $('#dd') );
			$(document).click(function() {
				// all dropdowns
				$('.wrapper-dropdown-2').removeClass('active');
			});
		});
		
		function chooseKind() {
		}
		
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
		
		function login() {
			var eAddress = $("#eAddress").val();
			if (eAddress == "") {
				alert("请输入邮箱");
			}else {
				var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
				if (reg.test(eAddress)) {
					//ajax请求
					$.ajax({
						url:"<%=project%>/film/login.do?email="+eAddress+"",
						dataType: "text",
						success:function(data) {
							if (data == "success") {
								alert("登录成功");
								window.location.href="<%=project%>/film/filmInfos.do";
							}else {
								alert("登录失败");
							}
						},
						error:function(e) {
							alert("服务端出错误啦");
						}
					});
				}else {
					alert("无效的邮箱格式");
				}
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
		
	</script>
</html>
