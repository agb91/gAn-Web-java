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
    	XmlObject read = new XmlObject();
    	
    	//read = xmlManager.convertFromXMLToObject(path);
    	read.setCampo1("test1");
    	read.setCampo2("test2");
    	mav.addObject("readXml", read);
    	mav.setViewName("configView");
        return mav;
    }
    
    @RequestMapping(value="/set" ,method = RequestMethod.GET)
    public void writeXml( XmlObject xmlObject )
    {
    	System.out.println( "in WriteXMl received the object: " + xmlObject.toString() );
    	//xmlManager.convertFromObjectToXML(xmlObject, path);
    }
    

}
