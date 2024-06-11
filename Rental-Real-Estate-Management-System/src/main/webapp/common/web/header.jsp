<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.javaweb.security.utils.SecurityUtils" %>
<%@ taglib prefix="select" uri="http://www.springframework.org/tags/form" %>
<%@include file="/common/taglib.jsp" %>
<nav class="navbar-expand-lg navbar-dark fixed-top">
		<div class="row navbar">
			<div class="col-12 col-md-3">
				<div class="logo">
					<a href="">
						<img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/logo.png?1676257083798" alt="">
					</a>
				</div>
			</div>
			<div class="col-12 col-md-6">
				<div class="item-menu">
					<div class="nav nav1">
						<div class="nav-item p-2">
							<a class="nav-item-link" href="/trang-chu">
								<span style="color: var(--primary-color);">Trang chủ</span>
							</a>
						</div>
						<div class="nav-item p-2">
							<a href='<c:url value='/gioi-thieu'/>'>
								<%--<span>Giới thiệu</span>--%>
								<span style="color: var(--primary-color);">Giới thiệu</span>
							</a>
						</div>
						<div class="nav-item p-2">
							<%--<a class="nav-item-link" href="./Duan.html">--%>
							<a href='<c:url value='/san-pham'/>'>
								<%--<span>Sản phẩm</span>--%>
								<span style="color: var(--primary-color);">Sản phẩm</span>
							</a>
						</div>
						<div class="nav-item p-2">
							<a href='<c:url value='/tin-tuc'/>'>
								<%--<span>Tin tức</span>--%>
								<span style="color: var(--primary-color);">Tin tức</span>
							</a>
						</div>
						<div class="nav-item p-2">
							<a href='<c:url value='/lien-he'/>'>
								<%--<span>Liên hệ</span>--%>
									<span style="color: var(--primary-color);">Liên hệ</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<security:authorize access = "isAnonymous()">
						<li class><a class="nav-link" href="<c:url value='/login'/>">Đăng nhập</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Đăng ký</a></li>
					</security:authorize>
					<security:authorize access = "isAuthenticated()">
						<li class="nav-item"><a class="nav-link" href="/admin/home"> Hello <%=SecurityUtils.getPrincipal().getUsername()%></a></li>
						<li class="nav-item">
							<a class="nav-link" href="<c:url value='/logout'/>">
								<i class="fa-solid fa-right-from-bracket" style="line-height: 22px"></i>
							</a>
						</li>
					</security:authorize>
				</ul>
			</div>
		</div>
</nav>