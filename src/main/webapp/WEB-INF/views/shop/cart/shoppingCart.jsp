<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
	<div class="entry-header-area ptb-40">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="entry-header">
						<h1 class="entry-title">
							<center>Giỏ hàng</center>
						</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- If error messages -->
	<div id="checkoutError" class=""></div>
	<!--alert-error-->
	<c:if test="${not empty errorMessage&& errorMessage!=null }">
		<div class="alert alert-danger" role="alert">${errorMessage }</div>
	</c:if>
	<c:choose>
		<c:when
			test="${cartForm != null && cartForm.cartLines != null&& !empty cartForm.cartLines}">


			<div class="cart-main-area ptb-40">
				<div class="container">
					<div class="cart-main-area ptb-40">
						<div class="container">
							<div class="row">
								<div class="col-lg-18 col-md-18 col-sm-18 col-xs-18">
									<div class="table-content table-responsive">
										<table id="mainCartTable"
											class="table table-hover table-condensed">
											<thead>
												<tr>
													<th>Hình ảnh</th>
													<th>Mã sản phẩm</th>
													<th>Tên sản phẩm</th>
													<th>Giá</th>
													<th>Số lượng</th>
													<th>Tổng giá</th>
													<th>Xóa sản phẩm</th>
												</tr>
											</thead>
											<tbody>
												<c:set var="saveUrl"
													value="${pageContext.request.contextPath}/shop/shoppingCart" />
												<%-- <c:if
											test="${cartForm != null && cartForm.cartLines != null&& !empty cartForm.cartLines}"> --%>
												<form:form method="POST" modelAttribute="cartForm"
													action="${saveUrl }">

													<div class="product-preview-container">
														<c:forEach items="${cartForm.cartLines}"
															var="cartLineInfo" varStatus="status">
															<tr>
																<td data-th="Image">
																	<div class="row-cart">
																		<div class="col-sm-4 hidden-xs">
																			<img class="product-image" width="60" height="60"
																				src="<c:url value="/uploads/${cartLineInfo.productInfo.productImages}" />">
																		</div>
																	</div>
																</td>
																<td width="10%">${cartLineInfo.productInfo.id}<form:input
																		type="hidden" class="input-small quantity text-center"
																		path="cartLines[${status.index}].productInfo.id"
																		value="${cartLineInfo.productInfo.id}" />
																</td>
																<td>${cartLineInfo.productInfo.productName}</td>
																<td><strong><fmt:formatNumber
																			pattern="#,##0"
																			value="${cartLineInfo.productInfo.newPrice}" />đ</strong></td>
																<td><form:input
																		path="cartLines[${status.index}].quantity"
																		value="${cartLineInfo.quantity}" /></td>
																<td><fmt:formatNumber pattern="#,##0"
																		value="${cartLineInfo.amount}" />đ</td>
																<td><a
																	href="<c:url value='/shop/shoppingCartRemoveProduct?id=${cartLineInfo.productInfo.id}' />">
																		<i class="fas fa-trash-alt"></i>
																</a></td>
														</c:forEach>
													</div>

													<input class="btn btn-primary" type="submit"
														value="Cập nhật số lượng" />

												</form:form>
											</tbody>
										</table>

									</div>
									<div class="row mx-md-n5">
										<div class="p-3">
											<a class="btn btn-primary"
												href="${pageContext.request.contextPath}/shop/">Tiếp tục
												mua</a>
										</div>
										<div class="p-3">
											<a href="<c:url value='/shop/shoppingCartCustomer' />"
												class="btn btn-primary">Mua hàng</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="p-3">
				<div>Giỏ hàng chưa có sản phẩm!!</div>
			</div>
		</c:otherwise>
	</c:choose>
	</div>
	</div>
</body>
</html>