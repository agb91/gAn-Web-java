package com.example.demo.configurator;

import java.io.FileReader;
import java.io.FileWriter;

import org.exolab.castor.xml.Marshaller;
import org.exolab.castor.xml.Unmarshaller;
import org.springframework.stereotype.Service;


@Service
public class XmlManager {
	
	private FileWriter writer;
	private FileReader reader;
	
	public void convertFromObjectToXML(Object read, String path)
	{
		try {
			writer = new FileWriter(path);
			Marshaller.marshal(read, writer);
		} catch (Exception e) {
			System.out.println("marshaller ko");;
		}
	}
	
	public XmlObject convertFromXMLToObject(String path) 
	{
		XmlObject read = null;
		try {
			reader = new FileReader(path);
			read = (XmlObject) Unmarshaller.unmarshal(XmlObject.class, reader);
		} catch (Exception e) {
			System.out.println("un-marshaller ko");;
		}
		return read;
	}

}
