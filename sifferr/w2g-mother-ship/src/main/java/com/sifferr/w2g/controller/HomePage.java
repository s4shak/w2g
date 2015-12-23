package com.sifferr.w2g.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@PropertySource("classpath:application.properties")
public class HomePage {

	private static final Logger logger = LoggerFactory
			.getLogger(HomePage.class);

	@RequestMapping(value = "/w2g", method = RequestMethod.GET)
	public String homePage(HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {

		String nextView = "w2gHome";
		return nextView;
	}

}
