<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tất cả danh mục</title>

</head>


<body>
	<h2 style="text-align: center">Danh mục</h2>

	<div class="container">
		<c:set var="searchUrl"
			value="${pageContext.request.contextPath}/admin/category/search" />
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
		<table class="table table-striped table-sm">
			<thead>
				<tr>
					<td>Xem</td>
					<td style="text-align: center">Mã danh mục</td>
					<td>Tên danh mục</td>
					<td>Biểu tưởng danh mục
					<td>Cập nhật</td>
					<td>Xóa</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${categories.getContent()}" var="category">

					<tr>
						<td style="text-align: center"><a
							href="<c:url value='/admin/category/getCategory/${category.categoryCode}?mode=VIEW' />"><i
								class="fas fa-eye"></i></a></td>
						<td style="text-align: center">${category.categoryCode}</td>
						<td>${category.categoryName}</td>
						<td>${category.categoryImages }</td>
						<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
							<td><a
								href="<c:url value='/admin/category/getCategory/${category.categoryCode}?mode=EDIT' />"><i
									class="far fa-edit"></i></a></td>
							<td><a
								href="<c:url value='/admin/category/deleteCategory/${category.categoryCode}' />"><i
									class="fas fa-trash-alt"></i></a></td>
						</sec:authorize>
					</tr>

				</c:forEach>
			</tbody>
		</table>
	</div>
	<c:if test="${categories.totalPages > 0}">
		<util:pagination currentPage="${currentPage}"
			showPageTitle="Số danh mục mỗi trang" thispage="${categories}"></util:pagination>
	</c:if>
	<br />
	<a href="<c:url value='/admin/category/addCategory' />">Thêm danh
		mục mới</a>

</body>
</html>