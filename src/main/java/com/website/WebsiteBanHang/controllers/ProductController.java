package com.website.WebsiteBanHang.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.website.WebsiteBanHang.entities.Category;
import com.website.WebsiteBanHang.entities.Manufacturer;
import com.website.WebsiteBanHang.entities.Product;
import com.website.WebsiteBanHang.service.impl.CategoryServiceImpl;
import com.website.WebsiteBanHang.service.impl.ImageServiceImpl;
import com.website.WebsiteBanHang.service.impl.ManufacturerServiceImpl;
import com.website.WebsiteBanHang.service.impl.ProductServiceImpl;

@Controller
@RequestMapping(value = "/admin/product")
public class ProductController {

	@Autowired
	private ImageServiceImpl imageService;
	@Autowired
	private ProductServiceImpl productService;
	@Autowired
	private CategoryServiceImpl categoryService;
	@Autowired
	private ManufacturerServiceImpl manufacturerService;

	@RequestMapping(value = "/", method = RequestMethod.GET, headers = "Accept=application/json")
	public ModelAndView getProducts(ModelAndView model, @RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "5") Integer size) {
		model.setViewName("product-products");
//		List<Product> products = this.productService.getAll();
		Page<Product> products = this.productService.getAllWithPagination(page, size, "productCode");

		model.addObject("products", products);
		model.addObject("currentPage", page);
		return model;

	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveProduct(@ModelAttribute("product") Product product, Model model, HttpServletRequest request) {

		String uploadRootPath = request.getServletContext().getRealPath("uploads");

		String imageName = imageService.uploadFile(uploadRootPath, product.getImageFile());
		List<Long> categorylist = product.getCategoryIds();
		List<Category> categories = new ArrayList();
		List<Category> allCategories = categoryService.getAll();

		model.addAttribute("product", product);
		model.addAttribute("allCategory", allCategories);

		List<Manufacturer> allManufacturers = manufacturerService.getAll();
		model.addAttribute("allManufacturers", allManufacturers);

		for (Long categoryId : categorylist) {
			Category category = this.categoryService.getCategory(categoryId);
			categories.add(category);
		}
		product.setCategories(categories);

		if (product.getProductCode() == null) {

			if (imageName != null && imageName.isEmpty() == false) {
				product.setProductImages(imageName);
			} else {
				product.setProductImages("18.jpg");
			}

			String errorMes = productService.add(product);
			if (errorMes != null) {
				model.addAttribute("errorMessage", errorMes);
				model.addAttribute("mode", "ADD");
				return "product-productUpdate";
			}

		} else {
			if (imageName != null && imageName.isEmpty() == false) {
				product.setProductImages(imageName);
			}
			String errorMessage = productService.update(product);
			if (errorMessage != null) {
				model.addAttribute("errorMessage", errorMessage);
				model.addAttribute("mode", "EDIT");
				return "product-productUpdate";
			}
			return "product-productDetail";
		}
		return "redirect:/admin/product/";

	}

	@RequestMapping(value = "/getProduct/{id}", method = RequestMethod.GET)
	public ModelAndView getProduct(@PathVariable("id") Long id, @RequestParam("mode") String mode, ModelAndView model) {

		if (mode.equals("EDIT")) {
			model.setViewName("product-productUpdate");
		} else {
			model.setViewName("product-productDetail");
		}
		List<Category> categories = categoryService.getAll();

		List<Manufacturer> manufacturers = this.manufacturerService.getAll();
		Product product = productService.getProduct(id);

		model.addObject("product", product);
		model.addObject("allCategory", categories);
		model.addObject("allManufacturers", manufacturers);
		model.addObject("mode", mode);
		return model;
	}

	@RequestMapping(value = "/addProduct", method = RequestMethod.GET)
	public ModelAndView addProduct(ModelAndView model) {
		model.setViewName("product-productUpdate");
		List<Category> categories = this.categoryService.getAll();
		model.addObject("product", new Product());
		model.addObject("allCategory", categories);
		List<Manufacturer> manufacturers = this.manufacturerService.getAll();
		model.addObject("allManufacturers", manufacturers);
		model.addObject("mode", "ADD");

		return model;
	}

	@RequestMapping(value = "/deleteProduct/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public String deleteProduct(@PathVariable Long id) {
		productService.delete(id);
		return "redirect:/admin/product/";
	}

//	@RequestMapping(value="/search", method=  RequestMethod.POST)
//	public ModelAndView search(@ModelAttribute("searchProduct") Product product) {
//		ModelAndView model = new ModelAndView();
//		String searchProductName = product.getProductName();
//		List<Product> products = this.productService.getFindProduct(searchProductName);
//		model.addObject("products",products);
//		model.setViewName("product-products");
//		return model;
//	}
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ModelAndView search(@RequestParam String search, ModelAndView model) {
		boolean kq = false;
		List<Product> products = this.productService.getFindProduct(search);
		if (products.size() > 0) {
			model.addObject("products", products);
			kq = true;
		}
		model.addObject("ketqua", kq);
		model.addObject("size", products.size());
		model.addObject("search", search);
		model.setViewName("product-searchProduct");
		return model;
	}
}
