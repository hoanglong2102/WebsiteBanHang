<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="util"%>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Search Order</title>


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

	<br>
	<!-- <p>
		<input type="radio" name="abc" value="hien" checked> Tìm kiếm
		theo ngày bắt đầu và ngày kết thúc
	</p>
	<p> -->
	<%-- 	<input type="radio" name="abc" value="an"> Tìm kiếm theo ngày
		giờ
	</p>
	<div class="container">
		<!-- 		<div class="col-sm-1"></div> -->
		<form method="POST" action="searchByFromDateAndToDate">
			<div class="form-group row" id="div1">
				<label for="fromDate" class="col-xs-2 col-form-label"><b><i>Tìm
							kiếm từ</i></b></label>
				<div class="col-sm-2">
					<input type="date" class="form-control" name="fromDate"
						id="fromDate" placeholder="fromDate">
				</div>

				<label for="toDate" class="col-xs-2 col-form-label"> <b><i>đến</i></b>
				</label>
				<div class="col-sm-2">
					<input type="date" class="form-control" name="toDate" id="toDate"
						placeholder="toDate">
				</div>

				<div class="btn-group">
					<button type="submit" class="btn btn-primary">
						<i class="fas fa-search" width="auto"></i> Tìm kiếm
					</button>
					<button type="reset" class="btn btn-light" value="Reset">
						<a href="/admin/order/"><i class="fas fa-undo"></i> Trở lại</a>
					</button>
				</div>
			</div>
		</form>
	</div> --%>

	<center>
		<div>
			Kết quả tìm kiếm cho ngày <strong>${Date} |
				${Hour}:${Minute} </strong> - có ${size} kết quả tìm kiếm được

			<button type="reset" class="btn btn-light" value="Reset">
				<a href="/admin/order/"><i class="fas fa-undo"></i> Quay lại</a>
			</button>
		</div>
	</center>
	<div class="container">
		<!-- 	<div class="col-sm-1"></div> -->
		<form method="POST" action="searchOrderByDatesAndTime">

			<div class="form-group row" id="div2">
				<label for="Hour" class="col-xs-1 col-form-label"><b><i>Ngày</i></b></label>
				<div class="col-sm-2">
					<input type="date" class="form-control" name="Date" id="Date"
						placeholder="Date">
				</div>

				<label for="Hour" class="col-xs-1 col-form-label"><b><i>Giờ</i></b></label>
				<div class="col-sm-1">
					<input type="number" class="form-control" name="Hour" min="0"
						max="24" id="Hour">
				</div>
				<label for="Minute" class="col-xs-1 col-form-label"><b><i>Phút</i></b></label>
				<div class="col-sm-1">
					<input type="number" class="form-control" name="Minute" min="0"
						max="59" id="Minute">
				</div>

				<div class="btn-group">
					<button type="submit" class="btn btn-primary">
						<i class="fas fa-search" width="auto"></i> Tìm kiếm
					</button>
					<button type="reset" class="btn btn-light" value="Reset">
						<a href="/admin/order/"><i class="fas fa-undo"></i> Trở lại</a>
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
					<th style="text-align: center">Mã KH</th>
					<th>Tên</th>
					<th>Ngày tạo</th>
					<th>Địa chỉ</th>
					<th>Email</th>
					<th>Tổng tiền</th>
					<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER','EMPLOYEE')">
						<th>Trạng thái</th>
						<th>Sửa</th>
						</sec:authorize>
						<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER')">
						<th style="text-align: center">Xóa</th>
					</sec:authorize>
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

						<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER','EMPLOYEE')">
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
								</c:if></td>
							</sec:authorize>
								<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER','EMPLOYEE')">
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

	<br />
	<br />

</body>
</html>