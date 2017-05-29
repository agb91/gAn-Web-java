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

import com.example.demo.home.RunNumDate;


@Controller
@RequestMapping("/home")
public class Home {
	
	private String analyzesSingle = "/opt/lampp/htdocs/test-interChangeble/gAn-NEWWAY/analyses/single_run";
	private String analyzesMultiple = "/opt/lampp/htdocs/test-interChangeble/gAn-NEWWAY/analyses/multi_run";
	private String runData = "/opt/lampp/htdocs/test-interChangeble/gAn-NEWWAY/data";
	
	
	@RequestMapping(method = RequestMethod.GET)
    public ModelAndView home()
    {
		ModelAndView mav = new ModelAndView();
		List<String> singleList = getList( analyzesSingle );
		List<String> multipleList = getList( analyzesMultiple );
		RunNumDate lastRun = getLastRun( runData );
		
		mav.addObject("singleList", singleList);
		mav.addObject("multipleList", multipleList);
		mav.addObject("lastRun", lastRun);
		
		mav.setViewName("homeView");
		return mav;
    }
	
	private List<String> getList( String path )
	{
		List<String> result = new ArrayList<String>();
		
		try{
			File folder = new File(path);
			File[] listOfFiles = folder.listFiles();
	
			for (File file : listOfFiles) {
			    if (file.isFile()) {
			    	
			    	String name = file.getName();
			    	String[] parts = name.split("\\.");
			    	String toAdd = parts[0];
			    	if( !result.contains(toAdd) )
			    	{
			    		result.add( toAdd );
			    	}
			    }
			}
		}catch(Exception e)
		{
			
		}
		return result;
	}
	
	private RunNumDate getLastRun(String path)
	{
		File folder = new File(path);
		File[] listOfFiles = folder.listFiles();
		
		RunNumDate result = new RunNumDate();
		int lastNum = 0;
		String lastDate = "";
		try{
			for (File file : listOfFiles) {
			    if (file.isFile()) {
			    	String name = file.getName();
			    	String beforeSlash = name.split("-")[0];
			    	String afterUnderscore = beforeSlash.split("_")[1];
			    	Integer runNumber = 0;
			    	try{
			    		runNumber = Integer.valueOf( afterUnderscore );
			    	}catch(Exception e)
			    	{
			    		System.out.println("uno dei dati ha un nome atipico");
			    	}
			    	if( runNumber > lastNum )
			    	{
			    		lastNum = runNumber;
			    		lastDate = name.split("-")[1] + " - " + name.split("-")[2] + " - " + name.split("-")[3];
			    	}
			    }
			}
			result.setNum(lastNum);
			result.setDate(lastDate);
		}catch(Exception e)
		{
			
		}
		return result;
	}
	
}
