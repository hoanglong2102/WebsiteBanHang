<%@ taglib prefix="Spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

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
						<h1 class="entry-title">Đã nhận đơn hàng</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="checkout-area pb-50">
		<div class="container">
			<h3>Cảm ơn đã đặt hàng</h3>
			Số đơn hàng của bạn là: ${lastOrderedCart.orderNum}
		</div>
	</div>
	<div class="row">
		<div class="wc-proceed-to-checkout">
			<div class="buttons-cart">
				<a class="" href="${pageContext.request.contextPath}/shop/">Tiếp
					tục mua</a>
			</div>
		</div>
	</div>
</body>
</html>