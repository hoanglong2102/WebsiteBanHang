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
	<h2>Danh mục</h2>
	<center>
		<div>
			Kết quả tìm kiếm cho '${search}' - có ${size} kết quả tìm kiếm được
			<button type="reset" class="btn btn-light" value="Reset">
				<a href="/admin/category/"><i class="fas fa-undo"></i> Trở lại</a>
			</button>
		</div>
	</center>

	<%-- <div class="container">
		<c:set var="searchUrl"
			value="${pageContext.request.contextPath}/admin/category/search" />
		<form:form method="POST" action="${searchUrl}">
			<div class="row">	
			<div class="col-sm">
					<input class="form-control" type="text" name="search" placeholder="Nhập tên cần tìm"
						aria-label="Search">
				</div>
				
				<div class="col-sm">
					<button  type="submit" class="btn btn-primary"><i class="fas fa-search" width="auto"></i> Tìm kiếm</button>
				</div>
			</div>
		</form:form>
	</div> --%>
	<c:choose>
		<c:when test="${ketqua}">
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<thead>
						<tr>
							<td>Xem</td>
							<td style="text-align: center">Mã danh mục</td>
							<td>Tên danh mục</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${categories}" var="category">

							<tr>
								<td style="text-align: center"><a
									href="<c:url value='/admin/category/getCategory/${category.categoryCode}?mode=VIEW' />"><i
										class="fas fa-eye"></i></a></td>
								<td style="text-align: center">${category.categoryCode}</td>
								<td>${category.categoryName}</td>
								<td><a
									href="<c:url value='/admin/category/getCategory/${category.categoryCode}?mode=EDIT' />"><i
										class="far fa-edit"></i></a></td>
								<td><a
									href="<c:url value='/admin/category/deleteCategory/${category.categoryCode}' />"><i
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

</body>
</html>