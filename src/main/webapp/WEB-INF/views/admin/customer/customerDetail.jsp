<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Thông tin khách hàng</title>

<!-- <style>
tr:first-child {
	font-weight: bold;
	background-color: #C6C9C4;
}

.error {
	color: #ff0000;
}
</style> -->

</head>


<%-- <body class="text-center">
	<h2>Customer Detail</h2>
	<c:set var="saveUrl"
		value="${pageContext.request.contextPath}/admin/customer/save" />

	<form:form method="POST" action="${saveUrl}" modelAttribute="customer">
		<form:input type="hidden" path="id" id="id" />
		<form:input type="hidden" path="address.id" id="addressId" />
		
		<center>
			<table>
				<tr>
					<td><label for="lastName">lastName: </label></td>
					<td><form:input path="lastName" id="lastName" /></td>
					<td><form:errors path="lastName" cssClass="error" /></td>
				</tr>
				<tr>
					<td><label for="firstName">firstName: </label></td>
					<td><form:input path="firstName" id="firstName" /></td>
					<td><form:errors path="firstName" cssClass="error" /></td>
				</tr>
				<tr>
					<td><label for="phone">Phone: </label></td>
					<td><form:input path="phone" id="phone" /></td>
					<td><form:errors path="phone" cssClass="error" /></td>
				</tr>
				<tr>
					<td><label for="address">Adrress-Street: </label></td>
					<td><form:input path="address.street" id="addressStreet" /></td>
					<td><form:errors path="address.street" cssClass="error" /></td>
				</tr>
				<tr>
					<td><label for="address">Adrress-District: </label></td>
					<td><form:input path="address.district" id="addressDistrict" /></td>
					<td><form:errors path="address.district" cssClass="error" /></td>
				</tr>
				<tr>
					<td><label for="address">Adrress-City: </label></td>
					<td><form:input path="address.city" id="addressCity" /></td>
					<td><form:errors path="address.city" cssClass="error" /></td>
				</tr>
			
				<tr>
					<td colspan="3"><c:choose>
							<c:when test="${mode != 'VIEW'}">
								<input type="submit" value="Save" />
							</c:when>
							<c:otherwise>
								<input disabled="disabled" type="submit" value="Save" />
							</c:otherwise>
						</c:choose></td>
				</tr>
			</table>
	</form:form>
	</center>
</body> --%>

<body>

	<div class="card" style="width: 40rem;">
		<%-- <img src="<c:url value="/uploads/${user.profileImage}" />" height="200" class="card-img-top avatar" alt="Avatar"> --%>
		<div class="card-body">
			<h5 class="card-title">
				<b>Thông tin khách hàng</b>
			</h5>
			<p class="card-text">
			<div class="row">
				<div class="col">
					<label><i class="fab fa-neos"></i> Tên: </label>

				</div>
				<div class="col">${customer.firstName} ${customer.lastName}</div>
			</div>
			<div class="row">
				<div class="col">
					<label><i class="fab fa-periscope"></i> Địa chỉ:</label>
				</div>
				<div class="col"> ${customer.street}, ${customer.district}, ${customer.city}</div>
			</div>
			<div class="row">
				<div class="col">
					<label><i class="fas fa-mobile-alt"></i> SĐT:</label>
				</div>
				<div class="col"> ${customer.numberPhone}</div>
			</div>
			<div class="row">
				<div class="col">
					<label><i class="fas fa-envelope-square"></i> Email:</label>
				</div>
				<div class="col"> ${customer.email}</div>
			</div>
			</p>
		</div>
	</div>

	<div class="p-3">
		<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
			<div>
				
					
					<div class="btn-group">
					<a
					href="<c:url value='/admin/customer/getCustomer/${customer.id}?mode=EDIT' />"
					class="btn btn-primary"><i class="fas fa-save"></i> Cập nhật</a>
					<button type="reset" class="btn btn-light" value="Reset">
						<a href="/admin/customer/"><i class="fas fa-undo"></i> Trở lại</a>
					</button>
				</div>
			</div>

		</sec:authorize>
	</div>

</body>
</html>