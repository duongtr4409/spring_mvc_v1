package com.laptrinhjavaweb.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.model.NewModel;

@Controller(value = "NewControllerOfAdmin")
public class NewController {
	
	@RequestMapping(value = "/admin/new/danh-sach", method = RequestMethod.GET)
	public ModelAndView showlist(@ModelAttribute("model") NewModel newModel) {
		ModelAndView mav = new ModelAndView("/admin/new/list");
		
		return mav;
	}
}
