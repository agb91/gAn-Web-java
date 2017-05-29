package com.example.demo.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.executor.SendToExecute;


@Controller
@RequestMapping("/execute")
public class BashExecutor {
	
	private String pathTogAn = "/opt/lampp/htdocs/test-interChangeble/gAn-NEWWAY";
	
    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView getParameters( @ModelAttribute SendToExecute sendToExecute )
    {
    	System.out.println(sendToExecute.toString());
    	
    	ModelAndView mav = new ModelAndView();
    	SendToExecute opr = new SendToExecute();
    	
    	opr.setPath(pathTogAn);
    	
    	execute(opr);
    	mav.setViewName("executeView");
    	return mav;
    }
    
    @RequestMapping(method = RequestMethod.GET)//just for testing
    public ModelAndView getParametersGET()
    {
    	
    	ModelAndView mav = new ModelAndView();
    	SendToExecute opr = new SendToExecute();
    	opr.setPath(pathTogAn);
    	execute(opr);
    	mav.setViewName("executeView");
    	return mav;
    }
    
    private void execute(SendToExecute opr)
    {
		StringBuffer output = new StringBuffer();
		String commandSingle = "./src/main/resources/static/script/gAnStartSingle.sh";
		String commandMultiple = "./src/main/resources/static/script/gAnStartMultiple.sh";
		
		
		Process p;
		try {
			
			String commandWithArgs; 
			if( opr.getRunM2().equalsIgnoreCase("none") )
			{ //single
				commandWithArgs = commandSingle + " " + opr.getPath() + " " + opr.getRunS1() 
				+ " " + opr.getAnalysisSingle();
			}
			else //multiple
			{
				commandWithArgs = commandMultiple + " " + opr.getPath() + " " + opr.getRunM1() + " " + opr.getRunM2()
				+ " " + opr.getAnalysisMultiple();
			}
			
			p = Runtime.getRuntime().exec( commandWithArgs );
			p.waitFor();
			BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
			BufferedReader reader2 = new BufferedReader(new InputStreamReader(p.getErrorStream() ));
			
			String line = "";
			while ((line = reader.readLine())!= null) {
				output.append(line + "\n");
				System.out.println(line + " \n ");
			}
			while ((line = reader2.readLine())!= null) {
				output.append(line + "\n");
				System.out.println(line + " \n ");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println( output.toString() );
    }

}
