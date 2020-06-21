<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Menu</title>


</head>
<nav class="col-md-2 d-none d-md-block bg-light sidebar">
	<div class="sidebar-sticky">
		<ul class="nav flex-column">
			<sec:authorize access="hasRole('SUPPER_ADMIN')">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/admin/user/"> <i
						class="far fa-address-book"></i> <span data-feather="file"></span>
						Quản lý người dùng
				</a></li>
			</sec:authorize>



			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/admin/order/"> <i
					class="fas fa-file-alt"></i> <span data-feather="file"></span> Quản
					lý hóa đơn
			</a></li>


			<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/admin/product/"> <i
						class="fab fa-product-hunt"></i> <span
						data-feather="shopping-cart"></span> Quản lý sản phẩm
				</a></li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/admin/category/"> <i
						class="fas fa-align-justify"></i> <span
						data-feather="shopping-cart"></span> Quản lý danh mục
				</a></li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/admin/manufacturer/"> <i
						class='fas fa-building'></i> <span data-feather="shopping-cart"></span>
						Quản lý nhà sản xuất
				</a></li>
			</sec:authorize>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/admin/customer/"> <i
					class="fas fa-user-plus"></i> <span data-feather="users"></span>
					Quản lý khách hàng
			</a></li>


		</ul>
	</div>
</nav>