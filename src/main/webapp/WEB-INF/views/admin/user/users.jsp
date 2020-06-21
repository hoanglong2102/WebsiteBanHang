<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Users</title>

</head>


<body>
	<center>
		<h2>Danh sách người dùng</h2>
	</center>

	<div class="container">
		<c:set var="searchUrl"
			value="${pageContext.request.contextPath}/admin/user/searchUser" />
		<form:form method="POST" action="${searchUrl}">
			<div class="row">
				<div class="col-sm">
					<input class="form-control" type="text" name="search"
						placeholder="Nhập tài khoản hoặc số điện thoại"
						aria-label="Search">
				</div>
				<div class="col-sm">

					<button type="submit" class="btn btn-primary">
						<i class="fas fa-search" width="auto"></i> Tìm kiếm
					</button>
				</div>
			</div>
		</form:form>
	</div>

	<div class="table-responsive">
		<table class="table table-striped table-sm table-hover">
			<thead>
				<tr class="table-info">
					<th style="text-align: center">Xem</th>
					<th>Tên đăng nhập</th>
					<th>Tên người dùng</th>
					<th>Email</th>
					<th>Số điện thoại</th>
					<sec:authorize access="hasAnyRole('SUPPER_ADMIN')">
						<th style="text-align: center">Cập nhật</th>
						<th style="text-align: center">Xóa</th>
					</sec:authorize>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${users.getContent()}" var="user">
					<tr>
						<td style="text-align: center"><a
							href="<c:url value='/admin/user/getUser/${user.id}?mode=VIEW' />"><i
								class="fas fa-eye"></a></td>
						<td>${user.userName}</td>
						<td>${user.firstName}${user.lastName}</td>
						<td>${user.email}</td>
						<td>${user.phoneNumber}</td>
						<sec:authorize access="hasAnyRole('SUPPER_ADMIN')">
							<td style="text-align: center"><a
								href="<c:url value='/admin/user/getUser/${user.id}?mode=EDIT' />"><i
									class="fas fa-user-edit"></i></a></td>
							<td style="text-align: center"><a
								href="<c:url value='/admin/user/deleteUser/${user.id}' />"><i
									class="fas fa-trash-alt"></i></a></td>
						</sec:authorize>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>
	<br>
	<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
		<a href="<c:url value='/admin/user/addUser' />"><i
			class="far fa-plus-square"></i> Thêm người dùng mới</a>
	</sec:authorize>

	<br>
	<br>
	<c:if test="${users.totalPages > 0}">
		<util:pagination currentPage="${currentPage}"
			showPageTitle="Sô người dùng / Trang" thispage="${users}"></util:pagination>
	</c:if>
	<br />
</body>
</html>