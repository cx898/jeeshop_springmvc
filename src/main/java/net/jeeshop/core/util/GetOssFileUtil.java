package net.jeeshop.core.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

/**  
 * Description： 
 * Author:lucktyy@gmail.com
 * Date:2014-9-19上午09:26:16
 */
public class GetOssFileUtil {

	private static final String prefix = "http://myshopxx.oss.aliyuncs.com/";
	
	public static void downOssFile(String path,String outputDir) {
		InputStream is = null;
		File outF = null;
		FileOutputStream fos = null;
		try {
			URL url = new URL(prefix+path);
			URLConnection connection = url.openConnection();
			is = connection.getInputStream();
			
			outF = new File(outputDir+path);
			
			File dir = new File(outF.getParent());
			if(!dir.exists()){
				dir.mkdirs();
			}
			
			fos = new FileOutputStream(outF);
			byte[]b = new byte[1024];
			int off = 0;
			int len = 100;
			while((off = is.read(b,0,len))!=-1){
				fos.write(b,0,off);
			}
			
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				fos.flush();
				fos.close();
				is.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void main(String[] args) {
//	  String file = "http://myshopxx.oss.aliyuncs.com/attached/image/20140304/1393902455326_3.jpg";	
//	  String outDir = "G:/";	
//	  downOssFile(file,outDir);
	  
	  String a [] = initData();
	  for(int i=0;i<a.length;i++){
		  String file = a[i];	
		  String outDir = "G:\\s\\";	
		  downOssFile(file,outDir);
	  }
	}
	

	public  static String[] initData(){
		String []a = {
				"attached/image/20140304/1393902455326_1.jpg",
				"attached/image/20140304/1393902438216_3.jpg",
				"attached/image/20140304/1393902455326_3.jpg",
				"attached/image/20140304/1393902463373_3.jpg",
				"attached/image/20140304/1393902469170_3.jpg",
				"attached/image/20130928/20130928233856_374.jpg",
				"attached/image/20140120/1390185477177_1.jpg",
				"attached/image/20140120/1390185469776_3.jpg",
				"attached/image/20140120/1390185471637_3.jpg",
				"attached/image/20140120/1390185473547_3.jpg",
				"attached/image/20140120/1390185477177_3.jpg",
				"attached/image/20131221/20131221143923_647.jpg",
				"attached/image/20140120/1390185469776_3.jpg",
				"attached/image/20140120/1390185473547_2.jpg",
				"attached/image/20140120/1390185477177_1.jpg",
				"attached/image/20140120/1390185471637_1.jpg",
				"attached/image/20131221/20131221154411_459.jpg",
				"attached/image/20131221/20131221154411_459.jpg",
				"attached/image/20131221/20131221154411_459.jpg",
				"attached/image/20131130/20131130212356_744.jpg",
				"attached/image/20131221/20131221143923_647.jpg",
				"attached/image/20131001/20131001165357_265.jpg",
				"attached/image/20140117/1389936528590_1.jpg",
				"attached/image/20140117/1389936867457_3.jpg",
				"attached/image/20140117/1389936528590_3.jpg",
				"attached/image/20140117/1389945532251_3.jpg",
				"attached/image/20140117/1389945532251_3.jpg",
				"attached/image/20140117/1389936528590_2.jpg",
				"attached/image/20140117/1389936867457_2.jpg",
				"attached/image/20140117/1389945532251_2.jpg",
				"attached/image/20140120/1390179604285_1.jpg",
				"attached/image/20140120/1390180802732_3.jpg",
				"attached/image/20140120/1390180805422_3.jpg",
				"attached/image/20140120/1390179604285_3.jpg",
				"attached/image/20140120/1390180802732_3.jpg",
				"attached/image/20140120/1390180805422_3.jpg",
				"attached/image/20140120/1390182251885_1.jpg",
				"attached/image/20140120/1390182249562_3.jpg",
				"attached/image/20140120/1390182250881_3.jpg",
				"attached/image/20140120/1390182251885_3.jpg",
				"attached/image/20140120/1390182251885_3.jpg",
				"attached/image/20140120/1390182249562_3.jpg",
				"attached/image/20140120/1390182250881_3.jpg",
				"attached/image/20140120/1390183557651_1.jpg",
				"attached/image/20140120/1390183555442_3.jpg",
				"attached/image/20140120/1390183557651_3.jpg",
				"attached/image/20140120/1390183555442_3.jpg",
				"attached/image/20140120/1390183557651_3.jpg",
				"attached/image/20140120/1390184008883_1.jpg",
				"attached/image/20140120/1390184007890_3.jpg",
				"attached/image/20140120/1390184008883_3.jpg",
				"attached/image/20140120/1390184007890_3.jpg",
				"attached/image/20140120/1390184008883_3.jpg",
				"attached/image/20140117/1389936528590_1.jpg",
				"attached/image/20140117/1389936867457_3.jpg",
				"attached/image/20140117/1389936528590_3.jpg",
				"attached/image/20140117/1389945532251_3.jpg",
				"attached/image/20140117/1389945532251_3.jpg",
				"attached/image/20140117/1389945532251_2.jpg",
				"attached/image/20140117/1389936867457_2.jpg",
				"attached/image/20140117/1389936528590_2.jpg",
				"attached/image/20140304/1393898334824_1.jpg",
				"attached/image/20140226/1393422673232_3.jpg",
				"attached/image/20140226/1393422674246_3.jpg",
				"attached/image/20140226/1393422674564_3.jpg",
				"attached/image/20140226/1393422674908_3.jpg",
				"attached/image/20140304/1393898342918_3.jpg",
				"attached/image/20140304/1393898312199_3.jpg",
				"attached/image/20140304/1393898325574_3.jpg",
				"attached/image/20140304/1393898346762_1.jpg",
				"attached/image/20140226/1393423350334_3.jpg",
				"attached/image/20140226/1393423350965_3.jpg",
				"attached/image/20140226/1393423351312_3.jpg",
				"attached/image/20140304/1393898346762_2.jpg",
				"attached/image/20140304/1393898353965_1.jpg",
				"attached/image/20140304/1393898312199_3.jpg",
				"attached/image/20140304/1393898325574_3.jpg",
				"attached/image/20140304/1393898334824_3.jpg",
				"attached/image/20140304/1393898342918_3.jpg",
				"attached/image/20140304/1393898346762_3.jpg",
				"attached/image/20140304/1393898353965_3.jpg",
				"attached/image/20140304/1393898360387_3.jpg",
				"attached/image/20140304/1393898362090_3.gif",
				"attached/image/20140304/1393898360387_2.jpg",
				"attached/image/20140304/1393898353965_2.jpg",
				"attached/image/20140304/1393898826002_1.jpg",
				"attached/image/20140304/1393898826002_3.jpg",
				"attached/image/20140304/1393898934597_1.jpg",
				"attached/image/20140304/1393898934597_3.jpg",
				"attached/image/20140304/1393899445649_1.jpg",
				"attached/image/20140304/1393899449071_2.jpg",
				"attached/image/20140304/1393899445649_3.jpg",
				"attached/image/20140304/1393899652464_1.jpg",
				"attached/image/20140304/1393899652464_3.jpg",
				"attached/image/20140304/1393900153455_1.jpg",
				"attached/image/20140304/1393900153455_3.jpg",
				"attached/image/20140304/1393900160471_3.jpg",
				"attached/image/20140304/1393900165861_3.jpeg",
				"attached/image/20140304/1393900297582_1.jpg",
				"attached/image/20140304/1393900297582_3.jpg",
				"attached/image/20140304/1393900298738_3.jpg",
				"attached/image/20140304/1393900429646_1.jpg",
				"attached/image/20140304/1393900429646_3.jpg",
				"attached/image/20140304/1393901242967_1.jpg",
				"attached/image/20140304/1393901242967_3.jpg",
				"attached/image/20140304/1393901247967_3.jpg",
				"attached/image/20140304/1393901252561_3.jpg",
				"attached/image/20140304/1393901609768_1.png",
				"attached/image/20140304/1393901609768_3.png",
				"attached/image/20140304/1393901472517_3.jpg",
				"attached/image/20140304/1393901989351_1.jpg",
				"attached/image/20140304/1393901965117_3.jpg",
				"attached/image/20140304/1393901966492_3.jpg",
				"attached/image/20140304/1393901968382_3.jpg",
				"attached/image/20140304/1393901979726_3.png",
				"attached/image/20140304/1393901989351_3.jpg",
				"attached/image/20140304/1393918441763_1.jpg",
				"attached/image/20140304/1393918441763_3.jpg",
				"attached/image/20140304/1393918665327_1.jpg",
				"attached/image/20140304/1393918655187_3.jpg",
				"attached/image/20140304/1393918663624_3.jpg",
				"attached/image/20140304/1393918665327_3.jpg",
				"attached/image/20140304/1393918663624_1.jpg",
				"attached/image/20140304/1393918882002_3.png",
				"attached/image/20140304/1393919400759_1.jpg",
				"attached/image/20140304/1393919255851_3.jpg",
				"attached/image/20140304/1393919343852_3.jpg",
				"attached/image/20140304/1393919350117_3.jpg",
				"attached/image/20140304/1393919355367_3.jpg",
				"attached/image/20140304/1393919400759_3.jpg",
				"attached/image/20140304/1393920033876_1.png",
				"attached/image/20140304/1393920033876_3.png",
				"attached/image/20140304/1393920058595_3.jpg",
				"attached/image/20140304/1393920623335_1.jpg",
				"attached/image/20140304/1393920568615_3.jpg",
				"attached/image/20140304/1393920605725_3.jpg",
				"attached/image/20140304/1393920623335_3.jpg",
				"attached/image/20140304/1393921204764_1.jpg",
				"attached/image/20140304/1393921204764_3.jpg",
				"attached/image/20140304/1393921209108_3.jpg",
				"attached/image/20140304/1393921211905_3.jpg",
				"attached/image/20140304/1393921214405_3.jpg",
				"attached/image/20140304/1393921216921_3.jpg",
				"attached/image/20140304/1393921214405_1.jpg",
				"attached/image/20140304/1393921209108_3.jpg",
				"attached/image/20140304/1393919400759_1.jpg",
				"attached/image/20140306/1394071041591_1.png",
				"attached/image/20140306/1394070385616_3.png",
				"attached/image/20140306/1394070433695_3.png",
				"attached/image/20140306/1394071041591_3.png",
				"attached/image/20140306/1394072191622_1.png",
				"attached/image/20140306/1394072191622_3.png",
				"attached/image/20140306/1394072205122_3.png",
				"attached/image/20140306/1394072212356_3.jpg",
				"attached/image/20140306/1394072216638_3.jpg",
				"attached/image/20140306/1394073843314_1.png",
				"attached/image/20140306/1394073843314_3.png",
				"attached/image/20140306/1394073989877_1.jpg",
				"attached/image/20140306/1394073989877_3.jpg",
				"attached/image/20140306/1394074088503_1.jpg",
				"attached/image/20140306/1394074088503_3.jpg",
				"attached/image/20140306/1394074242614_1.png",
				"attached/image/20140306/1394074242614_3.png",
				"attached/image/20140307/1394154849347_1.gif",
				"attached/image/20140307/1394154849347_3.gif",
				"attached/image/20140307/1394155186148_1.jpg",
				"attached/image/20140307/1394155358180_3.png",
				"attached/image/20140307/1394155186148_3.jpg",
				"attached/image/20140307/1394155840343_1.jpg",
				"attached/image/20140307/1394155826389_3.png",
				"attached/image/20140307/1394155840343_3.jpg",
				"attached/image/20140307/1394155860437_3.jpg",
				"attached/image/20140307/1394155880687_3.jpg",
				"attached/image/20140307/1394156602227_1.jpg",
				"attached/image/20140307/1394156583336_3.jpg",
				"attached/image/20140307/1394156593399_3.jpg",
				"attached/image/20140307/1394156602227_3.jpg",
				"attached/image/20140307/1394156612165_3.jpg",
				"attached/image/20140307/1394156648368_3.jpg",
				"attached/image/20140307/1394156665103_3.jpg",
				"attached/image/20140307/1394156678728_3.jpg",
				"attached/image/20140307/1394156678728_3.jpg",
				"attached/image/20140307/1394156593399_3.jpg",
				"attached/image/20140307/1394156648368_3.jpg",
				"attached/image/20140307/1394157908227_1.jpg",
				"attached/image/20140307/1394157857023_3.jpg",
				"attached/image/20140307/1394157869023_3.jpg",
				"attached/image/20140307/1394157881523_3.jpg",
				"attached/image/20140307/1394157891445_3.jpg",
				"attached/image/20140307/1394157901023_3.jpg",
				"attached/image/20140307/1394157908227_3.jpg",
				"attached/image/20140312/1394592717230_1.jpg",
				"attached/image/20140312/1394592717230_3.jpg",
				"attached/image/20140312/1394594435641_1.jpg",
				"attached/image/20140312/1394594435641_3.jpg",
				"attached/image/20140312/1394594577877_1.jpg",
				"attached/image/20140312/1394594581127_3.jpg",
				"attached/image/20140312/1394594577877_3.jpg",
				"attached/image/20140312/1394594714269_1.jpg",
				"attached/image/20140312/1394594714269_3.jpg",
				"attached/image/20140312/1394607670479_1.png",
				"attached/image/20140312/1394603899489_3.jpg",
				"attached/image/20140312/1394608028416_1.jpg",
				"attached/image/20140312/1394608028416_3.jpg",
				"attached/image/20140312/1394608030978_3.jpg",
				"attached/image/20140312/1394619270729_1.jpg",
				"attached/image/20140312/1394619830846_1.png",
				"attached/image/20140312/1394619830846_3.png",
				"attached/image/20140312/1394620734125_1.png",
				"attached/image/20140312/1394620734125_3.png",
				"attached/image/20140312/1394621019550_1.png",
				"attached/image/20140312/1394621019550_3.png",
				"attached/image/20140312/1394621233381_1.png",
				"attached/image/20140312/1394621233381_3.png",
				"attached/image/20140312/1394621458962_1.png",
				"attached/image/20140312/1394621458962_3.png",
				"attached/image/20140313/1394674397095_1.jpg",
				"attached/image/20140313/1394674397095_3.jpg",
				"attached/image/20140313/1394674592160_1.jpg",
				"attached/image/20140313/1394674592160_3.jpg",
				"attached/image/20140313/1394674696177_1.jpg",
				"attached/image/20140313/1394674696177_3.jpg",
				"attached/image/20140313/1394674782662_1.jpg",
				"attached/image/20140313/1394674782662_3.jpg",
				"attached/image/20140313/1394674918414_1.jpg",
				"attached/image/20140313/1394674918414_3.jpg",
				"attached/image/20140313/1394675034290_1.jpg",
				"attached/image/20140313/1394675034290_3.jpg",
				"attached/image/20140313/1394675039618_3.jpg",
				"attached/image/20140313/1394675246731_1.jpg",
				"attached/image/20140313/1394675246731_3.jpg",
				"attached/image/20140313/1394675343763_1.jpg",
				"attached/image/20140313/1394675343763_3.jpg",
				"attached/image/20140313/1394675483968_1.jpg",
				"attached/image/20140313/1394675483968_3.jpg",
				"attached/image/20140313/1394675582579_1.jpg",
				"attached/image/20140313/1394675582579_3.jpg",
				"attached/image/20140314/1394759145130_1.jpg",
				"attached/image/20140314/1394759145130_3.jpg",
				"attached/image/20140314/1394759447883_1.jpg",
				"attached/image/20140314/1394759447883_3.jpg",
				"attached/image/20140314/1394759695198_1.jpg",
				"attached/image/20140314/1394759695198_3.jpg",
				"attached/image/20140314/1394759781761_1.jpg",
				"attached/image/20140314/1394759781761_3.jpg",
				"attached/image/20140314/1394759927295_1.jpg",
				"attached/image/20140314/1394759927295_3.jpg",
				"attached/image/20140314/1394760096844_1.jpg",
				"attached/image/20140314/1394760096844_3.jpg",
				"attached/image/20140317/1395022939980_1.jpg",
				"attached/image/20140317/1395022939980_3.jpg",
				"attached/image/20140317/1395023031934_1.jpg",
				"attached/image/20140317/1395023031934_3.jpg",
				"attached/image/20140317/1395023151061_1.jpg",
				"attached/image/20140317/1395023151061_3.jpg",
				"attached/image/20140304/1393899445649_3.jpg",
				"attached/image/20140304/1393900297582_3.jpg",
				"attached/image/20140304/1393902455326_3.jpg",
				"attached/image/20140304/1393900298738_3.jpg",
				"attached/image/20140421/1398051870352_3.png",
				"attached/image/20140421/1398051878430_3.png",
				"attached/image/20140421/1398051862399_3.png",
				"attached/image/20140421/1398051857586_3.png",
				"attached/image/20140421/1398051894024_3.png",
				"attached/image/20140421/1398051885352_3.png",
				"attached/image/20140421/1398051844211_3.png",
				"attached/image/20140421/1398051873055_3.png",
				"attached/image/20140304/1393898334824_3.jpg",
				"attached/image/20140304/1393898353965_3.jpg",
				"attached/image/20140304/1393901989351_3.jpg",
				"attached/image/20140616/1402924030591_3.png"
		};
		return a;
	}
	
	{  
//		找不到的图片
//		http://myshopxx.oss.aliyuncs.com/attached/image/20140226/1393422674246_3.jpg
//		http://myshopxx.oss.aliyuncs.com/attached/image/20140226/1393422674564_3.jpg
//		http://myshopxx.oss.aliyuncs.com/attached/image/20140226/1393422674908_3.jpg
//		http://myshopxx.oss.aliyuncs.com/attached/image/20140226/1393423350334_3.jpg
//		http://myshopxx.oss.aliyuncs.com/attached/image/20140226/1393423350965_3.jpg
//		http://myshopxx.oss.aliyuncs.com/attached/image/20140226/1393423351312_3.jpg
	}
}
