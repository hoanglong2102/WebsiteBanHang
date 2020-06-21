<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Tất cả nhà sản xuất</title>

</head>


<body>
	<center>
		<h2>Danh sách nhà sản xuất</h2>
	</center>
	<div class="container">
		<c:set var="searchUrl"
			value="${pageContext.request.contextPath}/admin/manufacturer/search" />
		<form:form method="POST" action="${searchUrl}">
			<div class="row">
				<div class="col-sm">
					<input class="form-control" type="text" name="search"
						placeholder="Nhập tên cần tìm" aria-label="Search">
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
					<th style="text-align: center">ID</th>
					<th>Tên</th>
					<th>Logo</th>
					<th>SĐT</th>
					<th>Địa chỉ</th>
					<th>Email</th>
					<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
						<th style="text-align: center">Sửa</th>
						<th style="text-align: center">Xóa</th>
					</sec:authorize>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${manufacturers.getContent()}" var="manufacturer">
					<tr>
						<td style="text-align: center"><a
							href="<c:url value='/admin/manufacturer/getManufacturer/${manufacturer.id}?mode=VIEW' />"><i
								class="fas fa-eye"></i></a></td>
						<td>${manufacturer.manufacturerName}</td>
						<td><img src="<c:url value="/uploads/${manufacturer.logo}" />"
							height="60" width="60"></td>
						<td>${manufacturer.phoneNumber}</td>
						<td>${manufacturer.street},${manufacturer.district},
							${manufacturer.city}</td>
						<td>${manufacturer.email}</td>
						<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
							<td style="text-align: center"><a
								href="<c:url value='/admin/manufacturer/getManufacturer/${manufacturer.id}?mode=EDIT' />"><i
									class="far fa-edit"></i></a></td>
							<td style="text-align: center"><a
								href="<c:url value='/admin/manufacturer/deleteManufacturer/${manufacturer.id}' />"><i
									class="fas fa-trash-alt"></i></a></td>
						</sec:authorize>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
		<a href="<c:url value='/admin/manufacturer/addManufacturer' />"><i
			class="far fa-plus-square"></i> Thêm mới</a>
	</sec:authorize>
	<br>
	<c:if test="${manufacturers.totalPages > 0}">
		<util:pagination currentPage="${currentPage}" filter="${filter}"
			showPageTitle="Số nhà sản xuất / trang" thispage="${manufacturers}"></util:pagination>
	</c:if>

</body>
</html>