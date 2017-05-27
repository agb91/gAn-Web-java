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
@RequestMapping("/home")
public class Home {

	@RequestMapping(method = RequestMethod.GET)
    public ModelAndView home()
    {
		ModelAndView mav = new ModelAndView();
		List<String> lista = getList();
		mav.addObject("list", lista);
		mav.setViewName("homeView");
		return mav;
    }
	
	private List<String> getList()
	{
		List<String> result = new ArrayList<String>();
		
		File folder = new File("/home/andrea/Desktop/GAN REPO/gAn-web");
		File[] listOfFiles = folder.listFiles();

		for (File file : listOfFiles) {
		    if (file.isFile()) {
		        result.add(file.getName());
		    }
		}
		
		return result;
	}
	
}
