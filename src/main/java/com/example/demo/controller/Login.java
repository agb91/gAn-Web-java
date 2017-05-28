package com.example.demo.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/login")
public class Login {

	@RequestMapping(method = RequestMethod.GET)
    public ModelAndView login()
    {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
    }
}
