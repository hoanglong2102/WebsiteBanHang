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


</head>


<body>
	<h2>Thông tin hóa đơn</h2>
	<div class="card" style="width: 60rem;">
		<div class="card-body">
			<p class="card-text">
			<h4>Chi tiết khách hàng</h4>
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
			<h4>Tóm lược đơn hàng của bạn</h4>

			<div class="row">
				<div class="col">
					<label>Ngày tạo:</label>
				</div>
				<div class="col">
					<fmt:formatDate type="date" value="${order.orderDate}" />
				</div>
			</div>
			<div class="row">
				<div class="col">
					<label>Trạng thái:</label>
				</div>
				<div class="col">
					<%-- <c:if test="${order.status == 0}">
						<p>
							<spring:message code="admin.order.status.0"></spring:message>
						<p>
					</c:if>
					<c:if test="${order.status == 1}">
						<p>
							<spring:message code="admin.order.status.1"></spring:message>
						<p>
					</c:if>
					<c:if test="${order.status == 2}">
						<p>
							<spring:message code="admin.order.status.2"></spring:message>
						<p>
					</c:if>
					<c:if test="${order.status == 3}">
						<p>
							<spring:message code="admin.order.status.3"></spring:message>
						<p>
					</c:if> --%>
					<c:set var="saveUrl"
						value="${pageContext.request.contextPath}/admin/order/save" />
					<form:form enctype="multipart/form-data" method="POST"
						action="${saveUrl}" modelAttribute="order" id="f1">
						<form:input type="hidden" path="id" id="id" />
						<form:input type="hidden" path="customer" id="customeId" />
						<form:input path="amount" type="hidden" id="amount" />
						<form:input path="orderDate" type="hidden" id="orderDate" />
						<form:input path="totalQuanity" type="hidden" id="totalQuanity" />
						<form:input path="hour" type="hidden" id="Hour" />
						<form:input path="minute" type="hidden" id="totalQuanity" />
						<!-- 		<div class="form-group">
					<div class="form-group"> -->
						<%-- <label><spring:message code="admin.order.status"></spring:message>:
						</label> --%>
						<form:select path="status">
							<c:if test="${order.status==0}">
								<option selected value="0">Đang chờ xử lý</option>
								<option value="1">Đang xử lý</option>
								<option value="2">Đã xử lý</option>
								<option value="3">Đã hủy đơn</option>
							</c:if>

							<c:if test="${order.status==1}">
								<option value="0">Đang chờ xử lý</option>
								<option selected value="1">Đang xử lý</option>
								<option value="2">Đã xử lý</option>
								<option value="3">Đã hủy đơn</option>
							</c:if>
							<c:if test="${order.status==2}">
								<option value="0">Đang chờ xử lý</option>
								<option value="1">Đang xử lý</option>
								<option selected value="2">Đã xử lý</option>
								<option value="3">Đã hủy đơn</option>
							</c:if>
							<c:if test="${order.status==3}">
								<option value="0">Đang chờ xử lý</option>
								<option value="1">Đang xử lý</option>
								<option value="2">Đã xử lý</option>
								<option selected value="3">Đã hủy đơn</option>
							</c:if>
						</form:select>
						<!-- </div> -->
					</form:form>
				</div>
			</div>
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
				<div class="col" style="color: Red">
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

				<tr class="table-info">
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
	<sec:authorize access="hasAnyRole('SUPPER_ADMIN','MANAGER','EMPLOYEE')">
		<div class="card-body">
			<%-- <c:set var="saveUrl"
				value="${pageContext.request.contextPath}/admin/order/save" />
			<form:form enctype="multipart/form-data" method="POST"
				action="${saveUrl}" modelAttribute="order" id="f1">
				<form:input type="hidden" path="id" id="id" />
				<form:input type="hidden" path="customer" id="customeId" />
				<form:input path="amount" type="hidden" id="amount" />
				<form:input path="orderDate" type="hidden" id="orderDate" />
				<form:input path="totalQuanity" type="hidden" id="totalQuanity" />
				<form:input path="hour" type="hidden" id="Hour" />
				<form:input path="minute" type="hidden" id="totalQuanity" />
				<div class="form-group">
					<div class="form-group">
						<label><spring:message code="admin.order.status"></spring:message>:
						</label>
						<form:select path="status">
							<c:if test="${order.status==0}">
								<option selected value="0"><spring:message
										code="admin.order.status.0"></spring:message></option>
								<option value="1"><spring:message
										code="admin.order.status.1"></spring:message></option>
								<option value="2"><spring:message
										code="admin.order.status.2"></spring:message></option>
								<option value="3"><spring:message
										code="admin.order.status.3"></spring:message></option>
							</c:if>

							<c:if test="${order.status==1}">
								<option value="0"><spring:message
										code="admin.order.status.0"></spring:message></option>
								<option selected value="1"><spring:message
										code="admin.order.status.1"></spring:message></option>
								<option value="2"><spring:message
										code="admin.order.status.2"></spring:message></option>
								<option value="3"><spring:message
										code="admin.order.status.3"></spring:message></option>
							</c:if>
							<c:if test="${order.status==2}">
								<option value="0"><spring:message
										code="admin.order.status.0"></spring:message></option>
								<option value="1"><spring:message
										code="admin.order.status.1"></spring:message></option>
								<option selected value="2"><spring:message
										code="admin.order.status.2"></spring:message></option>
								<option value="3"><spring:message
										code="admin.order.status.3"></spring:message></option>
							</c:if>
							<c:if test="${order.status==3}">
								<option value="0"><spring:message
										code="admin.order.status.0"></spring:message></option>
								<option value="1">Đang xử lý</option>
								<option value="2"><spring:message
										code="admin.order.status.2"></spring:message></option>
								<option selected value="3"><spring:message
										code="admin.order.status.3"></spring:message></option>
							</c:if>
						</form:select>
					</div>
				</form:form> --%>
			<div class="btn-group">
				<button type="submit" class="btn btn-primary" value="Save" form="f1">
					<i class="fas fa-save"></i> Lưu
				</button>
				<a href="/admin/order/print/${order.id}?mode=EDIT"
					class="btn btn-secondary"> <i class="fas fa-print"></i> In hóa
					đơn
				</a> <a href="/admin/order/" class="btn btn-info"><i
					class="fas fa-undo"></i> Quay lại</a>
			</div>

		</div>
	</sec:authorize>

	<%-- <sec:authorize access="hasAnyRole('SUPPER_ADMIN')">
		<div class="btn-group">

			<a href="/admin/order/print/${order.id}?mode=EDIT"
				class="btn btn-secondary"> <i class="fas fa-print"></i> In hóa đơn
			</a> <a href="/admin/order/" class="btn btn-info"><i
				class="fas fa-undo"></i> Quay lại</a>

		</div>
	</sec:authorize> --%>

</body>
</html>