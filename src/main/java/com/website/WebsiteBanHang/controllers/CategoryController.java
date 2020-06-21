package com.website.WebsiteBanHang.controllers;

import java.util.List;

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
import com.website.WebsiteBanHang.repository.CategoryRepository;
import com.website.WebsiteBanHang.service.impl.CategoryServiceImpl;

@Controller
@RequestMapping(value = "/admin/category")
public class CategoryController {
	@Autowired
	private CategoryServiceImpl categoryService;
	@Autowired
	private CategoryRepository categoryRepository;

	@RequestMapping(value = "/", method = RequestMethod.GET, headers = "Accept=application/json")
	public ModelAndView getCategory(ModelAndView model, @RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "5") Integer size) {
		model.setViewName("category-categories");
//		List<Category> categories = this.categoryService.getAll();
		Page<Category> categories = this.categoryService.getAllWithPagination(page, size, "categoryCode");
		model.addObject("currentPage", page);
		model.addObject("categories", categories);
		return model;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveCategory(@ModelAttribute("category") Category category, Model model) {
		String error = "";
		String getCategoryName = category.getCategoryName();
		Category categoryFindByCategoryName = categoryRepository.findByCategoryName(getCategoryName);
		if (category.getCategoryCode() == null) {

			if (categoryFindByCategoryName != null) {
				error = "Tên danh mục đã tồn tại!";
				model.addAttribute("errorMessage", error);
				model.addAttribute("mode", "ADD");
				return "category-categoryUpdate";
			}

			String errorMessage = categoryService.add(category);
			if (errorMessage != null) {
				model.addAttribute("errorMessage", errorMessage);
				model.addAttribute("mode", "ADD");
				return "category-categoryUpdate";
			}
		} else {
			String errorMessage = categoryService.update(category);
			if (errorMessage != null) {
				model.addAttribute("errorMessage", errorMessage);
				model.addAttribute("mode", "EDIT");
				return "category-categoryUpdate";
			}
		}
		return "redirect:/admin/category/";

	}

	@RequestMapping(value = "/getCategory/{id}", method = RequestMethod.GET)
	public ModelAndView getCategory(@PathVariable("id") Long id, @RequestParam("mode") String mode,
			ModelAndView model) {

		if (mode.equals("EDIT")) {
			model.setViewName("category-categoryUpdate");
		} else {
			model.setViewName("category-categoryDetail");
		}

		Category category = categoryService.getCategory(id);

		model.addObject("category", category);
		model.addObject("mode", mode);
		return model;
	}

	@RequestMapping(value = "/addCategory", method = RequestMethod.GET)
	public ModelAndView addCategory(ModelAndView model) {
		model.setViewName("category-categoryUpdate");
		model.addObject("category", new Category());
		model.addObject("mode", "ADD");
		return model;
	}

	@RequestMapping(value = "/deleteCategory/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public String deleteCategory(@PathVariable Long id) {
		categoryService.delete(id);
		return "redirect:/admin/category/";
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ModelAndView search(@RequestParam String search, ModelAndView model) {
		boolean kq = false;
		List<Category> categories = this.categoryService.getFindCategory(search);
		if (categories.size() > 0) {
			model.addObject("categories", categories);
			kq = true;
		}
		model.addObject("ketqua", kq);
		model.addObject("size", categories.size());
		model.addObject("search", search);
		model.setViewName("category-searchCategory");
		return model;
	}
}
