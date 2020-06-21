<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cập nhật sách</title>

</head>


<body>
	<c:if test="${not empty errorMessage }">
		<div class="alert alert-danger" role="alert">${errorMessage }</div>
	</c:if>

	<div class="card" style="width: 40rem;">
		<h2 class="card-title">
			<c:if test="${mode == 'ADD'}">
			Thêm sản phẩm
		</c:if>
			<c:if test="${mode == 'EDIT'}">
			Cập nhật sách
		</c:if>

		</h2>

		<div class="card-body">
			<c:set var="saveUrl"
				value="${pageContext.request.contextPath}/admin/product/save" />
			<form:form enctype="multipart/form-data" method="POST"
				action="${saveUrl}" modelAttribute="product">
				<form:input type="hidden" path="productCode" id="productCode" />
				<form:input type="hidden" path="productImages" />
				<div class="form-group">
					<label for="productName">Tên sản phẩm:</label>
					<form:input path="productName" type="text" class="form-control"
						id="productName" />
				</div>
				<div class="form-group">
					<label for=discount>Giảm giá: </label>
					<form:input path="discount" type="number" class="form-control"
						id="discount" />
				</div>
				<div class="form-group">
					<label for="oldPrice">Giá : </label>
					<form:input path="oldPrice" type="number" class="form-control"
						id="oldPrice" />
				</div>
				<div class="form-group">
					<label for="productNumber">Số lượng : </label>
					<form:input path="productNumber" type="number" class="form-control"
						id="productNumber" />
				</div>
				<div class="form-group">
					<label for="yearManufactured">Năm sản xuất : </label>

					<form:input path="yearManufactured" type="text"
						class="form-control" pattern="((20)+([0-9]{2})\\b)"
						title="Năm không chỉ được 4 chữ số!" id="yearManufactured" />
				</div>

				<c:if test="${mode == 'EDIT'}">
					<div class="form-group">
						<label for="newPrice">Giá mới: </label>
						<form:input readonly="true" path="newPrice" type="text"
							class="form-control" id="newPrice" />
					</div>
				</c:if>
				<div class="form-group">
					<label for="imageFile">Hình ảnh: </label> <img
						src="<c:url value="/uploads/${product.productImages}" />"
						height="200" width="200" />
					<form:input path="imageFile" class="form-control" id="imageFile"
						name="imageFile" type="file" />
				</div>
				<div class="form-group">
					<label for="description">Mô tả: </label>
					<form:textarea path="description" type="text" class="form-control"
						id="description" row="3" />
				</div>
				<div class="form-group">
					<label for="categories" style="margin-right: 20px;">Loại
						danh mục: </label>
					<form:select multiple="true" path="categoryIds">
						<c:forEach items="${allCategory}" var="category">
							<c:set var="iselected" value="false" />
							<c:forEach items="${product.categories }" var="c">
								<c:if test="${category.categoryCode == c.categoryCode }">
									<c:set var="iselected" value="true" />
									<form:option selected="selected"
										value="${category.categoryCode}">${category.categoryName}</form:option>
								</c:if>


							</c:forEach>

							<c:if test="${iselected == false }">
								<form:option value="${category.categoryCode}">${category.categoryName}</form:option>
							</c:if>
						</c:forEach>

					</form:select>
				</div>

				<div class="form-group">
					<label for="manufacturer">Chọn nhà sản xuất: </label>
					<form:select path="manufacturer" class="input_information">
						<c:forEach items="${allManufacturers}" var="manufacturer">
							<form:option value="${manufacturer.id}">${manufacturer.manufacturerName}</form:option>

						</c:forEach>

					</form:select>
				</div>
				<button type="submit" class="btn btn-primary">Lưu</button>
			</form:form>
		</div>
	</div>
</body>
</html>