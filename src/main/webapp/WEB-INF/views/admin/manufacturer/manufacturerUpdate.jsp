<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Cập nhật Khách hàng</title>

</head>

<body>
	<c:if test="${not empty errorMessage }">
		<div class="alert alert-danger" role="alert">${errorMessage }</div>
	</c:if>
	<div class="card" style="width: 40rem;">
		<h2 class="card-title">
			<c:if test="${mode == 'ADD'}">
			Thêm nhà sản xuất
		</c:if>
			<c:if test="${mode == 'EDIT'}">
			Cập nhật
		</c:if>

		</h2>
		<div class="card-body">
			<c:set var="saveUrl"
				value="${pageContext.request.contextPath}/admin/manufacturer/save" />
			<form:form enctype="multipart/form-data" method="POST"
				action="${saveUrl}" modelAttribute="manufacturer">
				<form:input type="hidden" path="id" id="id" />

				<div class="form-group">
					<label for="manufacturerName">Tên nhà sản xuất: </label>
					<form:input path="manufacturerName" type="text"
						class="form-control" id="manufacturerName" />
				</div>
				<div class="form-group">
					<label for="imageFile">Logo: </label> <img
						src="<c:url value="/uploads/${manufacturer.logo}" />" height="200"
						width="200" />
					<form:input path="imageFile" class="form-control" id="imageFile"
						name="imageFile" type="file" />
				</div>
				<div class="form-group">
					<label for="phoneNumber">SĐT:</label>
					<form:input path="phoneNumber" type="text"
						pattern="((09|03|07|08|05)+([0-9]{8})\\b)"
						title="Số điện không hợp lệ hoặc số điện thoại phải không đúng chuẩn!"
						class="form-control" id="phoneNumber" />
				</div>
				<div class="form-group">
					<label for="street">Đường:</label>
					<form:input path="street" type="text" class="form-control"
						id="street" />
				</div>
				<div class="form-group">
					<label for="district">Quận,huyện:</label>
					<form:input path="district" type="text" class="form-control"
						id="district" />
				</div>
				<div class="form-group">
					<label for="city">TP:</label>
					<form:input path="city" type="text" class="form-control" id="city" />
				</div>
				<div class="form-group">
					<label for="email">Email:</label>
					<form:input path="email" type="text"
						pattern="^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$"
						title="Email không đúng chuẩn" class="form-control" id="email" />
				</div>


				<button type="submit" class="btn btn-primary" value="Save">Lưu</button>
			</form:form>
		</div>
	</div>
</body>
</html>