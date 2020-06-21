<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Tất cả hóa đơnr</title>

</head>


<body>
	<h2>Danh sách Hóa Đơn</h2>
	<div class="row">
		<div class="col-sm-1">
		</div>
		<div class="form-group row">
			<form method="POST" action="searchOrderByDate">

				<div class="form-group row">
					<label for="inputPassword" class="col-xs-2 col-form-label">Tìm
						kiếm từ</label>
					<div class="col-sm-4">
						<input type="date" class="form-control" name="fromDate"
							id="inputPassword" placeholder="Password">
					</div>

					<label for="inputPassword" class="col-xs-2 col-form-label">
						đến</label>
					<div class="col-sm-4">
						<input type="date" class="form-control" name="toDate"
							id="inputPassword" placeholder="Password">
					</div>


					<div class="col-sm-2">
						<button type="submit" class="btn btn-primary">
							<i class="fas fa-search" width="auto"></i> Tìm kiếm
						</button>
					</div>
				</div>
			</form>

			<%-- <form method="POST" action="searchOrderByName">
				<div class="row">
					<div>
						<input class="form-control" type="text" name="name"
							placeholder="Nhập tên tìm kiếm" aria-label="Search">
					</div>
					<div class="col-sm-1">
						<button type="submit" class="btn btn-primary">
							<i class="fas fa-search" width="auto"></i> Tìm kiếm
						</button>
					</div>
				</div>
			</form> --%>
		</div>

	</div>

	<c:choose>
		<c:when test="${ketqua}">
			<div class="table-responsive">
				<table class="table table-striped table-sm table-hover">
					<thead>
						<tr class="table-info">
							<th style="text-align: center">Xem</th>
							<th style="text-align: center">Mã KH</th>
							<th>Tên</th>
							<th>Ngày tạo</th>
							<th>Địa chỉ</th>
							<th>Email</th>
							<th>Tổng tiền</th>
							<th>Trạng thái</th>
							<th>Sửa</th>
							<th style="text-align: center">Xóa</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orders}" var="order">
							<tr>
								<td style="text-align: center"><a
									href="<c:url value='/admin/order/getOrder/${order.id}?mode=VIEW' />"><i
										class="fas fa-eye"></i></a></td>
								<td style="text-align: center">${order.customer.id }</td>
								<td>${order.customer.firstName}${order.customer.lastName}</td>
								<td>${order.orderDate}</td>
								<td>${order.customer.street},${order.customer.district},
									${order.customer.city}</td>
								<td>${order.customer.email}</td>
								<%-- <td style="color: Red"><strong>${order.amount} đ</strong></td> --%>
								<td style="color: Red"><strong> <fmt:formatNumber
											pattern="#,##0" value="${order.amount}" var="formattedAmount" />
										<c:out value="${formattedAmount}"></c:out> đ
								</strong></td>

								<%-- <td>${order.status}</td> --%>
								<td><c:if test="${order.status == 0}">
										<p>
											<c:out value="Đang chờ xử lý" />
										<p>
									</c:if> <c:if test="${order.status == 1}">
										<p>
											<c:out value="Đang xử lý" />
										<p>
									</c:if> <c:if test="${order.status == 2}">
										<p>
											<c:out value="Đã xử lý" />
										<p>
									</c:if>
									<c:if test="${order.status == 3}">
										<p>
											<c:out value="Đã hủy đơn" />
										<p>
									</c:if></td>
								<td style="text-align: center"><a
									href="<c:url value='/admin/order/getOrder/${order.id}?mode=EDIT' />"><i
										class="far fa-edit"></a></td>
								<td style="text-align: center"><a
									href="<c:url value='/admin/order/deleteOrder/${order.id}' />">
										<i class="fas fa-trash-alt"></i>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
		</c:when>
		
	</c:choose>
	<br />
	<br />

</body>
</html>