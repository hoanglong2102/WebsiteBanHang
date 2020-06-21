<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Users</title>

</head>


<body>

		<p>Kết quả tìm kiếm cho '${search}' - có ${size} kết quả tìm kiếm được  <a href="/admin/user/" class="btn btn-light"><i class="fas fa-undo"></i> Quay lại</a></p>
<%-- 	<div class="container">
		<c:set var="searchUrl"
			value="${pageContext.request.contextPath}/admin/user/searchUser" />
		<form:form method="POST" action="${searchUrl}">
			<div class="row">
				<div class="col-sm">
					<input class="form-control" type="text" name="search"
						placeholder="Nhập tên người dùng" aria-label="Search">
				</div>
				<div class="btn-group">

					<button type="submit" class="btn btn-primary"><i class="fas fa-search" width="auto"></i> Tìm kiếm</button>
					<button type="reset"  class="btn btn-light" value="Reset"><a href="/admin/user/"><i class="fas fa-undo"></i> Trở lại</a></button>
				</div>
			</div>
		</form:form>
	</div> --%>
	<c:choose>
		<c:when test="${ketqua}">
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<thead>
						<tr class="table-info">
							<th>Mã</th>
							<th>Tên đăng nhập</th>
							<th>Tên người dùng</th>
							<th>Email</th>
							<th>Số điện thoại</th>
							<th>Cập nhật</th>
							<th>Xóa</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${users}" var="user">
							<tr>
								<td><a
									href="<c:url value='/admin/user/getUser/${user.id}?mode=VIEW' />"><i
										class="fas fa-eye"></a></td>
								<td>${user.userName}</td>
								<td>${user.firstName}${user.lastName}</td>
								<td>${user.email}</td>
								<td>${user.phoneNumber}</td>
								<td><a
									href="<c:url value='/admin/user/getUser/${user.id}?mode=EDIT' />"><i
										class="far fa-edit"></i></a></td>
								<td><a
									href="<c:url value='/admin/user/deleteUser/${user.id}' />"><i
										class="fas fa-trash-alt"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
		</c:when>
		<c:otherwise>
			<h4>Không có kết quả tìm kiếm</h4>
		</c:otherwise>
	</c:choose>

	<br />
</body>
</html>