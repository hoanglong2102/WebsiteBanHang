<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Chi tiết sản phẩm</title>
<style type="text/css">
img {
	display: block;
	margin-left: auto;
	margin-right: auto;
}

.card-text {
	width: 550px;
	text-align: justify;
}

h5 {
	text-align: justify;
}

.title {
	width: 500px;
	text-align: center;
}

.shopping_cart {
	width: 550px;
}

.shopping_cart .cart_title {
	text-align: center;
}
</style>
</head>
<body>
	<div class="col-lg-9">
		<div class="card mt-4">
			<img src="<c:url value='/uploads/${product.productImages}'/>"
				width="250" height="200" alt="">
			<div class="card-body">
				<div class="title">
					<h3 class="card-title">${product.productName}</h3>
					<h3 class="card-title" style="font-size: 18px">${product.manufacturer.manufacturerName}</h3>
					<h3 class="card-title" style="font-size: 18px">Năm sản xuất:
						${product.yearManufactured}</h3>
				</div>
				<fmt:setLocale value="vi_VN" scope="session" />
				<h5 style="color: #f20;" align="center">
					<fmt:formatNumber type="currency" value="${product.newPrice}"></fmt:formatNumber>
				</h5>
				<c:if test="${product.discount !=0 }">
					<h5 style="color: #f20; font-size: 14px;">
						<fmt:formatNumber value="${- product.discount}" />
						%
					</h5>
				</c:if>
				<h5
					style="text-decoration: line-through; color: #bebcb5; font-size: 12px;">
					<fmt:formatNumber type="currency" value="${product.oldPrice}" />
				</h5>
				<p class="card-text">${product.description}</p>

				<div class="shopping_cart">
					<div class="cart_title">
						<c:choose>
							<c:when test="${product.productNumber <=0}">
								<h3 style="color: #f20;">Đã hết hàng</h3>
							</c:when>
							<c:otherwise>
								<a
									href="<c:url value='/shop/buyProduct?id=${product.productCode }' />"
									class="btn btn-primary">Thêm vào giỏ hàng</a>
								<br />
								<span class="text-warning">&#9733; &#9733; &#9733;
									&#9733; &#9734;</span>
							</c:otherwise>
						</c:choose>
					</div>

				</div>

			</div>
		</div>
	</div>
	<!-- /.card -->
</body>
</html>