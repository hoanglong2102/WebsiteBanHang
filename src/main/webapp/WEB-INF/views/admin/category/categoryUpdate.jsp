<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Category</title>

</head>


<body>
	<c:if test="${not empty errorMessage }">
		<div class="alert alert-danger" role="alert">${errorMessage }</div>
	</c:if>
	<div class="card" style="width: 40rem;">
		<h2 class="card-title">
			<c:if test="${mode == 'ADD'}">
			Thêm danh mục
		</c:if>
			<c:if test="${mode == 'EDIT'}">
			Cập nhật danh mục
		</c:if>

		</h2>
		<div class="card-body">
			<c:set var="saveUrl"
				value="${pageContext.request.contextPath}/admin/category/save" />
			<form:form enctype="multipart/form-data" method="POST"
				action="${saveUrl}" modelAttribute="category">
				<form:input type="hidden" path="categoryCode" id="categoryCode" />
				<div class="form-group">
					<label for="categoryName">Tên danh mục:</label>
					<form:input path="categoryName" type="text" class="form-control"
						id="categoryName" />
				</div>
				<div class="form-group">
					<label for="categoryImages">Biểu tượng danh mục:<a
						href="https://fontawesome.com/icons?d=gallery" target="_blank">(Tại đây)</a></label>
					<form:input path="categoryImages" type="text" class="form-control"
						id="categoryImages" />
				</div>

				<button type="submit" class="btn btn-primary">Lưu</button>
			</form:form>
		</div>
	</div>
</body>
</html>