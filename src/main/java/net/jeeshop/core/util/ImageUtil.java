package net.jeeshop.core.util;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;

/**
 * 图片水印
 */
public class ImageUtil {
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String srcImgPath = "e:/QQ截图20140105122750.png";
		String iconPath = "e:\\doc\\logo\\itelse2.png";
		String targerPath = "e:/33333333333.jpg";
		// 给图片添加水印
		ImageUtil.waterMarkImageByIcon("java水印图片",iconPath, srcImgPath, targerPath, 0, 0,0, 0.9f);
		// 给图片添加水印,水印旋转-45
//		ImageUtil.waterMarkImageByIcon(iconPath, srcImgPath, 
//				targerPath, degree, width, height, clarity);
	}

	/**
	 * 给图片添加水印、可设置水印图片旋转角度
	 * 
	 * @param iconPath
	 *            水印图片路径
	 * @param srcImgPath
	 *            源图片路径
	 * @param targerPath
	 *            目标图片路径
	 * @param degree
	 *            水印图片旋转角度
	 * @param width
	 *            宽度(与左相比)
	 * @param height
	 *            高度(与顶相比)
	 * @param clarity
	 *            透明度(小于1的数)越接近0越透明
	 */
	public static void waterMarkImageByIcon(String logoText,String iconPath, String srcImgPath,
			String targerPath, Integer degree, Integer width, Integer height,
			float clarity) {
		OutputStream os = null;
		try {
			Image srcImg = ImageIO.read(new File(srcImgPath));
			System.out.println("width:" + srcImg.getWidth(null));
			System.out.println("height:" + srcImg.getHeight(null));
			BufferedImage buffImg = new BufferedImage(srcImg.getWidth(null),
					srcImg.getHeight(null), BufferedImage.TYPE_INT_RGB);
			// 得到画笔对象
			// Graphics g= buffImg.getGraphics();
			Graphics2D g = buffImg.createGraphics();
			// 设置对线段的锯齿状边缘处理
			g.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
					RenderingHints.VALUE_INTERPOLATION_BILINEAR);
			g.drawImage(
					srcImg.getScaledInstance(srcImg.getWidth(null),
							srcImg.getHeight(null), Image.SCALE_SMOOTH), 0, 0,
					null);
			if (null != degree) {
				// 设置水印旋转
				g.rotate(Math.toRadians(degree),
						(double) buffImg.getWidth() / 2,
						(double) buffImg.getHeight() / 2);
			}
			// 水印图象的路径 水印一般为gif或者png的，这样可设置透明度
			ImageIcon imgIcon = new ImageIcon(iconPath);
			// 得到Image对象。
			Image img = imgIcon.getImage();
			float alpha = clarity; // 透明度
			g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP,
					alpha));
			// 表示水印图片的位置
//			g.drawImage(img, width, height, null);
			g.drawImage(img, srcImg.getWidth(null) - img.getWidth(null), srcImg.getHeight(null) - img.getHeight(null), null);
			
//			g.drawString(logoText, srcImg.getWidth(null) - img.getWidth(null), srcImg.getHeight(null) - img.getHeight(null));
			
			g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER));
			g.dispose();
			os = new FileOutputStream(targerPath);
			// 生成图片
			ImageIO.write(buffImg, "JPG", os);
			System.out.println("添加水印图片完成!");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != os)
					os.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 给图片添加水印、可设置水印图片旋转角度
	 * 
	 * @param logoText
	 *            水印文字
	 * @param srcImgPath
	 *            源图片路径
	 * @param targerPath
	 *            目标图片路径
	 * @param degree
	 *            水印图片旋转角度
	 * @param width
	 *            宽度(与左相比)
	 * @param height
	 *            高度(与顶相比)
	 * @param clarity
	 *            透明度(小于1的数)越接近0越透明
	 */
	public static void waterMarkByText(String logoText, String srcImgPath,
			String targerPath, Integer degree, Integer width, Integer height,
			Float clarity) {
		// 主图片的路径
		InputStream is = null;
		OutputStream os = null;
		try {
			Image srcImg = ImageIO.read(new File(srcImgPath));
			BufferedImage buffImg = new BufferedImage(srcImg.getWidth(null),
					srcImg.getHeight(null), BufferedImage.TYPE_INT_RGB);
			// 得到画笔对象
			// Graphics g= buffImg.getGraphics();
			Graphics2D g = buffImg.createGraphics();
			// 设置对线段的锯齿状边缘处理
			g.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
					RenderingHints.VALUE_INTERPOLATION_BILINEAR);
			g.drawImage(
					srcImg.getScaledInstance(srcImg.getWidth(null),
							srcImg.getHeight(null), Image.SCALE_SMOOTH), 0, 0,
					null);
			if (null != degree) {
				// 设置水印旋转
				g.rotate(Math.toRadians(degree),
						(double) buffImg.getWidth() / 2,
						(double) buffImg.getHeight() / 2);
			}
			// 设置颜色
			g.setColor(Color.red);
			// 设置 Font
			g.setFont(new Font("宋体", Font.BOLD, 30));
			float alpha = clarity;
			g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP,
					alpha));
			// 第一参数->设置的内容，后面两个参数->文字在图片上的坐标位置(x,y) .
			g.drawString(logoText, width, height);
			g.dispose();
			os = new FileOutputStream(targerPath);
			// 生成图片
			ImageIO.write(buffImg, "JPG", os);
			System.out.println("添加水印文字完成!");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != is)
					is.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (null != os)
					os.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 图片缩放(图片等比例缩放为指定大小，空白部分以白色填充)
	 * 
	 * @param srcPath
	 *            源图片路径
	 * @param destPath
	 *            缩放后图片路径
	 */
	public static void zoomImage(String srcPath, String destPath,
			int destHeight, int destWidth) {
		try {
			BufferedImage srcBufferedImage = ImageIO.read(new File(srcPath));
			int imgWidth = destWidth;
			int imgHeight = destHeight;
			int srcWidth = srcBufferedImage.getWidth();
			int srcHeight = srcBufferedImage.getHeight();
			if (srcHeight >= srcWidth) {
				imgWidth = (int) Math
						.round(((destHeight * 1.0 / srcHeight) * srcWidth));
			} else {
				imgHeight = (int) Math
						.round(((destWidth * 1.0 / srcWidth) * srcHeight));
			}
			BufferedImage destBufferedImage = new BufferedImage(destWidth,
					destHeight, BufferedImage.TYPE_INT_RGB);
			Graphics2D graphics2D = destBufferedImage.createGraphics();
			graphics2D.setBackground(Color.WHITE);
			graphics2D.clearRect(0, 0, destWidth, destHeight);
			graphics2D.drawImage(srcBufferedImage.getScaledInstance(imgWidth,
					imgHeight, Image.SCALE_SMOOTH), (destWidth / 2)
					- (imgWidth / 2), (destHeight / 2) - (imgHeight / 2), null);
			graphics2D.dispose();
			ImageIO.write(destBufferedImage, "JPEG", new File(destPath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
