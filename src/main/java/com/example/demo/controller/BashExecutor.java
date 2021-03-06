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
	
	private String pathTogAn = "/opt/lampp/htdocs/test-interChangeble/gAn-SPERIMENTAL";
	
    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView getParameters( @ModelAttribute SendToExecute sendToExecute )
    {
    	System.out.println( "params: " + sendToExecute.toString() );
    	ModelAndView mav = new ModelAndView();
    	
    	String cardinality = getCardinality( sendToExecute );
    	
    	sendToExecute.setPath(pathTogAn);
    	String textualResult = execute( sendToExecute, cardinality );
    	
    	System.out.println("parameters: " + sendToExecute.toString() );
    	
    	mav.addObject("cardinality" , cardinality);
    	mav.addObject("runs" , sendToExecute.getRuns() );
    	mav.addObject("analysis" , sendToExecute.getUsedAnalysis());
    	mav.addObject("textualResult" , textualResult);

    	mav.setViewName("executeView");
    	
    	return mav;
    }
    
	private String execute(SendToExecute opr, String cardinality)
    {
		StringBuffer output = new StringBuffer();
		String commandSingle = "./src/main/resources/static/script/gAnStartSingle.sh";
		String commandMultiple = "./src/main/resources/static/script/gAnStartMultiple.sh";
		
		Process p;
		try {
			
			String commandWithArgs; 
			if( cardinality.equalsIgnoreCase("single") )
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
				output.append(line + "<br>");
				System.out.println(line + " \n ");
			}
			while ((line = reader2.readLine())!= null) { //just for debug!
				System.out.println(line + " \n ");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return output.toString();
    }
	
	private String getCardinality(SendToExecute sendToExecute) {
		if( sendToExecute.getRunM2().equalsIgnoreCase("none") )
		{
			return "single";
		}
		else
		{
			return "multiple";
		}
	}

}
