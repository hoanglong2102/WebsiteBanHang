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

import com.website.WebsiteBanHang.entities.Customer;
import com.website.WebsiteBanHang.repository.CustomerRepository;
import com.website.WebsiteBanHang.service.impl.CustomerServiceImpl;

@Controller
@RequestMapping(value = "/admin/customer")
public class CustomerController {
	@Autowired
	private CustomerServiceImpl customerService;

	@Autowired
	private CustomerRepository customerRepository;

	@RequestMapping(value = "/", method = RequestMethod.GET, headers = "Accept=application/json")
	public ModelAndView getCustomer(ModelAndView model, @RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "5") Integer size) {
		model.setViewName("customer-customers");
//		List<Customer> customers = this.customerService.getAll();
		Page<Customer> customers = this.customerService.getAllWithPagination(page, size, "id");
		model.addObject("customers", customers);
		model.addObject("currentPage", page);
		return model;
	}

	@RequestMapping(value = "/addCustomer", method = RequestMethod.GET, headers = "Accept=application/json")
	public ModelAndView addCustomer(ModelAndView model) {
		model.setViewName("customer-customerAdd");
		model.addObject("customer", new Customer());
		model.addObject("mode", "ADD");
		return model;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveCustomer(@ModelAttribute("customer") Customer customer, Model model, HttpServletRequest request) {

		String error = "";
		String getPhoneNumber = customer.getNumberPhone();
		Customer customerFindByPhoneNumber = customerRepository.findByPhoneNumber(getPhoneNumber);
		if (customer.getId() == null) {
			if (customerFindByPhoneNumber != null) {
				error = "Số điện thoại đã được sử dụng!";
				customer = customerFindByPhoneNumber;
				model.addAttribute("errorMessage", error);
				model.addAttribute("mode", "ADD");
				return "customer-customerAdd";
			}
			String errorMessage = customerService.add(customer);
			if (errorMessage != null) {
				model.addAttribute("errorMessage", errorMessage);
				model.addAttribute("mode", "ADD");
				return "customer-customerAdd";
			}
//			customerService.add(customer);
		} else {
			/*
			 * if (customerFindByPhoneNumber != null) { error =
			 * "Số điện thoại đã được sử dụng!"; customer = customerFindByPhoneNumber;
			 * model.addAttribute("errorMessage", error); model.addAttribute("mode",
			 * "EDIT"); return "customer-customerAdd"; }
			 */
			String errorMessage1 = customerService.update(customer);
			if (errorMessage1 != null) {
				model.addAttribute("errorMessage", errorMessage1);
				model.addAttribute("mode", "EDIT");
				return "customer-customerAdd";
			}
			return "customer-customerDetail";
		}
		return "redirect:/admin/customer/";
	}

	@RequestMapping(value = "/getCustomer/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public ModelAndView getCustomer(@PathVariable("id") Long id, @RequestParam("mode") String mode,
			ModelAndView model) {
		if (mode.equals("EDIT")) {
			model.setViewName("customer-customerUpdate");
		} else {
			model.setViewName("customer-customerDetail");
		}

		Customer customer = customerService.getCustomer(id);

		model.addObject("customer", customer);
		model.addObject("mode", mode);
		return model;
	}

	@RequestMapping(value = "/deleteCustomer/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public String deleteCustomer(@PathVariable Long id) {
		customerService.delete(id);
		return "redirect:/admin/customer/";
	}

	@RequestMapping(value = "/searchCustomer", method = RequestMethod.POST)
	public ModelAndView search(@RequestParam String Search, ModelAndView model) {
		boolean kq = false;
		List<Customer> customers = this.customerService.searchCustomerByFullNameAndPhoneNumber(Search);

		if (customers.size() > 0) {
			model.addObject("customers", customers);
			kq = true;
		}
		model.addObject("size", customers.size());
		model.addObject("ketqua", kq);
		model.addObject("Search", Search);
		model.setViewName("customer-searchCustomer");
		return model;
	}

}
