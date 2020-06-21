<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="entry-header-area ptb-40">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="entry-header">
						<h1 class="entry-title">Thông tin người đặt hàng</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="checkout-area pb-50">
		<div class="container">
			<div class="row">
				<!-- If error messages -->
				<div id="checkoutError" class=""></div>
				<!--alert-error-->
				<c:if test="${not empty errorMessage }">
					<div class="alert alert-danger" role="alert">${errorMessage }
					</div>
				</c:if>

				<c:set var="saveUrl"
					value="${pageContext.request.contextPath}/shop/shoppingCartCustomer" />
				<form:form action="${saveUrl }" method="POST"
					modelAttribute="customerInfo">
					<input type="hidden" id="useDistanceWindow"
						name="useDistanceWindow" value="false">
					<div class="col-lg-6 col-md-6">
						<div class="checkout-form">

							<div class="row">
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>Họ<span class="required">*</span></label>
										<form:input path="firstName" id="customer.firstName"
											name="customer.billing.firstName" class="required"
											title="Nhập họ của bạn" autofocus="autofocus" type="text"
											value="" maxlength="32" />
										<span id="error-customer.billing.lastName" class="error"></span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>Tên<span class="required">*</span></label>
										<form:input path="lastName" id="customer.lastName"
											name="customer.billing.lastName" class="required"
											title="Nhập tên của bạn" autofocus="autofocus" type="text"
											value="" />
										<span id="error-customer.billing.lastName" class="error"></span>
									</div>
								</div>

								<div class="col-md-12">
									<div class="checkout-form-list">
										<label>Đường<span class="required">*</span></label>
										<form:input path="street" id="customer.billing.street"
											name="customer.billing.street" class="required"
											title="Nhập đường của bạn" autofocus="autofocus" type="text"
											value="" />
										<span id="error-customer.billing.street" class="error"></span>
									</div>
								</div>
								<div class="col-md-12">
									<div class="checkout-form-list">
										<label>Huyện/Quận<span class="required">*</span></label>
										<form:input path="district" id="customer.billing.district"
											name="customer.billing.district" class="required"
											title="Nhập huyện/quận của bạn" autofocus="autofocus"
											type="text" value="" />
										<span id="error-customer.billing.district" class="error"></span>
									</div>
								</div>
								<div class="col-md-12">
									<div class="checkout-form-list">
										<label>Tỉnh/Thành phố<span class="required">*</span></label>
										<form:input path="city" id="customer.billing.city"
											name="customer.billing.city" class="required"
											title="Nhập tỉnh/thành phố của bạn" autofocus="autofocus"
											type="text" value="" />
										<span id="error-customer.billing.city" class="error"></span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>Email<span class="required">*</span></label>
										<form:input path="email" id="customer.emailAddress"
											name="customer.emailAddress" class="required"
											pattern="^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
											title="Email không đúng chuẩn!" autofocus="autofocus"
											type="text" value="" />
										<span id="error-customer.emailAddress" class="error"></span>
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>Số điện thoại <span class="required">*</span></label>
										<form:input path="numberPhone" id="customer.billing.phone"
											name="customer.billing.phone" class="required"
											pattern="[0-9]{6,11}"
											title="Sô điện không hợp lệ hoặc sô điện thoại phải có từ 6 đến 11 chữ số"
											autofocus="autofocus" type="text" value="" />
										<span id="error-customer.billing.phone" class="error"></span>
									</div>
								</div>

								<div class="col-md-6">
									<div class="checkout-form-list">
										<button id="submitOrder" type="submit" class="btn btn-primary">Tạo
											hóa đơn</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form:form>
			</div>

		</div>
	</div>

</body>
</html>