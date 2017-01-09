package com.walkerChen.estore.commonUtils;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.Random;

import javax.imageio.ImageIO;

public class IdenticalImage {
	//自定义默认的验证码样式字体文本
	public static final String VERIFY_CODES="123456789ABCDEFGHIJKLMNOPQRSTVWUXYZabcdefghijklmnopqrstvwuxyz";
	private static Random random = new Random();
	/**
	 * 
	 * @param verifySize 验证的的长度
	 * @return
	 */
	public  String generateVerifyCode(int verifySize){
		return generateVerifyCode(verifySize , VERIFY_CODES);
	}
	/**
	 * 
	 * @param verifySize 验证码 长度
	 * @param sources 外部指定的验证码的字体文本样式
	 * @return
	 */
	public  String generateVerifyCode(int verifySize , String sources){
		if(sources==null || sources.trim().length()==0){
			sources=VERIFY_CODES;
		}
		int codesLen = sources.length();
		Random random = new Random(System.currentTimeMillis());
		StringBuilder verifyCode = new StringBuilder(verifySize);//初始化容量大小
		for(int i = 0 ; i<verifySize;i++){
			verifyCode.append(sources.charAt(random.nextInt(codesLen-1)));//根据验证大小插入随机下标的文字
		}
		return verifyCode.toString();
	}
	/**
	 * 生成随机图片文件,并返回验证码的值
	 * @param width
	 * @param height
	 * @param outputFile
	 * @param verifySize
	 * @return
	 * @throws IOException
	 */
	public  String outputVerifyImage(int width , int height ,File outputFile, int verifySize) throws IOException{
		String verifyCode  = generateVerifyCode(verifySize);
		outputImage(width , height , outputFile , verifyCode);
		return verifyCode;
	}
	
	/**
	 * 输出随机验证码图片流，并返回验证码值
	 * @param width
	 * @param height
	 * @param os
	 * @param verifySize
	 * @return
	 * @throws IOException
	 */
	public  String outputVerifyImage(int width , int height , OutputStream os , int verifySize) throws IOException{
		String verifyCode  = generateVerifyCode(verifySize);
		outputImage(width , height , os , verifyCode);
		return verifyCode;
	}
	/**
	 * 生成指定的验证码图像文件
	 * @param width
	 * @param height
	 * @param outputFile
	 * @param verifyCode
	 * @throws IOException
	 */
	public  void outputImage(int width , int height , File outputFile , String verifyCode) throws IOException{
		if(outputFile == null){
			return ;
		}
		File dir = outputFile.getParentFile();
		if(!dir.exists()){
			dir.mkdirs();
		}
		outputFile.createNewFile();
		FileOutputStream fos = new FileOutputStream(outputFile);
		outputImage(width, height , fos , verifyCode);
		fos.close();
	}
	/**
	 * 指定输出验证码图片流
	 * @param width
	 * @param height
	 * @param os
	 * @param verifyCode
	 * @throws IOException
	 */
	public  void outputImage(int width  , int height , OutputStream os , String verifyCode) throws IOException{
		int verifySize = verifyCode.length();
		BufferedImage image = new BufferedImage(width , height , BufferedImage.TYPE_INT_RGB);//绘制图片缓冲器皿
		Random rand = new Random();//随机函数对象
		Graphics2D graphics2D = image.createGraphics();//创建2D绘图画笔
		graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING,RenderingHints.VALUE_ANTIALIAS_ON);//启用渲染效果
		Color[] colors = new Color[5];//初始容量的空间为5个
		Color[] colorSpaces = new Color[]{Color.WHITE , Color.CYAN,Color.GRAY,Color.LIGHT_GRAY,Color.MAGENTA,Color.ORANGE,Color.PINK,Color.YELLOW};//会被用到的颜色
		//分数概念 fractions
		float[] fractions = new float[colors.length];//根据颜色colors的长度
		for(int i = 0 ; i<colors.length;i++){
			colors[i] = colorSpaces[rand.nextInt(colorSpaces.length)];//随机从(colorSpaces)颜色场地取出颜色值放入colors数组中
			fractions[i] = rand.nextFloat();
		}
		Arrays.sort(fractions);
		graphics2D.setColor(Color.GRAY);//设置边框色
		graphics2D.fillRect(0, 0, width, height);
		
		Color c = getRandColor(200,250);
		graphics2D.setColor(c);//设置背景色
		graphics2D.fillRect(0, 2, width, height-4);
		
