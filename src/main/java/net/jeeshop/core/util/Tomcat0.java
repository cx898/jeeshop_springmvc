package net.jeeshop.core.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class Tomcat0 {
	public static void main(String[] args) throws IOException {
//		Process p = Runtime.getRuntime().exec("cmd /c start E:\\apache-tomcat-6.0.35\\bin\\startup.bat");
//		System.out.println(p);
//		InputStream in = p.getInputStream();
//		while(in.read()!=-1){
//			System.out.println(in.read());
//		}
		
		Process p;    
		try      
        {      
           //执行命令      
            p = Runtime.getRuntime().exec("E:\\apache-tomcat-6.0.35\\bin\\startup.bat");      
           //取得命令结果的输出流      
            InputStream fis=p.getInputStream();      
           //用一个读输出流类去读      
            InputStreamReader isr=new InputStreamReader(fis);      
           //用缓冲器读行      
            BufferedReader br=new BufferedReader(isr);      
            String line=null;      
           //直到读完为止      
           while((line=br.readLine())!=null)      
            {      
                System.out.println(line);      
            }      
        }      
       catch (IOException e)      
        {      
            e.printStackTrace();      
        }      
	}
}
