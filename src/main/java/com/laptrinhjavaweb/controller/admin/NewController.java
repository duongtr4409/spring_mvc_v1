package com.laptrinhjavaweb.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.service.CategoryService;
import com.laptrinhjavaweb.service.NewService;
import com.laptrinhjavaweb.util.MessageUtils;

@Controller(value = "NewControllerOfAdmin")
public class NewController {

	@Autowired
	private NewService newService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private MessageUtils messageUtils;

	@RequestMapping(value = "/admin/new/danh-sach", method = RequestMethod.GET)
	public ModelAndView showlist(@RequestParam("page") int page, @RequestParam("limit") int limit,
			HttpServletRequest request) {
		NewDTO model = new NewDTO();
		model.setPage(page);
		model.setLimit(limit);
		ModelAndView mav = new ModelAndView("admin/new/list");
		Sort sort = new Sort(new Order(Direction.DESC, "createdDate"), new Order(Direction.DESC, "id"));
		Pageable pageable = new PageRequest(page - 1, limit, sort);
		model.setListResult(newService.findAll(pageable));
		model.setTotalItem(newService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));

		String messageParam = request.getParameter("message");
		if (messageParam != null) {
			String message = "message";
			String alert = "alert";
			Map<String, String> messageMap = messageUtils.getMessage(messageParam);
			mav.addObject(message, messageMap.get(message));
			mav.addObject(alert, messageMap.get(alert));
		}

		mav.addObject("model", model);
		return mav;
	}

	@RequestMapping(value = "/admin/new/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editNew(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/admin/new/edit");

		String messageParam = request.getParameter("message");
		if (messageParam != null) {
			String message = "message";
			String alert = "alert";
			Map<String, String> messageMap = messageUtils.getMessage(messageParam);
			mav.addObject(message, messageMap.get(message));
			mav.addObject(alert, messageMap.get(alert));
		}

		NewDTO model = new NewDTO();
		if (id != null) {
			model = newService.findById(id);
		}
		mav.addObject("model", model);
		mav.addObject("categories", categoryService.findAll());
		return mav;
	}
}
