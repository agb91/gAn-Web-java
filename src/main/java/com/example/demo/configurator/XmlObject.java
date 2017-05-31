package com.example.demo.configurator;

import java.io.Serializable;

public class XmlObject implements Serializable{
	
	private String campo1 = "defaut1";
	private String campo2 = "default2";
	
	public String getCampo1() {
		return campo1;
	}
	
	public void setCampo1(String campo1) {
		this.campo1 = campo1;
	}
	
	public String getCampo2() {
		return campo2;
	}
	
	public void setCampo2(String campo2) {
		this.campo2 = campo2;
	}
	
	public String toString()
	{
		return "campo1: " + campo1 + "; campo2: " + campo2;
	}

}
