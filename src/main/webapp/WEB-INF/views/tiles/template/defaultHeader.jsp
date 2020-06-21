<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


</head>
<nav
	class="navbar navbar-dark fixed-top bg-gradient-primary flex-md-nowrap p-0">
	<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Quản lý cửa
		hàng công nghệ</a>
	<div class="px-5 dropdown show">
		<a class="btn white-text dropdown-toggle" role="button"
			id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"
			href="${pageContext.request.contextPath}/profile"><i
			class="far fa-user"></i> <sec:authentication
				property="principal.username" /> </a>

		<div class="dropdown-menu" aria-labelledby="dropdownMenuLink"
			style="right: 0;"">
			<a class="dropdown-item"
				href="${pageContext.request.contextPath}/logout"><i
				class="fas fa-sign-out-alt"></i>Đăng xuất</a> <a class="dropdown-item"
				href="${pageContext.request.contextPath}/profile/myProfile"><i
				class="fas fa-address-card"></i>Hồ sơ của tôi</a> <a
				class="dropdown-item"
				href="${pageContext.request.contextPath}/profile/viewchangepassword?username=<sec:authentication property="principal.username" />"><i
				class="fas fa-key"></i>Đổi mật khẩu</a>
		</div>
	</div>
</nav>

