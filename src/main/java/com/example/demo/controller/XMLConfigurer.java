package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	private String path = "/opt/lampp/htdocs/test-interChangeble/gAn-SPERIMENTAL/text.xml";
	
    
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView showXml()
    {
    	ModelAndView mav = new ModelAndView();
    	XmlObject read = new XmlObject();
    	
    	read = xmlManager.convertFromXMLToObject(path);
    	System.out.println("read: " + read.toString());
    	mav.addObject("readXml", read);
    	mav.setViewName("configView");
        return mav;
    }
    
    @RequestMapping(value="/set" ,method = RequestMethod.GET)
    public void writeXml( @ModelAttribute XmlObject xmlObject )
    {
    	
    	System.out.println( "in WriteXMl received the object: " + xmlObject.toString() );
    	try
    	{
    		xmlManager.convertFromObjectToXML(xmlObject, path);
    	}catch(Exception e)
    	{
    		System.out.println("problem saving");
    	}
    }
    
    @RequestMapping(value="/test" ,method = RequestMethod.GET)
    public void writeXmlTest()
    {
    	 XmlObject xmlObject = new XmlObject();
    	 xmlObject.setCampo1("aaaa");
    	 xmlObject.setCampo2("bbbbbb");
    	 xmlManager.convertFromObjectToXML(xmlObject, path);
    }
    

}
