package com.website.WebsiteBanHang.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.website.WebsiteBanHang.Utils.Utils;
import com.website.WebsiteBanHang.entities.Product;
import com.website.WebsiteBanHang.model.CartInfo;
import com.website.WebsiteBanHang.model.CartLineInfo;
import com.website.WebsiteBanHang.model.CustomerInfo;
import com.website.WebsiteBanHang.model.ProductInfo;
import com.website.WebsiteBanHang.service.OrderService;
import com.website.WebsiteBanHang.service.impl.ProductServiceImpl;

@Controller
@RequestMapping(value = "/shop")
public class ShoppingCartController {

	@Autowired
	private ProductServiceImpl productService;
	@Autowired
	private OrderService orderService;

	@RequestMapping({ "/buyProduct" })
	public String listProductHandler(HttpServletRequest request, Model model, //
			@RequestParam(value = "id", defaultValue = "") Long id) {

		Product product = null;
		if (id != null) {
			product = productService.getProduct(id);
		}
		if (product != null) {

			//
			CartInfo cartInfo = Utils.getCartInSession(request);

			ProductInfo productInfo = new ProductInfo(product);

			cartInfo.addProduct(productInfo, 1);
		}

		return "redirect:/shop/shoppingCart";
	}

	@RequestMapping({ "/shoppingCartRemoveProduct" })
	public String removeProductHandler(HttpServletRequest request, Model model, //
			@RequestParam(value = "id", defaultValue = "") Long id) {
		Product product = null;
		if (id != null) {
			product = productService.getProduct(id);
		}
		if (product != null) {

			CartInfo cartInfo = Utils.getCartInSession(request);
			ProductInfo productInfo = new ProductInfo(product);

			cartInfo.removeProduct(productInfo);

		}

		return "redirect:/shop/shoppingCart";
	}

	// POST: Update quantity for product in cart
	@RequestMapping(value = { "/shoppingCart" }, method = RequestMethod.POST)
	public String shoppingCartUpdateQty(HttpServletRequest request, //
			Model model, //
			@ModelAttribute("cartForm") CartInfo cartForm) {

		CartInfo cartInfo = Utils.getCartInSession(request);
		cartInfo.updateQuantity(cartForm);
		String errorMessage = "";
		List<CartLineInfo> lines = cartInfo.getCartLines();
		for (CartLineInfo cartLineInfo : lines) {
			if (cartLineInfo.getErroMessage() != null) {
				errorMessage += cartLineInfo.getErroMessage() + "<br/>";
			}

		}
		if (errorMessage.isEmpty() == false) {
			model.addAttribute("errorMessage", errorMessage);
			CartInfo myCart = Utils.getCartInSession(request);
			model.addAttribute("cartForm", myCart);
			return "shop-shoppingCart";
		}

		return "redirect:/shop/shoppingCart";
	}

	// GET: Show cart.
	@RequestMapping(value = { "/shoppingCart" }, method = RequestMethod.GET)
	public String shoppingCartHandler(HttpServletRequest request, Model model) {
		CartInfo myCart = Utils.getCartInSession(request);

		model.addAttribute("cartForm", myCart);
		return "shop-shoppingCart";
	}

	// GET: Enter customer information.
	@RequestMapping(value = { "/shoppingCartCustomer" }, method = RequestMethod.GET)
	public ModelAndView shoppingCartCustomerForm(HttpServletRequest request) {

		CartInfo cartInfo = Utils.getCartInSession(request);
		CustomerInfo customerInfo = cartInfo.getCustomerInfo();
		if (customerInfo == null) {
			customerInfo = new CustomerInfo();
		}
		ModelAndView model = new ModelAndView();
		model.addObject("customerInfo", customerInfo);
//			if (cartInfo.isEmpty()) {
		//
//				return "redirect:/shop/checkOut";
//			}

		model.setViewName("shop-checkOut");
		return model;

	}

	// POST: Save customer information.
	@RequestMapping(value = { "/shoppingCartCustomer" }, method = RequestMethod.POST)
	public String shoppingCartCustomerSave(HttpServletRequest request, Model model,
			@ModelAttribute("customerInfo") CustomerInfo customerInfo) {

		String errorMessage = "";

		if (customerInfo.getLastName().isEmpty()) {
			errorMessage += "Vui lòng nhập họ!" + "<br/>";
		}
		if (customerInfo.getFirstName().isEmpty()) {
			errorMessage += "Vui lòng nhập tên!" + "<br/>";
		}
		if (customerInfo.getNumberPhone().isEmpty()) {
			errorMessage += "Vui lòng nhập số điện thoại!" + "<br/>";
		}

		if (customerInfo.getEmail().isEmpty()) {
			errorMessage += "Vui lòng nhập email!" + "<br/>";
		}
		if (customerInfo.getStreet().isEmpty()) {
			errorMessage += "Vui lòng nhập tên đường!" + "<br/>";
		}
		if (customerInfo.getDistrict().isEmpty()) {
			errorMessage += "Vui lòng nhập tên huyện/quận!" + "<br/>";
		}
		if (customerInfo.getCity().isEmpty()) {
			errorMessage += "Vui lòng nhập tên tỉnh/thành phố!" + "<br/>";
		}

		if (errorMessage != "") {
			request.setAttribute("errorMessage", errorMessage);
			return "shop-checkOut";
		}
		CartInfo cartInfo = Utils.getCartInSession(request);
		cartInfo.setCustomerInfo(customerInfo);

		return "redirect:/shop/shoppingCartConfirmation";
	}

	// GET: Show information to confirm.
	@RequestMapping(value = { "/shoppingCartConfirmation" }, method = RequestMethod.GET)
	public String shoppingCartConfirmationReview(HttpServletRequest request, Model model) {
		CartInfo cartInfo = Utils.getCartInSession(request);

		if (cartInfo == null || cartInfo.isEmpty()) {

			return "redirect:/shop/shoppingCart";
		}
		model.addAttribute("myCart", cartInfo);

		return "shop-shoppingCartConfirmation";
	}

	// POST: Submit Cart (Save)
	@RequestMapping(value = { "/shoppingCartConfirmation" }, method = RequestMethod.POST)
	public String shoppingCartConfirmationSave(HttpServletRequest request, Model model) {
		CartInfo cartInfo = Utils.getCartInSession(request);

		if (cartInfo.isEmpty()) {

			return "redirect:/shop/shoppingCart";
		}
//			else if (!cartInfo.isValidCustomer()) {
		//
//				return "redirect:/shop/shoppingCartCustomer";
//			}
		try {
			orderService.addOrder(cartInfo);
		} catch (Exception e) {

			return "shop-shoppingCartConfirmation";
		}

		// Remove Cart from Session.
		Utils.removeCartInSession(request);

		// Store last cart.
		Utils.storeLastOrderedCartInSession(request, cartInfo);

		return "redirect:/shop/shoppingCartFinalize";
	}

	@RequestMapping(value = { "/shoppingCartFinalize" }, method = RequestMethod.GET)
	public String shoppingCartFinalize(HttpServletRequest request, Model model) {

		CartInfo lastOrderedCart = Utils.getLastOrderedCartInSession(request);

		if (lastOrderedCart == null) {
			return "redirect:/shop/shoppingCart";
		}
		model.addAttribute("lastOrderedCart", lastOrderedCart);
		return "shop-shoppingCartFinalize";
	}

}
