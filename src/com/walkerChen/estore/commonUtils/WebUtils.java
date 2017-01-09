package com.walkerChen.estore.commonUtils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.net.InetAddress;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import com.walkerChen.estore.bean.backstage.Admin;
import com.walkerChen.estore.businessFactory.DaoAuthorityFactory;
import com.walkerChen.estore.businessService.BusinessService;
import com.walkerChen.estore.businessService.BusinessServiceImpl;
public class WebUtils {
	private String FileName=null;
	
	public void setFileName(String fileName) {
		FileName = fileName;
	}

	public String getFileName() {
		return FileName;
	}
	public static <T>T requestToBean(HttpServletRequest request , Class<T> classBean){
		try{
			T bean = classBean.newInstance();
			Map<String, String[]> map = request.getParameterMap();
			BeanUtils.populate(bean, map);
			return bean;
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	
	@SuppressWarnings("all")
	public <T>T servletFileUploadToBean(HttpServletRequest request , Class<T> beanClass , String[] limitFileSuffixTypes){
		T bean;
		try {
			bean = beanClass.newInstance();
			DiskFileItemFactory factory = new DiskFileItemFactory();
			createFileInfo(request.getServletContext().getRealPath("/temp"));
			factory.setRepository(new File(request.getServletContext().getRealPath("/temp")));
			System.out.println("wo shi zai 58 hang de shang zai wen jian de java wen jian  zhong 临时文件真是目录"+request.getServletContext().getRealPath("/temp"));
			factory.setSizeThreshold(1024*1024);//设置最低文件大小的门槛 (threshold : 阈；门槛；起点；开端)
			ServletFileUpload fileUpload = new ServletFileUpload(factory);
			fileUpload.setHeaderEncoding("UTF-8");
			fileUpload.setFileSizeMax(1024*1024*20);
			fileUpload.setProgressListener(new ProgressListener(){
				private long megaBytes = -1;
				@Override
				public void update(long pBytesRead,
								   long pContentLength, int pItems) {
					long mBytes = pBytesRead / 1000000;
					if (megaBytes == mBytes) {
						return;
					}
					//so far ： 目前为止
					megaBytes = mBytes;
					System.out.println("We are currently reading item "
							+ pItems);
					if (pContentLength == -1) {
						System.out.println("So far, " + pBytesRead
								+ " bytes have been read.");
					} else {
						System.out.println("So far, " + pBytesRead
								+ " of " + pContentLength
								+ " bytes have been read.");
					}
				}});
			System.out.println("wo shi zai 85 hang de shang zai wen jian de java wen jian  zhong 进行文件判断"+ServletFileUpload.isMultipartContent(request));
			if(!ServletFileUpload.isMultipartContent(request)){//判断uploadFile 是不是多元复合文件内容，既有返回的文件(图片，视频，文本文件)类型，也有返回的字符串类型，如果不是就按字符类型处理
				Map<String, String[]> map = request.getParameterMap();
				Set<Entry<String, String[]>> entrySet = map.entrySet();
				Iterator<Entry<String, String[]>> iterator = entrySet.iterator();
				while(iterator.hasNext()){
					Entry<String, String[]> entry= iterator.next();
					String name = entry.getKey();
					String[] valueArray = entry.getValue();
					if(valueArray.length>1){
						String value =Arrays.toString(valueArray);//将数组转换成字符串
						BeanUtils.setProperty(bean, name, value);
					}else if(valueArray.length==1){
						String value =Arrays.toString(valueArray);//将数组转换成字符串
						value = value.replace("[", "");
						value = value.replace("]", "");
						BeanUtils.setProperty(bean, name, value.trim());
					}else{
						continue;
					}
				}
				System.out.println("wo shi zai 106 hang de shang zai wen jian de java wen jian  zhong ");
				return  bean;
			}
			List<FileItem> fileItems =fileUpload.parseRequest(request);//解析传过来的request(包含一系列的参数值)
			System.out.println("wo shi zai 110 hang de shang zai wen jian de java wen jian  zhong 判断fileItems是否真是存在"+fileItems+"\n\t如果真实存在文件大小"+fileItems.size());
			if(fileItems != null){
				for(FileItem fileItem:fileItems){
					if(fileItem != null){
						if(fileItem.isFormField()){//判断fileItem是不是表格字段（字符串）
							String fieldName = fileItem.getFieldName();
							String fieldValue = fileItem.getString("UTF-8");//获取字符串以UTF-8模式
							BeanUtils.setProperty(bean, fieldName, fieldValue);
						}else{//否则就是文件(图片，视频，文本文件)类型
							String filename = fileItem.getName();//获取的是上载文件(图片，视频，文本文件)类型的名字 ， 不是表格字段的name
							if(filename==null || filename.trim().equals("")){//判断该上载文件向是否存在
								continue;
							}
							/*setFileItemName(filename);//记录历史文件名，如果重复文件名就不要往下执行
							if(filename.equals(getFileItemName())){
								continue;
							}*/
							//根据文件类型后缀判断
							for(String suffix:limitFileSuffixTypes){
								int index = filename.lastIndexOf('.');
								String fileSuffix = filename.substring(index, filename.trim().length());
								if(suffix.contains(".")){//判断用户给的限制文件类型是否包含点
									if(!suffix.equalsIgnoreCase(fileSuffix)){
										throw new com.walkerChen.estore.commonUtils.MySecurityException("unsupportFileType");
									}
								}else{
									fileSuffix=fileSuffix.substring(1,fileSuffix.length());
									if(!suffix.equalsIgnoreCase(fileSuffix)){
										throw new com.walkerChen.estore.commonUtils.MySecurityException("unsupportFileType");
									}
								}
							}
							//如果存在还要处理以下问题
							//IE6浏览器下获取的上传文件名带路径：C:\Users\hareClase\Pictures\Saved Pictures\学号.txt
							//IE6以后的浏览器是直接文件名 学号.txt
							filename=filename.substring(filename.lastIndexOf("\\")+1);
							filename=generateUniqueFilename(filename);
							String filepath=generateScatterFilepath
									(request.getServletContext().getRealPath("/" + "WEB-INF" + "/"+ "uploadFile"),filename);//以文件名的hashCode码生成文件目录,文件路径已包含文件
							InputStream inputStream = fileItem.getInputStream();
							System.out.println(filepath);//这里输出一定要文件名字和分割路径
							FileOutputStream out = new FileOutputStream(filepath);
							byte[] buffered = new byte[1024];
							int len = 0;
							while((len=inputStream.read(buffered))>0){
								out.write(buffered, 0, len);
							}
							BeanUtils.setProperty(bean, fileItem.getFieldName(), (filepath)); //product (iconurl     varchar(225))     <input type="file" name="iconurl">
							setFileName((filepath));
							System.out.println(FileName);
							out.flush();
							out.close();
							inputStream.close();
							fileItem.delete();//把文件项目删除，防止设置零时缓冲区有逗留的缓存文件 factory.setRepository(filepath)临时仓库 ， 一定要记住
						}
						System.out.println(fileItem+" I am file datd!.................");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new com.walkerChen.estore.commonUtils.MySecurityException("uploadDataError");
		}
		return bean;
	}
	public String generateUniqueFilename(String filename){
		int index = filename.lastIndexOf('.');
		String fileSuffix = filename.substring(index, filename.trim().length());
		return UUID.randomUUID().toString()+fileSuffix;
	}
	public String generateUnique(){
		return UUID.randomUUID().toString();
	}
	//windows系统，一个文件夹里如果有一千个文件打开就会非常缓慢，影响访问性能，因此要解决这个问题
	public String generateScatterFilepath(String filepath , String filename){
		int directory1= filename.hashCode()&15;//oxf等同于15，二进制与位符
		int directory2= (filename.hashCode()>>4)&0xf;//二进制 >>右移的数据一个hashCode相反的数据
		filepath = filepath+"/"+directory1+"/"+directory2;
		File file = new File(filepath);
		if(!file.exists()){//判断文件目录是否存在，如果不存在就生成该目录
			file.mkdirs();//Creates the directory named by this abstract pathname
		}
		return filepath+"/"+filename;
	}
	/***
	 * 来自web层的权限检查
	 * 检查是否具备对某个方法处理的权利
	 * 带过来的方法参数的具备check这个5个匹配关键字
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public  void fromWebAuthorityCheck(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/javascript");
		String method = request.getParameter("method");
		StringBuilder stringBuilder = new StringBuilder()
				.append("{\"authorityMessage\":");
		if (!method.contains("Check")) {
			stringBuilder.append("\"noCheck\"}");
		} else {
			method = method.substring(0, method.trim().length() - 5);
			DaoAuthorityFactory authorityFactory = new DaoAuthorityFactory(
					(Admin) request.getSession().getAttribute("admin"));
			String passOrBan = authorityFactory.authorityIdentify(method,
					BusinessServiceImpl.class);
			if ("pass".equals(passOrBan)) {
				stringBuilder.append("\"yes\"}");
			} else if ("ban".equals(passOrBan)) {
				stringBuilder.append("\"no\"}");
			} else if ("noIdentity".equals(passOrBan)) {
				stringBuilder.append("\"noIdentity\"}");
			}
		}
		System.out.println(stringBuilder.toString());
		response.getWriter().print(stringBuilder.toString());
	}
	/**
	 * 来自web层删除权限检查
	 * @param request
	 * @param response
	 * @param deleteMethod
	 * @param objectId
	 * @throws ServletException
	 * @throws IOException
	 */
	public  void fromWebAuthorityDeleteCheck(HttpServletRequest request,
			HttpServletResponse response,String deleteMethod , String objectId) throws ServletException, IOException{
		response.setContentType("text/javascript");
		StringBuilder builderStatement = new StringBuilder("{\"authorityMessage\":");
		try {
			DaoAuthorityFactory authorityFactory = new DaoAuthorityFactory(
					(Admin) request.getSession().getAttribute("admin"));
			BusinessService businessService = authorityFactory
					.createDaoAuthorityFactoryByInterface(BusinessService.class);
			System.out.println(deleteMethod+"权限名字");
			Method method = businessService.getClass().getDeclaredMethod(deleteMethod,new Class[]{String.class});
			method.setAccessible(true);
			method.invoke(businessService, new Object[]{objectId});
			JdbcUtils.commitTranscation();
			builderStatement.append("\"yes\"}");
			response.getWriter().print(builderStatement.toString());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			System.out.println(e.getCause());
			/**
			 * 以下代码为什么这么写，
			 */
			if(e.getCause() instanceof com.walkerChen.estore.commonUtils.MySecurityException){
				//这是本质异常进入代理对象就会检测到没有异权限或身份的异常是直接拿到，没有给反射方法invoke执行的机会
				if (e.getCause().getMessage().equals("noAuthority")) {
					System.out.println("noAuthotity");
					builderStatement.append("\"noAuthotity\"}");
					response.getWriter().print(builderStatement.toString());
					return;
				} else if (e.getCause().getMessage().equals("noIdentity")) {
					System.out.println("noIdentity");
					builderStatement.append("\"noIdentity\"}");
					response.getWriter().print(builderStatement.toString());
					return;
				} 
			}else if(e.getCause().getCause().getCause()instanceof com.walkerChen.estore.commonUtils.MySecurityException){
				//这里异常是逐步往上抛，第一出现异常是 来自dao层对数据错误的处理异常抛给了poxy代理类，然后是reflect反射方法的类
				System.out.println("dataBindingError");
				builderStatement.append("\"dataBindingError\"}");
				response.getWriter().print(builderStatement.toString());
				return;
			}else{
				System.out.println("no");
				builderStatement.append("\"no\"}");
				response.getWriter().print(builderStatement.toString());
				return;
			}
		}finally {
			JdbcUtils.closebleTranscation();
		}
	}
	
	public void deleteFileInfo(){
		System.out.println("已删除不成功的文件");
		if(FileName!=null){
			File file = new File(FileName);
			if(file.exists()){
				if(file.isFile()){
					file.delete();
				}
			}
		}
	}
	public void deleteFileInfo(String fileName){
		if(fileName!=null){
			File file = new File(fileName);
			if(file.exists()){
				if(file.isFile()){
					file.delete();
				}
			}
		}
	}
	public void createFileInfo(String fileDire){
		if(fileDire!=null){
			File file = new File(fileDire);
			if(!file.exists()){
				file.mkdirs();
			}
		}
	}
	@SuppressWarnings("all")
	public static void generateQrCodeImg(String webPath  , String toAbslutePath) throws Exception{
		int width = 300;
		int height = 300;
		String format = "png";
		InetAddress inetAddress = InetAddress.getLocalHost();
		String ip = inetAddress.getHostAddress();
		String content = "http://"+ip+":8080"+webPath+"/indexVisited";
		
		//4. 二维码图片需要一些详情参数信息， 在map集合中装载
		HashMap hints = new HashMap();
			// 1). EncodeHintType ， 编译成字节码的字符集类型 ， 是UTF-8
		hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
		 	// 2). EncodeHintType ，二维码图片被损坏的错误修改级别 ， 是M常用的
		hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);
			// 3）. EncodeHintType ，二维码图片形成黑白耀纹的左右前后的空白边距
		hints.put(EncodeHintType.MARGIN, 2);
		//5. 把二维码{new MultiFormatWriter()}多种格式化规格写出，编译（encode）成二进制的矩阵格式（BirMatrix），切记（Barcode）条形码格式一定要是二维码格式（Barcode.QR_CODE）
		try {
			BitMatrix  bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, width, height , hints);
			//6. 在这我们就把二维码图片写入一个指定文件路径的盘符中去，提醒： 这里的以文件写出已过时，所以需要把文件改成toPath()路径写出
			Path filePath = new File(toAbslutePath+"/img.png").toPath();
			//7. 形成了二维码的矩阵以图片写出去
			MatrixToImageWriter.writeToPath(bitMatrix, format, filePath);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
