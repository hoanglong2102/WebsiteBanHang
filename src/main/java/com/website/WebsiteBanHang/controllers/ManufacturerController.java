package com.website.WebsiteBanHang.controllers;

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

import com.website.WebsiteBanHang.entities.Manufacturer;
import com.website.WebsiteBanHang.repository.ManufacturerRepository;
import com.website.WebsiteBanHang.service.impl.ImageServiceImpl;
import com.website.WebsiteBanHang.service.impl.ManufacturerServiceImpl;

@Controller
@RequestMapping(value = "/admin/manufacturer")
public class ManufacturerController {

	@Autowired
	private ManufacturerServiceImpl manufacturerService;
	@Autowired
	private ImageServiceImpl imageService;
	@Autowired
	private ManufacturerRepository manufacturerRepository;

	@RequestMapping(value = "/", method = RequestMethod.GET, headers = "Accept=application/json")
	public ModelAndView getManufacturer(ModelAndView model, @RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "5") Integer size) {
		model.setViewName("manufacturer-manufacturers");
		Page<Manufacturer> manufacturers = this.manufacturerService.getAllWithPagination(page, size, "id");
		model.addObject("manufacturers", manufacturers);
		model.addObject("currentPage", page);
		return model;

	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveManufacturer(@ModelAttribute("Manufacturer") Manufacturer manufacturer, Model model,
			HttpServletRequest request) {
		String uploadRootPath = request.getServletContext().getRealPath("uploads");

		String imageName = imageService.uploadFile(uploadRootPath, manufacturer.getImageFile());
		String error = "";
		String getManufacturerName = manufacturer.getManufacturerName();
		Manufacturer manufacturerFindByManufacturerName = manufacturerRepository
				.findByManufacturerName(getManufacturerName);

		if (manufacturer.getId() == null) {

			if (imageName != null && imageName.isEmpty() == false) {
				manufacturer.setLogo(imageName);
			} else {
				manufacturer.setLogo("Logo.png");
			}
			if (manufacturerFindByManufacturerName != null) {
				error = "Tên nhà sản xuất đã tồn tại!";
				model.addAttribute("errorMessage", error);
				model.addAttribute("mode", "ADD");
				return "manufacturer-manufacturerUpdate";
			}
			String errorMes = manufacturerService.add(manufacturer);
			if (errorMes != null) {
				model.addAttribute("errorMessage", errorMes);
				model.addAttribute("mode", "ADD");
				return "manufacturer-manufacturerUpdate";
			}
		} else {
			if (imageName != null && imageName.isEmpty() == false) {
				manufacturer.setLogo(imageName);
			} else {
				manufacturer.setLogo("Logo.png");

			}
			String errorMessage = manufacturerService.update(manufacturer);
			if (errorMessage != null) {
				model.addAttribute("errorMessage", errorMessage);
				model.addAttribute("mode", "EDIT");
				return "manufacturer-manufacturerUpdate";
			}
			return "manufacturer-manufacturerDetail";
		}
		return "redirect:/admin/manufacturer/";

	}

	@RequestMapping(value = "/getManufacturer/{id}", method = RequestMethod.GET)
	public ModelAndView getProduct(@PathVariable("id") Long id, @RequestParam("mode") String mode, ModelAndView model) {

		if (mode.equals("EDIT")) {
			model.setViewName("manufacturer-manufacturerUpdate");
		} else {
			model.setViewName("manufacturer-manufacturerDetail");
		}

		Manufacturer manufacturer = manufacturerService.getManufacturer(id);

		model.addObject("manufacturer", manufacturer);
		model.addObject("mode", mode);
		return model;
	}

	@RequestMapping(value = "/addManufacturer", method = RequestMethod.GET)
	public ModelAndView addManufacturer(ModelAndView model) {
		model.setViewName("manufacturer-manufacturerUpdate");
		model.addObject("manufacturer", new Manufacturer());
		model.addObject("mode", "ADD");
		return model;
	}

	@RequestMapping(value = "/deleteManufacturer/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public String deleteManufacturer(@PathVariable Long id) {
		manufacturerService.delete(id);
		return "redirect:/admin/manufacturer/";
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ModelAndView search(@RequestParam String search, ModelAndView model) {
		boolean kq = false;
		List<Manufacturer> manufacturers = this.manufacturerService.getFindManufacturer(search);
		if (manufacturers.size() > 0) {
			model.addObject("manufacturers", manufacturers);
			kq = true;
		}
		model.addObject("ketqua", kq);
		model.addObject("size", manufacturers.size());
		model.addObject("search", search);
		model.setViewName("manufacturer-searchManufacturer");
		return model;
	}
}
