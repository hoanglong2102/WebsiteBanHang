<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Thông tin người dùng</title>


</head>


<body>

	<div class="card" style="width: 40rem;">
		<img src="<c:url value="/uploads/${user.profileImage}" />"
			height="200" class="card-img-top avatar" alt="Avatar">
		<div class="card-body">
			<h5 class="card-title">${user.firstName}${user.lastName}</h5>
			<p class="card-text">
			<div class="row">
				<div class="col">
					<label> Email: </label>

				</div>
				<div class="col">${user.email}</div>
			</div>
			<div class="row">
				<div class="col">
					<label>Số điện thoại:</label>
				</div>
				<div class="col">${user.phoneNumber}</div>
			</div>
			<div class="row">
				<div class="col">
					<label>Chức vụ / Quyền hạn:</label>
				</div>
				<div class="col">${user.userType.name}</div>
				<%-- <c:forEach items="${user.permissions}" var="c">
						<div class="col">${c.permissionName}</div>
					</c:forEach> --%>
			</div>
			</p>
		</div>

			<a href="/admin/user/" class="btn btn-light"><i class="fas fa-undo"></i> Trở lại</a>

	</div>

</body>
</html>