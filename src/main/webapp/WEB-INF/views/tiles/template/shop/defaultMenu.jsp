<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

</head>
<div class="col-lg-3">

	<h1 class="my-4">
		<span class="category-icon-small"><i
			class="fas fa-align-justify"></i> Danh mục</span>
	</h1>
	<div class="list-group">
		<c:forEach items="${categories}" var="category">

			<a
				href="<c:url value='/shop/getProductsByCategory?filter=${category.categoryCode}' />"
				class="list-group-item "> <span class="category-icon">
					${category.categoryImages} </span>&nbsp; &nbsp; ${category.categoryName}
			</a>


		</c:forEach>
	</div>
	<h2 class="my-4">
		<span class="category-icon-small"><i
			class="fas fa-align-justify"></i> Nhà sản xuất</span>
	</h2>
	<div class="list-group">
		<c:forEach items="${manufacturers}" var="manufacturer">

			<a
				href="<c:url value='/shop/getProductsByManufacturer?filter=${manufacturer.id}' />"
				class="list-group-item "><img
				src="<c:url value="/uploads/${manufacturer.logo}" />" height="60"
				width="60">&nbsp; &nbsp; ${manufacturer.manufacturerName}</a>


		</c:forEach>
	</div>

</div>