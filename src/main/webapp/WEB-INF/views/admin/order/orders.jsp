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
<script language="javascript" src="/resources/js/order.js"></script>
<script src="http://momentjs.com/downloads/moment-with-locales.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>
<script src="http://momentjs.com/downloads/moment-timezone-with-data.js">
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Tất cả hóa đơnr</title>

<script>
	$(document).ready(function() {
		$("input[value='hien']").click(function() {
			$("#div1").show();
			$("#div2").hide();
		})
		$("input[value='an']").click(function() {
			$("#div1").hide();
			$("#div2").show();
		})
	})
</script>
<script>
	$(document).ready(function() {
		$('#div2').hide();
	})
</script>
</head>


<body>
	<center>
		<h2>Danh sách hóa đơn</h2>
	</center>

	<p>
		<input type="radio" name="abc" value="hien" checked> Tìm kiếm
		theo ngày bắt đầu và ngày kết thúc
	</p>
	<p>
		<input type="radio" name="abc" value="an"> Tìm kiếm theo ngày
		và giờ
	</p>
	<div class="container">
		<form method="POST" action="searchByFromDateAndToDate">
			<div class="form-group row" id="div1">
				<label for="fromDate" class="col-xs-2 col-form-label"><b><i>Tìm
							kiếm từ</i></b></label>
				<div class="col-sm-2">
					<input type="date" class="form-control" name="fromDate"
						id="fromDate" placeholder="fromDate" required>
				</div>

				<label for="toDate" class="col-xs-2 col-form-label"> <b><i>đến</i></b>
				</label>
				<div class="col-sm-2">
					<input type="date" class="form-control" name="toDate" id="toDate"
						placeholder="toDate" required>
				</div>

				<div class="col-sm-2">
					<button type="submit" class="btn btn-primary">
						<i class="fas fa-search" width="auto"></i> Tìm kiếm
					</button>
				</div>
			</div>
		</form>
	</div>
	<div class="container">
		<!-- 	<div class="col-sm-1"></div> -->
		<form method="POST" action="searchOrderByDatesAndTime">

			<div class="form-group row" id="div2">
				<label for="Hour" class="col-xs-1 col-form-label"><b><i>Ngày</i></b></label>
				<div class="col-sm-2">
					<input type="date" class="form-control" name="Date" id="Date"
						placeholder="Date" required>
				</div>

				<label for="Hour" class="col-xs-1 col-form-label"><b><i>Giờ</i></b></label>
				<div class="col-sm-1">
					<input type="number" class="form-control" name="Hour" min="0"
						max="24" id="Hour" required>
				</div>
				<label for="Minute" class="col-xs-1 col-form-label"><b><i>Phút</i></b></label>
				<div class="col-sm-1">
					<input type="number" class="form-control" name="Minute" min="0"
						max="59" id="Minute" required>
				</div>

				<div class="col-sm-2">
					<button type="submit" class="btn btn-primary">
						<i class="fas fa-search" width="auto"></i> Tìm kiếm
					</button>
				</div>
			</div>
		</form>


	</div>


	<div class="table-responsive">
		<table class="table table-striped table-sm table-hover">
			<thead>
				<tr class="table-info">
					<th style="text-align: center">Xem</th>
					<th style="text-align: center">Mã</th>
					<th>Tên</th>
					<th>Ngày tạo</th>
					<th>Địa chỉ</th>
					<th>Email</th>
					<th>Tổng tiền</th>
					<th>Trạng thái</th>
					<%-- <sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')"> --%>
					<sec:authorize
						access="hasAnyRole('SUPPER_ADMIN','MANAGER','EMPLOYEE')">
						<th>Sửa</th>
					</sec:authorize>
					<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
						<th style="text-align: center">Xóa</th>
					</sec:authorize>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orders.getContent()}" var="order">
					<tr>
						<td style="text-align: center"><a
							href="<c:url value='/admin/order/getOrder/${order.id}?mode=VIEW' />"><i
								class="fas fa-eye"></i></a></td>
						<td style="text-align: center">${order.id }</td>
						<td>${order.customer.firstName} ${order.customer.lastName}</td>
						<td><fmt:formatDate type="date" value="${order.orderDate}" /></td>
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
								<p>Đang chờ xử lý
								<p>
							</c:if> <c:if test="${order.status == 1}">
								<p>Đang xử lý
								<p>
							</c:if> <c:if test="${order.status == 2}">
								<p>Đã xử lý
								<p>
							</c:if> <c:if test="${order.status == 3}">
								<p>Đã hủy đơn
								<p>
							</c:if></td>

						<sec:authorize
							access="hasAnyRole('SUPPER_ADMIN','MANAGER','EMPLOYEE')">

							<td style="text-align: center"><a
								href="<c:url value='/admin/order/getOrder/${order.id}?mode=EDIT' />"><i
									class="far fa-edit"></a></td>
						</sec:authorize>
						<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
							<td style="text-align: center"><a
								href="<c:url value='/admin/order/deleteOrder/${order.id}' />">
									<i class="fas fa-trash-alt"></i>
							</a></td>
						</sec:authorize>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>
	<c:if test="${orders.totalPages > 0}">
		<util:pagination currentPage="${currentPage}" filter="${filter}"
			showPageTitle="Hóa đơn / Trang" thispage="${orders}"></util:pagination>
	</c:if>
	<br />
</body>
</html>