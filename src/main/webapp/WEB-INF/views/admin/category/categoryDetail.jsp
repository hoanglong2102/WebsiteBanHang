<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Thông tin danh mục</title>


</head>


<body>

	<div class="card" style="width: 40rem;">
		<div class="card-body">
			<p class="card-text">
			<div class="row">
			<div class="col">
					<label>Tên danh mục: </label>

				</div>
				<div class="col">${category.categoryName}
				</div>
			</div><div class="row">
			<div class="col">
					<label>Biểu tượng danh mục: </label>

				</div>
				<div class="col">${category.categoryImages}
				</div>
			</div>
				
		
			
			</p>
		</div>
	</div>
		<div class="p-3">
		<div class="btn-group">
			<a
				href="<c:url value='/admin/category/getCategory/${category.categoryCode}?mode=EDIT' />"
				class="btn btn-primary"><i class="far fa-edit">Cập nhật</i></a>
		
		<div type="reset" class="btn btn-light" value="Reset">
						<a href="/admin/category/"><i class="fas fa-undo">Trở lại</i> </a>
					</div>
	</div>
	</div>

</body>
</html>