package com.example.demo.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.executor.OggettoParametriRun;

@Controller
@RequestMapping("/execute")
public class BashExecutor {
	

    @RequestMapping(method = RequestMethod.GET)
    public @ResponseBody OggettoParametriRun getParameters( @RequestParam("para1") String para1 , @RequestParam("para2") String para2 )
    {
    	OggettoParametriRun opr = new OggettoParametriRun();
    	opr.setPara1(para1);
    	opr.setPara2(para2);
    	execute(opr);
    	return opr;
    }
    
    private void execute(OggettoParametriRun opr)
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
