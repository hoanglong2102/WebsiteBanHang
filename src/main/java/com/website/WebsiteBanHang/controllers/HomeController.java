package com.website.WebsiteBanHang.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.website.WebsiteBanHang.entities.Category;
import com.website.WebsiteBanHang.entities.Manufacturer;
import com.website.WebsiteBanHang.entities.Product;
import com.website.WebsiteBanHang.service.impl.CategoryServiceImpl;
import com.website.WebsiteBanHang.service.impl.ManufacturerServiceImpl;
import com.website.WebsiteBanHang.service.impl.ProductServiceImpl;

@Controller
@RequestMapping(value = "/shop")
public class HomeController {
	@Autowired
	private ProductServiceImpl productService;

	@Autowired
	private CategoryServiceImpl categoryService;
	@Autowired
	private ManufacturerServiceImpl manufacturerService;

	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public ModelAndView getProductList(ModelAndView model, HttpServletRequest request,
			@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "5") Integer size) {
		model.setViewName("shop-home");
		List<Category> categories = this.categoryService.getAll();
		request.getSession().setAttribute("categories", categories);
		List<Manufacturer> manufacturers = this.manufacturerService.getAll();
		request.getSession().setAttribute("manufacturers", manufacturers);
//			List<Product> products = this.productService.getAll();
		Page<Product> products = this.productService.getAllWithPagination(page, size, "productCode");

		model.addObject("products", products);
		model.addObject("currentPage", page);
		return model;
	}

	@RequestMapping(value = "/getProduct/{id}", method = RequestMethod.GET)
	public ModelAndView getProduct(@PathVariable("id") Long id, @RequestParam("mode") String mode, ModelAndView model) {
		model.setViewName("shop-product");

		Product product = productService.getProduct(id);

		model.addObject("product", product);
		model.addObject("mode", mode);
		return model;
	}

	@RequestMapping(value = "/getProductsByCategory", method = RequestMethod.GET)
	public ModelAndView getProductsByCategory(@RequestParam Long filter, ModelAndView model,
			@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "5") Integer size) {
		model.setViewName("shop-list");
		Page<Product> products = this.productService.getAllWithPagination(page, size, "productCode", filter);
		model.addObject("products", products);
		model.addObject("currentPage", page);
		model.addObject("filter", filter);
		return model;
	}

	@RequestMapping(value = "/getProductsByManufacturer", method = RequestMethod.GET)
	public ModelAndView getProductsByPublisher(@RequestParam Long filter, ModelAndView model,
			@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "5") Integer size) {
		model.setViewName("shop-list");
		Page<Product> products = this.productService.getAllWithPaginationManufacturer(page, size, "productCode", filter);
		model.addObject("products", products);
		model.addObject("currentPage", page);
		model.addObject("filter", filter);
		return model;
	}

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
		model.setViewName("shop-search");

		return model;
	}

	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public ModelAndView about(ModelAndView model) {
		model.setViewName("shop-about");
		return model;

	}

}
