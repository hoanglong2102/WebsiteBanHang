package com.website.WebsiteBanHang.controllers;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.website.WebsiteBanHang.entities.Order;
import com.website.WebsiteBanHang.entities.OrderDetail;
import com.website.WebsiteBanHang.service.impl.OrderServiceImpl;

@Controller
@RequestMapping(value = "/admin/order")
public class OrderController {

	@Autowired
	private OrderServiceImpl orderService;

	@RequestMapping(value = "/", method = RequestMethod.GET, headers = "Accept=application/json")
	public ModelAndView getOrders(ModelAndView model, @RequestParam(defaultValue = "0") Integer page,
			@RequestParam(defaultValue = "5") Integer size) {
		model.setViewName("order-orders");
		// List<Order> orders = this.orderService.getAll();
		Page<Order> orders = this.orderService.getAllWithPagination(page, size, "id");
		model.addObject("currentPage", page);
		model.addObject("orders", orders);
		return model;
	}

	@RequestMapping(value = "/print/{orderId}", method = RequestMethod.GET, headers = "Accept=application/json")
	public ModelAndView print(@PathVariable("orderId") Long id, @RequestParam("mode") String mode, ModelAndView model) {
		model.setViewName("order-print");
//		List<Order> orders = this.orderService.getAll();
//		model.addObject("orders", orders);
		Order order = orderService.getOrder(id);
		List<OrderDetail> orderDetailList = orderService.listOrderDetailInfos(id);
		model.addObject("order", order);
		model.addObject("orderDetailList", orderDetailList);
		model.addObject("mode", mode);
		return model;
	}

	@RequestMapping(value = "/addOrder", method = RequestMethod.GET, headers = "Accept=application/json")
	public ModelAndView addOrder(ModelAndView model) {
		model.setViewName("order-orderUpdate");
		model.addObject("order", new Order());
		model.addObject("mode", "ADD");
		return model;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveOrder(@ModelAttribute("order") Order order) {
		if (order.getId() == null) {
			orderService.add(order);
		} else {
			orderService.update(order);
		}
		return "redirect:/admin/order/";

	}

	@RequestMapping(value = "/getOrder/{orderId}", method = RequestMethod.GET, headers = "Accept=application/json")
	public ModelAndView getOrder(@PathVariable("orderId") Long id, @RequestParam("mode") String mode,
			ModelAndView model) {
		if (mode.equals("EDIT")) {
			model.setViewName("order-orderUpdate");
		} else {
			model.setViewName("order-orderDetail");
		}

		// model.setViewName("order-orderDetail");
		// OrderDetail orderDetail = this.orderDetailService.getOrderDetail(id);
		Order order = orderService.getOrder(id);
		List<OrderDetail> orderDetailList = orderService.listOrderDetailInfos(id);
		model.addObject("order", order);
		model.addObject("orderDetailList", orderDetailList);
		model.addObject("mode", mode);
		return model;
	}

	@RequestMapping(value = "/deleteOrder/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public String deleteOrder(@PathVariable Long id) {
		orderService.delete(id);
		return "redirect:/admin/order/";
	}

	@RequestMapping(value = "/searchByFromDateAndToDate", method = RequestMethod.POST)
	public ModelAndView search(@RequestParam("fromDate") Date fromDate, @RequestParam("toDate") Date toDate) {
		ModelAndView model = new ModelAndView();
		List<Order> orders = this.orderService.searchByFromDateAndToDate(fromDate, toDate);
		model.addObject("orders", orders);

		model.addObject("size", orders.size());
		model.addObject("fromDate", fromDate);
		model.addObject("toDate", toDate);
		model.setViewName("order-searchOrder");
		return model;
	}

	@RequestMapping(value = "/searchOrderByHour", method = RequestMethod.POST)
	public ModelAndView searchOrderByHour(@RequestParam("fromHour") int fromHour,
			@RequestParam("fromMinute") int fromMinute, @RequestParam("toHour") int toHour,
			@RequestParam("toMinute") int toMinute) {
		ModelAndView model = new ModelAndView();
		List<Order> orders = this.orderService.searchByHoursAndMinute(fromHour, fromMinute, toHour, toMinute);
		model.addObject("orders", orders);

		model.addObject("size", orders.size());
		model.setViewName("order-searchOrder");
		return model;
	}

	@RequestMapping(value = "/searchByFromDateAndTimeToDateAndTime", method = RequestMethod.POST)
	public ModelAndView searchByFromDateAndTimeToDateAndTime(@RequestParam("fromDate") Date fromDate,
			@RequestParam("fromHour") int fromHour, @RequestParam("fromMinute") int fromMinute,
			@RequestParam("toDate") Date toDate, @RequestParam("toHour") int toHour,
			@RequestParam("toMinute") int toMinute) {
		ModelAndView model = new ModelAndView();
		List<Order> orders = this.orderService.searchByFromDateAndTimeToDateAndTime(fromDate, fromHour, fromMinute,
				toDate, toHour, toMinute);
		model.addObject("orders", orders);

		model.addObject("size", orders.size());
		model.addObject("fromDate", fromDate);
		model.addObject("toDate", toDate);
		model.setViewName("order-searchOrder");
		return model;
	}

	@RequestMapping(value = "/searchOrderByDatesAndTime", method = RequestMethod.POST)
	public ModelAndView searchByDateAndTime(@RequestParam("Date") Date Date, @RequestParam("Hour") int Hour,
			@RequestParam("Minute") int Minute) {
		ModelAndView model = new ModelAndView();
		List<Order> orders = this.orderService.searchByDateAndTime(Date, Hour, Minute);
		model.addObject("orders", orders);
		model.addObject("size", orders.size());
		model.addObject("Hour", Hour);
		model.addObject("Minute", Minute);
		model.addObject("Date", Date);
		model.setViewName("order-searchOrderByDatesAndTime");
		return model;
	}

	@RequestMapping(value = "/searchOrderByName", method = RequestMethod.POST)
	public ModelAndView searchOrderByName(@RequestParam String name, ModelAndView model) {
		boolean kq = false;
		List<Order> orders = this.orderService.searchOrderByFirstnameAndLastname(name);
		if (orders.size() > 0) {
			model.addObject("orders", orders);
			kq = true;
		}
		model.addObject("ketqua", kq);
		model.setViewName("order-searchOrderByName");
		return model;
	}

}
