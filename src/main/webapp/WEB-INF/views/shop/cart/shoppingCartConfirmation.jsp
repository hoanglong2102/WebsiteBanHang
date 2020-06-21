<%@ taglib prefix="Spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>Insert title here</title>
</head>
<body>
	<div class="entry-header-area ptb-40">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="entry-header">
						<h1 class="entry-title">Xác nhận đơn hàng</h1>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="customer-info-container" border="1";>
		<div class="card" style="width: 40rem;">

			<div class="card-body">
				<p class="card-text">
					<strong>Thông tin khách hàng:</strong>
				<div class="row">
					<div class="col">
						<label>Tên khách hàng:</label>
					</div>
					<div class="col">${myCart.customerInfo.firstName}
						${myCart.customerInfo.lastName}</div>
				</div>
				<div class="row">
					<div class="col">
						<label>Địa chỉ:</label>

					</div>
					<div class="col">${myCart.customerInfo.street},
						${myCart.customerInfo.district} , ${myCart.customerInfo.city}</div>
				</div>

				<div class="row">
					<div class="col">
						<label>Số điện thoại liên hệ:</label>

					</div>
					<div class="col">${myCart.customerInfo.numberPhone}</div>
				</div>
				<div class="row">
					<div class="col">
						<label>Email:</label>

					</div>
					<div class="col">${myCart.customerInfo.email}</div>
				</div>
				<strong>Tóm tắt giỏ hàng:</strong>
				
				<div class="row">
					<div class="col">
						<label>Tổng Số lượng: </label>

					</div>
					<div class="col">${myCart.quantityTotal}</div>
				</div>
				<div class="row">
					<div class="col">
						<label> Tổng giá hóa đơn: </label>

					</div>
					<div class="col"><strong> <fmt:formatNumber pattern="#,##0" value="${myCart.amountTotal}" var="formattedAmountTotal" />
						<c:out value="${formattedAmountTotal}"></c:out> đ </strong></div>
				</div>

				</p>

			</div>
		</div>
<br>
		<div class="table-responsive" >

			<table class="table table-striped table-sm" border="1";>
				<thead>

					<tr>
						<th>Hình ảnh</th>
						<th>Tên sản phẩm</th>
						<th>Số lượng</th>
						<th>Giá</th>
						<th>Tổng giá</th>
					</tr>
				<tbody>

					<c:forEach items="${myCart.cartLines}" var="cartLineInfo">
						<tr>

							<td><img class="product-image" width="60" height="60"
								src="<c:url value="/uploads/${cartLineInfo.productInfo.productImages}" />" /></td>
							<td>${cartLineInfo.productInfo.productName}</td>
							<td>${cartLineInfo.quantity}</td>
							<td><span class="price"> <fmt:formatNumber pattern="#,##0"
										value="${cartLineInfo.productInfo.newPrice}"
										/>đ
							</span></td>
							<td><span class="subtotal"> <fmt:formatNumber pattern="#,##0"
										value="${cartLineInfo.amount}"  />đ
							</span></td>

						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>

		<form method="POST"
			action="${pageContext.request.contextPath}/shop/shoppingCartConfirmation">

			<!-- Edit Cart -->
			
				<a class="btn btn-primary"
					href="${pageContext.request.contextPath}/shop/shoppingCart" >Cập nhật giỏ hàng</a>
			

			<!-- Edit Customer Info -->
			
				<a class="btn btn-secondary" 
					href="${pageContext.request.contextPath}/shop/shoppingCartCustomer" >Cập nhật thông tin người đặt hàng</a>
			

			<!-- Send/Save -->
			<input type="submit" value="Đặt hàng" class="btn btn-primary" />
		</form>


		<%-- 	  <div class="container">
	 
	      <c:forEach items="${myCart.cartLines}" var="cartLineInfo">
	          <div class="product-preview-container">
	              <ul>
	                  <li><img class="product-image"
	                      src="<c:url value="/uploads/${cartLineInfo.productInfo.productImages}" />" /></li>
	                  <li>Code: ${cartLineInfo.productInfo.id} <input
	                      type="hidden" name="code" value="${cartLineInfo.productInfo.id}" />
	                  </li>
	                  <li>Name: ${cartLineInfo.productInfo.productName}</li>
	                  <li>Price: <span class="price">
	                     <fmt:formatNumber value="${cartLineInfo.productInfo.productPrice}" type="currency"/>
	                  </span>
	                  </li>
	                  <li>Quantity: ${cartLineInfo.quantity}</li>
	                  <li>Subtotal:
	                    <span class="subtotal">
	                       <fmt:formatNumber value="${cartLineInfo.amount}" type="currency"/>
	                    </span>
	                  </li>
	              </ul>
	          </div>
	      </c:forEach>
	 
	  </div> --%>
</body>
</html>