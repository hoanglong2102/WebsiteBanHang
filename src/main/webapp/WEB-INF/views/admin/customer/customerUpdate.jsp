<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Cập nhật Khách hàng</title>
<style>
.error {
	color: red;
}
</style>

<!-- <script>
	var inputnumberPhone = document.getElementById('numberPhone');
	</script>
	<script>
	inputnumberPhone.oninvalid = function(event) {
	    event.target.setCustomValidity('Sô điện không hợp lệ hoặc sô điện thoại phải có từ 6 đến 11 chữ số');
	}
</script> -->

</head>


<body>
	<c:if test="${not empty errorMessage }">
		<div class="alert alert-danger" role="alert">${errorMessage }</div>
	</c:if>
	<div class="card" style="width: 40rem;">
		<h2 class="card-title">
			<c:if test="${mode == 'ADD'}">
			Thêm khách hàng
		</c:if>
			<c:if test="${mode == 'EDIT'}">
			Cập nhật
		</c:if>

		</h2>
		<div class="card-body">
			<c:set var="saveUrl"
				value="${pageContext.request.contextPath}/admin/customer/save" />
			<form:form enctype="multipart/form-data" method="POST"
				action="${saveUrl}" modelAttribute="customer" autocomplete="on">
				<form:input type="hidden" path="id" id="id" />
				<%-- 			<form:input type="hidden" path="address.id" id="addressId" /> --%>

				<div class="form-group">
					<label for="firstName">Họ: </label>
					<form:input path="firstName" type="text" class="form-control"
						id="firstName"/>
				</div>
				<div class="form-group">
					<label for="lastName">Tên:</label>
					<form:input path="lastName" type="text" class="form-control"
						id="lastName" />
				</div>
				<div class="form-group">
					<label for="numberPhone">SĐT:</label>
					<form:input path="numberPhone" type="text" class="form-control"
						pattern="[0-9]{6,11}"
						title="Sô điện không hợp lệ hoặc sô điện thoại phải có từ 6 đến 11 chữ số"
						id="numberPhone" />
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
					<%-- <label for="email">Email:</label>
				<form:input path="email" type="email" class="form-control" id="email"/> --%>

					<form:label path="email" cssclass="text-success">Email</form:label>
					<form:input path="email" type="email"
						placeholder="Nhập email của bạn" cssClass="form-control" />
					<form:errors path="email" cssClass="text-danger" />

				</div>

				<div class="btn-group">
					<button type="submit" class="btn btn-primary" value="Save">Lưu</button>
					<button type="reset" class="btn btn-light" value="Reset">
						<a href="/admin/customer/getCustomer/${customer.id}?mode=VIEW"><i class="fas fa-undo"></i> Trở lại</a>
					</button>
				</div>

			</form:form>
		</div>
	</div>
</body>
</html>