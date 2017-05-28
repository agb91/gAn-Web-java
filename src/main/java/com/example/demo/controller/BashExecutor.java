package com.example.demo.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;

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
	

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView getParameters( @ModelAttribute SendToExecute sendToExecute )
    {
    	System.out.println(sendToExecute.toString());
    	
    	ModelAndView mav = new ModelAndView();
    	SendToExecute opr = new SendToExecute();
    	
    	//execute(opr);
    	mav.setViewName("executeView");
    	return mav;
    }
    
    private void execute(SendToExecute opr)
    {
		StringBuffer output = new StringBuffer();
		String command = "ping 8.8.8.8";
		
		Process p;
		try {
			p = Runtime.getRuntime().exec(command);
			p.waitFor();
			BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String line = "";
			while ((line = reader.readLine())!= null) {
				output.append(line + "\n");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println( output.toString() );
    }

}
