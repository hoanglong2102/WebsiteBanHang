<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tất cả sản phẩm</title>

</head>


<body>
	<h2 style="text-align: center">Tất cả sản phẩm</h2>

	<div class="container">
		<c:set var="searchUrl"
			value="${pageContext.request.contextPath}/admin/product/search" />
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
	<div class="table-responsive-sm">
		<table class="table table-bordered">
			<thead>
				<tr>
					<td>Xem</td>
					<td style="text-align: center">Mã sản phẩm</td>
					<td>Hình ảnh</td>
					<td>Tên sản phẩm</td>
					<td style="text-align: center">Giá mới</td>
					<td style="text-align: center">Giá cũ</td>
					<td>Số lượng</td>
					<td>Năm Sản Xuất</td>
					<td>Còn lại</td>
					<td>Giảm giá</td>
					<td style="text-align: center">Ngày tạo</td>
					<td>Mô tả
					<td>Cập nhật</td>
					<td>Xóa</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${products.getContent()}" var="product">
					<tr>
						<td style="text-align: center"><a
							href="<c:url value='/admin/product/getProduct/${product.productCode}?mode=VIEW' />"><i
								class="fas fa-eye"></i></a></td>
						<td style="text-align: center">${product.productCode}</td>
						<td><img
							src="<c:url value="/uploads/${product.productImages}" />"
							height="60" width="60"></td>
						<td>${product.productName}</td>
						<td style="text-align: center"><strong> <fmt:formatNumber
									pattern="#,##0" value="${product.newPrice}"
									var="formattedPrice" /> <c:out value="${formattedPrice}"></c:out>
								đ
						</strong></td>
						<td style="text-align: center"><strong> <fmt:formatNumber
									pattern="#,##0" value="${product.oldPrice}"
									var="formattedPrice" /> <c:out value="${formattedPrice}"></c:out>
								đ
						</strong></td>
						<td style="text-align: center">${product.productNumber}</td>
						<td style="text-align: center">${product.yearManufactured}</td>
						<td style="text-align: center">${product.remain}</td>
						<td style="text-align: center"><strong>${product.discount}
						</strong>%</td>
						<td><fmt:formatDate type="date" value="${product.created}" /></td>
						<td>${product.description}</td>
						<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
							<td><a
								href="<c:url value='/admin/product/getProduct/${product.productCode}?mode=EDIT' />"><i
									class="far fa-edit"></i></a></td>
							<td><a
								href="<c:url value='/admin/product/deleteProduct/${product.productCode}' />"><i
									class="fas fa-trash-alt"></i></a></td>
						</sec:authorize>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<c:if test="${products.totalPages > 0}">
		<util:pagination currentPage="${currentPage}" filter="${filter}"
			showPageTitle="Số sản phẩm mỗi trang" thispage="${products}"></util:pagination>
	</c:if>
	<br />
	<a href="<c:url value='/admin/product/addProduct' />">Thêm sản phẩm
		mới</a>

</body>
</html>