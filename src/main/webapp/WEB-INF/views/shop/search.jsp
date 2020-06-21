<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>


<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Trang chủ</title>
<style type="text/css">
h5 {
	display: inline;
	padding-right: 20px;
}

.row {
	padding-top: 30px;
}

.giohang {
	float: right;
	padding-bottom: 30px;
}

.product_name {
	height: 30px;
}

.product_gia {
	margin-top: 15px;
}

.card-footer {
	text-align: center;
}
</style>

</head>

<body>
	<div class="container">
		<c:set var="searchUrl"
			value="${pageContext.request.contextPath}/shop/search" />
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
	<div id="carouselExampleIndicators" class="carousel slide my-4"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class=""></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"
				class=""></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"
				class="active"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="carousel-item">
				<img class="d-block img-fluid"
					src="<c:url value="/uploads/macbook.jpg" />" alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block img-fluid"
					src="<c:url value="/uploads/note10+banner.jpg" />"
					alt="Second slide">
			</div>
			<div class="carousel-item active">
				<img class="d-block img-fluid"
					src="<c:url value="/uploads/iPhone_11_Banner.png" />"
					alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<c:choose>
		<c:when test="${ketqua}">
			<div class="p-3">
				<div>Kết quả tìm kiếm cho '${search}': ${size} kết quả tìm
					kiếm được</div>
			</div>
			<div class="row">

				<c:forEach items="${products}" var="p">
					<div class="col-lg-4 col-md-6 mb-4">
						<div class="card h-100">
							<a
								href="<c:url value='/shop/getProduct/${p.productCode}?mode=VIEW' />"><img
								class="card-img-top"
								src="<c:url value="/uploads/${p.productImages}" />" alt=""
								width="250" height="200"></a>
							<div class="card-body">
								<div class="product_name">
									<h5 style="color: #3d3637; font-size: 15px;">
										<a
											href="<c:url value='/shop/getProduct/${p.productCode}?mode=VIEW' />">${p.productName}</a>
									</h5>
								</div>
								<div class="product_gia">
									<fmt:setLocale value="vi_VN" scope="session" />
									<h5 style="color: #f20; font-size: 15px;">
										<fmt:formatNumber type="currency" value="${p.newPrice}"></fmt:formatNumber>
									</h5>
									<c:if test="${p.discount !=0 }">
										<h5 style="color: #f20; font-size: 14px;">
											<fmt:formatNumber value="${- p.discount}" />
											%
										</h5>
									</c:if>
									<br />
									<h5
										style="text-decoration: line-through; color: #bebcb5; font-size: 12px;">
										<fmt:formatNumber type="currency" value="${p.oldPrice}" />
									</h5>
								</div>
							</div>
							<c:choose>
								<c:when test="${p.productNumber <=0}">

									<fieldset disabled>

										<a
											href="<c:url value='/shop/buyProduct?id=${p.productCode }' />"
											class="btn btn-primary"
											style="background: #f20; border-radius: 5px; border: 2px solid #f20;">Đã
											hết hàng</a>

									</fieldset>
								</c:when>
								<c:otherwise>
									<a
										href="<c:url value='/shop/buyProduct?id=${p.productCode }' />"
										class="btn btn-primary">Thêm vào giỏ hàng</a>

								</c:otherwise>

							</c:choose>
							<div class="card-footer">
								<small class="text-muted">&#9733; &#9733; &#9733;
									&#9733; &#9734;</small>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:when>
		<c:otherwise>
			<h4>Không có kết quả tìm kiếm</h4>
		</c:otherwise>
	</c:choose>





</body>
</html>