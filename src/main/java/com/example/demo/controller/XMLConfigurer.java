package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.configurator.XmlManager;
import com.example.demo.configurator.XmlObject;


@Controller
@RequestMapping("/config")
public class XMLConfigurer {

	@Autowired 
	private XmlManager xmlManager;
	
	private String path = "/opt/lampp/htdocs/test-interChangeble/gAn-NEWWAY/text.xml";
	
    
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView showXml()
    {
    	ModelAndView mav = new ModelAndView();
    	//XmlObject read = new XmlObject();
    	
    	//read = xmlManager.convertFromXMLToObject(path);
    	//mav.addObject("readXml", read);
    	mav.setViewName("configView");
        return mav;
    }
    
    @RequestMapping(value="/set", method = RequestMethod.GET)
    public void writeXml( @RequestParam("campo1") String campo1 , @RequestParam("campo2") String campo2 )
    {
    	XmlObject write = new XmlObject();
    	write.setCampo1(campo1);
    	write.setCampo2(campo2);
    	xmlManager.convertFromObjectToXML(write, path);
    }
    

}