		//绘制干扰线
		Random random = new Random();
		graphics2D.setColor(getRandColor(160 , 200));//设置线条的颜色
		for(int i = 0 ; i<20 ; i++){
			int x = random.nextInt(width-1);
			int y = random.nextInt(height-1);
			int x1 = random.nextInt(6)+1;
			int y1 = random.nextInt(12)+1;
			graphics2D.drawLine(x , y , x+x1+40 , y+y1+20);
		}
		//添加噪点
		float yawpRate = 0.05f;//噪声率
		int area = (int)(yawpRate*width*height);
		for(int i = 0; i<area; i++){
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int rgb = getRandomIntColor();
			image.setRGB(x, y, rgb);
		}
		shear(graphics2D , width  , height , c);//是图片弯曲
		
		graphics2D.setColor(getRandColor(100 , 160));
		
		int fontSize = height-4;
		Font font = new Font("Algerian", Font.ITALIC,fontSize);
		graphics2D.setFont(font);
		char[] chars = verifyCode.toCharArray();
		for(int i = 0 ; i<verifySize ; i++){
			AffineTransform affine = new AffineTransform();//是字体相互交织改变形态
			affine.setToRotation(Math.PI/4 *rand.nextDouble()*(rand.nextBoolean()?1:-1),(width/verifySize)*i+fontSize/2, height/2);
			graphics2D.setTransform(affine);
			graphics2D.drawChars(chars , i , 1 , ((width-10)/verifySize)*i+5, height/2+fontSize/2-10);
		}
		graphics2D.dispose();//完成收工布置
		ImageIO.write(image, "jpg", os);
	}
	/**
	 * 
	 * @param fc foregroundColor
	 * @param bc backgroundColor
	 * @return
	 */
	private  Color getRandColor(int fc , int bc){
		if(fc>225) fc=225;
		if(bc>225) bc=225;
		int r = fc+random.nextInt(bc-fc);
		int g = fc+random.nextInt(bc-fc);
		int b = fc+random.nextInt(bc-fc);
		
		return new Color(r , g , b);
	}
	
	private  int getRandomIntColor(){
		int[] rgb = getRandomRgb();
		int color = 0;
		for(int c : rgb){
			color = color<<8;//获取所及颜色 右移8位
			color = color | c;
		}
		return color;
	}
	
	private  int[] getRandomRgb(){
		int[] rgb = new int[3];
		for(int i = 0 ; i<3 ; i++){
			rgb[i] = random.nextInt(225);
		}
		return rgb;
	}
	/**
	 * 裁剪
	 * @param graphics
	 * @param width
	 * @param height
	 * @param color
	 */
	private  void shear(Graphics graphics ,int width , int height, Color color){
		shearX(graphics , width , height , color);
		shearY(graphics , width , height , color);
	}
	private  void shearX(Graphics graphics , int width , int height , Color color){
		int period = random.nextInt(2);//随机阶段
		boolean borderGap = true;//边框间距
		int frames = 1;
		int phase = random.nextInt(2);//按阶段分布做
		for(int i = 0 ; i<height;i++){
			double d = (double)(period>>1)
					*Math.sin((double)i/(double)period
							+(6.2831853071795862D*(double)phase)/(double)frames);
			graphics.copyArea(0, i, width, 1, (int)d, 0);
			if(borderGap){
				graphics.setColor(color);
				graphics.drawLine((int)d, i, 0, i);
				graphics.drawLine((int)d+width, i, width, i);
			}
		}
		
	}
	private  void shearY(Graphics graphics , int width , int height ,Color color){
		int period = random.nextInt(40)+10;//50;
		boolean borderGap = true;
		int frames = 20;
		int phase = 7;
		for(int i = 0 ;i<width ; i++){
			double d = (double)(period>>1)
					*Math.sin((double)i/(double)period
							+(6.2831853071795862D*(double)phase)/(double)frames);
			graphics.copyArea(i, 0, 1, height, 0, (int)d);
			if(borderGap){
				graphics.setColor(color);
				graphics.drawLine(i ,(int)d , i, 0);
				graphics.drawLine(i, (int)d+height, i, height);
			}
		}
	}
	public static void main(String[] args) throws IOException{
		File dir = new File("F:/verfies");
		int width = 200 , height=80;
		IdenticalImage identicalImage = new IdenticalImage();
		for(int i =0 ; i<5 ; i++){
			String verifyCode = identicalImage.generateVerifyCode(4);
			File file = new File(dir , verifyCode+".jpg");
			identicalImage.outputImage(width , height, file , verifyCode);
		}
	}
}
