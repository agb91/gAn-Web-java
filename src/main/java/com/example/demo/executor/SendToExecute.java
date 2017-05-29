package com.example.demo.executor;

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
		return runM1;
	}
	public void setRunM1(String runM1) {
		this.runM1 = runM1;
	}
	public String getRunM2() {
		return runM2;
	}
	public void setRunM2(String runM2) {
		this.runM2 = runM2;
	}
	public String toString()
	{
		return this.runS1 + "---" + this.runM1 + "|" + this.runM2 + ";;;" + this.analysisSingle + "|" + this.analysisMultiple;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
}
