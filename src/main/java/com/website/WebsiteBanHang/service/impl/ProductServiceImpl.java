package com.website.WebsiteBanHang.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.website.WebsiteBanHang.entities.Product;
import com.website.WebsiteBanHang.repository.ProductPagingAndSortingRepository;
import com.website.WebsiteBanHang.repository.ProductRepository;
import com.website.WebsiteBanHang.service.ProductService;

@Transactional
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private CategoryServiceImpl categoryService;
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private ProductPagingAndSortingRepository productPagingAndSortingRepository;

	public Product getProduct(Long id) {
		Product product = productRepository.getOne(id);
		return product;
	}

	public List<Product> getAll() {
		return this.productRepository.findAll();

	}

	public String add(Product product) {
		String errorMessage = "";
		if (product.getProductName().isEmpty()) {
			errorMessage = "Vui lòng nhập tên sản phẩm!";

			return errorMessage;
		}
		if (product.getDiscount() == null) {
			errorMessage = "Vui lòng nhập phầm trăm giảm giá!";

			return errorMessage;
		}
		if (product.getDiscount() < 0) {
			errorMessage = "Vui lòng nhập phầm trăm giảm giá không được âm!";

			return errorMessage;
		}
		if (product.getOldPrice() == null) {
			errorMessage = "Vui lòng nhập giá cũ!";

			return errorMessage;
		}
		if (product.getOldPrice() < 0) {
			errorMessage = "Giá cũ không được nhỏ hơn 0!";

			return errorMessage;
		}
		if (product.getProductNumber() == null) {
			errorMessage = "Vui lòng nhập số lượng!";

			return errorMessage;
		}
		if (product.getProductNumber() < 0) {
			errorMessage = "Vui lòng nhập số lượng không được nhỏ hơn 0!";

			return errorMessage;
		}
		if (product.getYearManufactured() == null) {
			errorMessage = "Vui lòng nhập năm sản xuất!";

			return errorMessage;
		}

		if (product.getProductImages() == null || product.getProductImages().isEmpty()) {
			errorMessage = "Vui lòng chọn hình ảnh!";

			return errorMessage;
		}
		if (product.getDescription().isEmpty()) {
			errorMessage = "Vui lòng nhập mô tả!";

			return errorMessage;
		}
		if (product.getCategories().isEmpty()) {
			errorMessage = "Vui lòng chọn danh mục!";

			return errorMessage;
		}

		product.setCreated(new Date());
		this.productRepository.save(product);

		return null;
	}

	public String update(Product product) {
		String errorMessage = "";
		if (product.getProductName().isEmpty()) {
			errorMessage = "Vui lòng nhập tên sản phẩm!";

			return errorMessage;
		}
		if (product.getDiscount() == null) {
			errorMessage = "Vui lòng nhập phầm trăm giảm giá!";

			return errorMessage;
		}
		if (product.getDiscount() < 0) {
			errorMessage = "Vui lòng nhập phầm trăm giảm giá không được âm!";

			return errorMessage;
		}
		if (product.getOldPrice() == null) {
			errorMessage = "Vui lòng nhập giá cũ!";

			return errorMessage;
		}
		if (product.getOldPrice() < 0) {
			errorMessage = "Giá cũ không được nhỏ hơn 0!";

			return errorMessage;
		}
		if (product.getProductNumber() == null) {
			errorMessage = "Vui lòng nhập số lượng!";

			return errorMessage;
		}
		if (product.getProductNumber() < 0) {
			errorMessage = "Vui lòng nhập số lượng không được nhỏ hơn 0!";

			return errorMessage;
		}

		if (product.getProductImages() == null || product.getProductImages().isEmpty()) {
			errorMessage = "Vui lòng chọn hình ảnh!";

			return errorMessage;
		}
		if (product.getDescription().isEmpty()) {
			errorMessage = "Vui lòng nhập mô tả!";

			return errorMessage;
		}
		if (product.getYearManufactured() == null) {
			errorMessage = "Vui lòng nhập năm sản xuất!";

			return errorMessage;
		}

		if (product.getCategories().isEmpty()) {
			errorMessage = "Vui lòng chọn danh mục!";

			return errorMessage;
		}

		product.setCreated(new Date());
		this.productRepository.save(product);

		return null;
	}

	public void delete(Product product) {
		productRepository.delete(product);
	}

	public void delete(Long id) {
		Product product = productRepository.getOne(id);
		productRepository.delete(product);
	}

	public List<Product> getFindProduct(String productName) {
		return productRepository.getFindProduct(productName);
	}

	public List<Product> getAllByProduct(Pageable pageable) {
		return productRepository.getAllByProduct(pageable);
	}

	@Override
	public List<Product> getAllProductByCategory(Long id) {
		return productRepository.findByCategory(id);
	}

	public void createDefaultProduct() throws Exception {
		Product product = new Product();
		product.setProductName("Samsung Galaxy Fold");
		product.setOldPrice(50000000);
		product.setDiscount((double) 20);
		product.setCreated(new Date());
		product.setProductNumber(30);
		product.setYearManufactured(2019);
		product.setDescription(
				"Sau rất nhiều chờ đợi thì Samsung Galaxy Fold - chiếc smartphone màn hình gập đầu tiên của Samsung cũng đã chính thức trình làng với thiết kế mới lạ.");
		product.setProductImages("ssfold.png");
		productRepository.save(product);

		Product product1 = new Product();
		product1.setProductName("iPhone 11 Pro Max 512GB");
		product1.setOldPrice(41990000);
		product1.setDiscount((double) 15);
		product1.setCreated(new Date());
		product1.setProductNumber(20);
		product1.setYearManufactured(2019);
		product1.setDescription(
				"Để tìm kiếm một chiếc smartphone có hiệu năng mạnh mẽ và có thể sử dụng mượt mà trong 2-3 năm tới thì không có chiếc máy nào xứng đang hơn chiếc iPhone 11 Pro Max 512GB mới ra mắt trong năm 2019 của Apple.");
		product1.setProductImages("iphone11promax.png");

		productRepository.save(product1);

		Product product2 = new Product();
		product2.setProductName("HP Probook 430 G6");
		product2.setOldPrice(17990000);
		product2.setDiscount((double) 25);
		product2.setCreated(new Date());
		product2.setProductNumber(25);
		product2.setYearManufactured(2019);
		product2.setDescription(
				"Không thay đổi quá nhiều so với các sản phẩm trước tuy nhiên laptop HP Probook 430 sang trọng hơn nhờ mặt chiếu nghỉ tay kim loại. Trọng lượng chỉ 1,45 kg và mỏng 18mm, laptop đã đáp ứng điều kiện mỏng nhẹ để phù hợp với nhu cầu thường xuyên di chuyển của bạn.");
		product2.setProductImages("hpprobook430g6.jpg");
		productRepository.save(product2);

		Product product3 = new Product();
		product3.setProductName("HP Palivion 15");
		product3.setOldPrice(26990000);
		product3.setDiscount((double) 20);
		product3.setCreated(new Date());
		product3.setProductNumber(25);
		product3.setYearManufactured(2019);
		product3.setDescription(
				"Laptop HP Pavilion 15 cx0182TX i7 (5EF46PA) là chiếc laptop mang trong mình bộ vi xử lý mới nhất và mạnh mẽ nhất Intel Core i7 cùng Card đồ họa GeForce GTX 1050Ti cho hiệu năng mạnh mẽ xử lý tốt mọi tựa game và ứng dụng đồ họa hiện hành. ");
		product3.setProductImages("hppavilion.jpg");
		productRepository.save(product3);

		Product product4 = new Product();
		product4.setProductName("Macbook Pro Touch 2019");
		product4.setOldPrice(55990000);
		product4.setDiscount((double) 20);
		product4.setCreated(new Date());
		product4.setProductNumber(25);
		product4.setYearManufactured(2019);
		product4.setDescription(
				"MacBook Pro 2019 được Apple ra mắt là một chiếc laptop cá nhân mang tính thời trang rất cao với thiết kế tinh tế đến từng chi tiết bên cạnh cấu hình khủng để vận hành trơn tru hầu hết các công việc văn phòng như Photoshop, AI, cắt ghép video. Thêm vào đó là một số tính năng hữu ích khác như thanh cảm ứng Touch Bar, Touch ID, màn hình Retina.");
		product4.setProductImages("macbookpro2019.jpg");
		productRepository.save(product4);

		Product product5 = new Product();
		product5.setProductName("Samsung Galaxy S20 Ultra");
		product5.setOldPrice(29990000);
		product5.setDiscount((double) 20);
		product5.setCreated(new Date());
		product5.setProductNumber(25);
		product5.setYearManufactured(2020);
		product5.setDescription(
				"Samsung Galaxy S20 Ultra siêu phẩm công nghệ hàng đầu của Samsung mới ra mắt với nhiều đột phá công nghệ, màn hình tràn viền không khuyết điểm, hiệu năng đỉnh cao, camera độ phân giải siêu khủng 108 MP cùng khả năng zoom 100X thách thức mọi giới hạn smartphone.");
		product5.setProductImages("sss20ultra.png");
		productRepository.save(product5);

		Product product6 = new Product();
		product6.setProductName("Samsung Galaxy Tab A 10.1 T515");
		product6.setOldPrice(7490000);
		product6.setDiscount((double) 20);
		product6.setCreated(new Date());
		product6.setProductNumber(25);
		product6.setYearManufactured(2019);
		product6.setDescription(
				"Samsung Galaxy Tab A 10.1 T515 (2019) là chiếc máy tính bảng có màn hình lớn cùng cấu hình vừa phải đáp ứng tốt cho bạn trong hầu hết các nhu cầu giải trí hằng ngày.");
		product6.setProductImages("sstab.png");
		productRepository.save(product6);

		Product product7 = new Product();
		product7.setProductName("iPad 10.2 inch Wifi Cellular 32GB");
		product7.setOldPrice(13990000);
		product7.setDiscount((double) 20);
		product7.setCreated(new Date());
		product7.setProductNumber(25);
		product7.setYearManufactured(2019);
		product7.setDescription(
				"Nhắc tới máy tính bảng thì người ta sẽ nghĩ ngay tới iPad và vào những tháng cuối năm 2019 thì Apple giới thiệu chiếc máy tính bảng \"giá rẻ\" mang tên iPad 10.2 inch Wifi Cellular 32GB (2019), nhắm tới đối tượng người dùng là các bạn học sinh, sinh viên hay những người muốn một thiết bị màn hình lớn cho làm việc và giải trí.");
		product7.setProductImages("ipad10.2.png");
		productRepository.save(product7);

		Product product8 = new Product();
		product8.setProductName("HP Envy 13");
		product8.setOldPrice(20990000);
		product8.setDiscount((double) 20);
		product8.setCreated(new Date());
		product8.setProductNumber(25);
		product8.setYearManufactured(2019);
		product8.setDescription(
				"HP Envy 13 aq0026TU (6ZF38PA) là thế hệ laptop mỏng nhẹ với cấu hình mạnh mẽ cùng các tính năng hiện đại đem đến cho người dùng những trải nghiệm tuyệt vời nhất trong cả công việc lẫn giải trí.");
		product8.setProductImages("hpenvy.jpg");
		productRepository.save(product8);

		Product product9 = new Product();
		product9.setProductName("HP EliteBook X360 14");
		product9.setOldPrice(51990000);
		product9.setDiscount((double) 20);
		product9.setCreated(new Date());
		product9.setProductNumber(25);
		product9.setYearManufactured(2019);
		product9.setDescription(
				"Laptop HP EliteBook X360 1040 G5 là chiếc laptop mới được ra mắt tháng 3/2019 - một chiếc laptop cao cấp được trang bị hầu như tất cả các công nghệ cao cấp mà HP cung cấp. Ngoài ra nó còn được hỗ trợ xác thực ba yếu tố (khuôn mặt, dấu vân tay, mật khẩu) phù hợp với yêu cầu người dùng cần bảo mật cao");
		product9.setProductImages("hpelitebookx360.jpg");
		productRepository.save(product9);

		Product product10 = new Product();
		product10.setProductName("iPhone Xs Max 64GB");
		product10.setOldPrice(27990000);
		product10.setDiscount((double) 20);
		product10.setCreated(new Date());
		product10.setProductNumber(25);
		product10.setYearManufactured(2018);
		product10.setDescription(
				"Hoàn toàn xứng đáng với những gì được mong chờ, phiên bản cao cấp nhất iPhone Xs Max 64 GB của Apple năm nay nổi bật với chip A12 Bionic mạnh mẽ, màn hình rộng đến 6.5 inch, cùng camera kép trí tuệ nhân tạo và Face ID được nâng cấp.");
		product10.setProductImages("ipxsmax.png");
		productRepository.save(product10);

		Product product11 = new Product();
		product11.setProductName("Samsung Galaxy S10 Lite");
		product11.setOldPrice(13990000);
		product11.setDiscount((double) 20);
		product11.setCreated(new Date());
		product11.setProductNumber(25);
		product11.setYearManufactured(2019);
		product11.setDescription(
				"Samsung Galaxy S10 Lite là một phiên bản khác của dòng Galaxy S10 đã ra mắt trước đó nhưng mang trong mình khá nhiều khác biệt về ngoại hình cũng như bên trong.");
		product11.setProductImages("sss10lite.png");
		productRepository.save(product11);
	}

	@Override
	public Page<Product> getAllWithPagination(Integer pageNo, Integer pageSize, String sortBy) {
		Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy));
		return this.productPagingAndSortingRepository.findAll(paging);
	}

	@Override
	public Page<Product> getAllWithPagination(Integer pageNo, Integer pageSize, String sortBy, Long filter) {
		Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy));
		return this.productPagingAndSortingRepository.findAllWithFilter(filter, paging);
	}

	public Page<Product> getAllWithPaginationManufacturer(Integer pageNo, Integer pageSize, String sortBy, Long filter) {
		Pageable paging = PageRequest.of(pageNo, pageSize, Sort.by(sortBy));
		return this.productPagingAndSortingRepository.findAllWithFilterManufacturer(filter, paging);
	}

}
