<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>

	<center><div>Kết quả tìm kiếm cho '${Search}' - có ${size} kết quả tìm kiếm được <button type="reset"  class="btn btn-light" value="Reset"><a href="/admin/customer/"><i class="fas fa-undo"></i> Trở lại</a></button></div></center>
<%-- 	<div class="container">
		<c:set var="searchUrl"
			value="${pageContext.request.contextPath}/admin/customer/searchCustomer" />
		<form:form method="POST" action="${searchUrl}">
			<div class="row">
				<div class="col-sm-5">
					<input class="form-control" type="text" name="search"
						placeholder="Nhập tên hoặc số điện thoại" aria-label="Search">
				</div>
				<div class="btn-group">

					<button type="submit" class="btn btn-primary"><i class="fas fa-search" width="auto"></i> Tìm kiếm</button>
				
					<button type="reset"  class="btn btn-light" value="Reset"><a href="/admin/customer/"><i class="fas fa-undo"></i> Trở lại</a></button>
				</div>
			</div>
		</form:form>
	</div> --%>

	<c:choose>
		<c:when test="${ketqua}">
			<div class="table-responsive">
				<table class="table table-striped table-sm table-hover">
					<thead>
						<tr class="table-info">
							<th style="text-align: center">ID</th>
							<th>Tên</th>
							<th>SĐT</th>
							<th>Địa chỉ</th>
							<th>Email</th>
							<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER','EMPLOYEE')">
							<th style="text-align: center">Sửa</th>
							<th style="text-align: center">Xóa</th>
							</sec:authorize>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${customers}" var="customer">
							<tr>
								<td style="text-align: center"><a
									href="<c:url value='/admin/customer/getCustomer/${customer.id}?mode=VIEW' />"><i
										class="fas fa-eye"></i></a></td>
								<td>${customer.firstName} ${customer.lastName}</td>
								<td>${customer.numberPhone}</td>
								<td>${customer.street},${customer.district},
									${customer.city}</td>
								<td>${customer.email}</td>
								<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER','EMPLOYEE')">
								<td style="text-align: center"><a
									href="<c:url value='/admin/customer/getCustomer/${customer.id}?mode=EDIT' />"><i
										class="far fa-edit"></i></a></td>
								<td style="text-align: center"><a
									href="<c:url value='/admin/customer/deleteCustomer/${customer.id}' />"><i
										class="fas fa-trash-alt"></i></a></td>
										</sec:authorize>
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

</body>
</html>