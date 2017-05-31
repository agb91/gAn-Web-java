package com.example.demo;

import static org.junit.Assert.*;

import java.util.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.example.demo.executor.SendToExecute;

@RunWith(SpringRunner.class)
@SpringBootTest
public class GAnWebApplicationTests {

	
	
	@Test
	public void testSendToExecute() {
		SendToExecute test1 = new SendToExecute();
		
		test1.setInputArea("  1234 ;234");
		List<String> expected = (List) Arrays.asList("1234","234");
		assertEquals( test1.getRunsFromInputArea() , expected );
		assertEquals( test1.getRunM1() , "1234" );
		assertEquals( test1.getRunM2() , "234" );
		
		test1.setRunM1("111");
		assertEquals( test1.getRunM1() , "111" );
		assertEquals( test1.getRunM2() , "234" );
		
		test1.setRunM2("222");
		assertEquals( test1.getRunM1() , "111" );
		assertEquals( test1.getRunM2() , "222" );
		
		assertEquals( test1.getCardinality().toLowerCase() , "multiple" );
	}

}
