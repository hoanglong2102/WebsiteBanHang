<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- //dinh dang sô -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>Thông tin hóa đơn</title>
<link rel='stylesheet prefetch'
	href='https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'>
<link href="<c:url value="/resources/css/print.css" />" rel="stylesheet">


</head>


<body onload="window.print();">
	<div id="page" class="page">
		<div class="header">
			<div class="logo">
				<img src="<c:url value="/uploads/Capture1.PNG" />" height="130"
					width="200">
			</div>
			<div class="company">
				CỬA HÀNG CÔNG NGHỆ <br>
				<div>
					<i class="fas fa-map-marker-alt"></i> Đia chỉ: 371 Nguyễn Kiệm,
					Phường 3, Quận Gò Vấp, TP.HCM
				</div>
				<div>
					<i class="far fa-envelope"></i> Email: cuahangcongnghe@gmail.com
				</div>
				<div>
					<i class="fas fa-phone"></i> Liên hệ: 0898154710
				</div>
			</div>
		</div>
		<br />
		<div class="title" style="color: black">
			HÓA ĐƠN THANH TOÁN <br /> -------oOo-------
		</div>
		<br /> <br />
		<div class="card">
			<div class="card-body">
				<p class="card-text">
				<h5>
					<strong>Thông tin khách hàng:</strong>
				</h5>
				<div class="row">
					<div class="col">
						<label> Tên:</label>

					</div>
					<div class="col">${order.customer.firstName} 
						${order.customer.lastName}</div>
				</div>
				<div class="row">
					<div class="col">
						<label>Địa chỉ:</label>
					</div>
					<div class="col">${order.customer.street},
						${order.customer.district}, ${order.customer.city}</div>
				</div>

				<div class="row">
					<div class="col">
						<label>SĐT:</label>

					</div>
					<div class="col">${order.customer.numberPhone}</div>
				</div>
				<div class="row">
					<div class="col">
						<label>Email:</label>

					</div>
					<div class="col">${order.customer.email}</div>
				</div>
				<h5>
					<strong>Tóm lược đơn hàng của bạn:</strong>
				</h5>

				<%-- <div class="row">
				<div class="col">
					<label>Ngày tạo:</label>
				</div>
				<div class="col">
					<fmt:formatDate type="date" value="${order.orderDate}" />
				</div>
			</div> --%>
				<%-- <div class="row">
				<div class="col">
					<label>Trạng thái:</label>
				</div>
				<div class="col">
					<c:if test="${order.status == 0}">
						<p>
							<c:out value="Đang chờ xử lý" />
						<p>
					</c:if>
					<c:if test="${order.status == 1}">
						<p>
							<c:out value="Đang xử lý" />
						<p>
					</c:if>
					<c:if test="${order.status == 2}">
						<p>
							<c:out value="Đã xử lý" />
						<p>
					</c:if>
				</div>
			</div> --%>
				<div class="row">
					<div class="col">
						<label>Tổng số lượng sản phẩm: </label>

					</div>
					<div class="col">
						<strong>${order.totalQuanity}</strong>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<label> Tổng giá phải trả: </label>
					</div>
					<div class="col">
						<strong> <fmt:formatNumber pattern="#,##0"
								value="${order.amount}" var="formattedAmount" /> <c:out
								value="${formattedAmount}"></c:out> đ
						</strong>
					</div>
				</div>
			</div>
		</div>

		<br>
		<div class="table-responsive">

			<table class="table table-striped table-sm" border="1";>
				<thead>

					<tr>
						<th style="text-align: center">Hình Ảnh</th>
						<th style="text-align: center">Mã sản phẩm</th>
						<th>Tên sản phẩm</th>
						<th style="text-align: center">Số lượng</th>
						<th style="text-align: center">Đơn giá</th>
						<th style="text-align: center">Tổng giá</th>
					</tr>
				<tbody>

					<c:forEach items="${orderDetailList}" var="orderDetail">
						<tr style="font-size: 15px;">
							<td style="text-align: center"><img
							src="<c:url value="/uploads/${orderDetail.product.productImages}" />"
							height="60" width="60"></td>
							<td style="vertical-align: middle; text-align: center">${orderDetail.product.productCode}</td>
							<td style="vertical-align: middle">${orderDetail.product.productName}</td>
							<td style="vertical-align: middle; text-align: center">${orderDetail.quanity}</td>
							<td style="vertical-align: middle; text-align: center"><fmt:formatNumber
									pattern="#,##0" value="${orderDetail.price}"
									var="formattedPrice" /> <c:out value="${formattedPrice}"></c:out>
								đ</td>
							<td style="vertical-align: middle; text-align: center"><fmt:formatNumber
									pattern="#,##0" value="${orderDetail.totalPrice}"
									var="formattedTotalPrice" /> <c:out
									value="${formattedTotalPrice}"></c:out> đ</td>


						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
		<div class="footer-left">
			..., ngày ... tháng ... năm 2020<br /> Khách hàng
		</div>
		<div class="footer-right">
			..., ngày ... tháng ... năm 2020<br /> Nhân viên
		</div>
	</div>
</body>
</html>