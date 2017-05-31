package com.example.demo.executor;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class SendToExecute {
	
	private String analysisSingle = "none";
	private String analysisMultiple = "none";
	private String runS1 = "none";
	private String runM1 = "none";
	private String runM2 = "none";
	private String path = "/";
	private String inputArea = "none";
	
	public List<String> getRunsFromInputArea()
	{
		inputArea = inputArea.trim().replaceAll(" ", "").replaceAll(";", "-").replaceAll(",", "-");
		String runs[] = inputArea.split("-");
		List<String> result = new ArrayList<String>();
		result.add( runs[0] );
		result.add( runs[1] );
		return result;
	}
	
	public String getRuns()
	{
		if( getCardinality().equalsIgnoreCase("single") )
		{
			return runS1;
		}
		else
		{
			if( !runM1.equalsIgnoreCase("none") && !runM2.equalsIgnoreCase("none") 
				&& !runM1.equalsIgnoreCase("") && !runM2.equalsIgnoreCase("")	)
			{
				return runM1 + " - " + runM2;
			}
			else
			{
				List<String> runs = getRunsFromInputArea(); 
				return runs.get(0) + " - " + runs.get(1);
			}
		}
	}
	public String getCardinality()
	{
		if( !analysisSingle.equalsIgnoreCase("none") && !analysisSingle.equalsIgnoreCase("") )
		{
			return "single";
		}
		else
		{
			return "multiple";
		}
	}
	public String getUsedAnalysis()
	{
		if( !analysisSingle.equalsIgnoreCase("none") && !analysisSingle.equalsIgnoreCase("") )
		{
			return analysisSingle;
		}
		else
		{
			return analysisMultiple;
		}
	}
	public String getAnalysisSingle() {
		return analysisSingle;
	}
	public void setAnalysisSingle(String analysisSingle) {
		this.analysisSingle = analysisSingle;
	}
	public String getAnalysisMultiple() {
		return analysisMultiple;
	}
	public void setAnalysisMultiple(String analysisMultiple) {
		this.analysisMultiple = analysisMultiple;
	}
	public String getRunS1() {
		return runS1;
	}
	public void setRunS1(String runS1) {
		this.runS1 = runS1;
	}
	public String getRunM1() {
		if( !runM1.equalsIgnoreCase("none") && !runM1.equalsIgnoreCase("") )
		{
			return runM1;
		}
		else
		{
			return getRunsFromInputArea().get(0);
		}
	}
	public void setRunM1(String runM1) {
		this.runM1 = runM1;
	}
	public String getRunM2() {
		if( !runM2.equalsIgnoreCase("none") && !runM2.equalsIgnoreCase(""))
		{
			return runM2;
		}
		else
		{
			return getRunsFromInputArea().get(1);
		}
	}
	public void setRunM2(String runM2) {
		this.runM2 = runM2;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getInputArea() {
		return inputArea;
	}
	public void setInputArea(String inputArea) {
		this.inputArea = inputArea;
	}
	public String toString()
	{
		return getRunS1() + "|" + getRunM1() + "|" + getRunM2() + ";;;" + this.analysisSingle + "|" 
				+ this.analysisMultiple + "; area: |" + inputArea + "|";
	}
	
}
