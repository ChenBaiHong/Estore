package com.walkerChen.estore.controlServlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.walkerChen.estore.bean.backstage.Admin;
import com.walkerChen.estore.bean.backstage.Role;
import com.walkerChen.estore.businessFactory.DaoAuthorityFactory;
import com.walkerChen.estore.businessFactory.DaoFactory;
import com.walkerChen.estore.businessService.BusinessService;
import com.walkerChen.estore.commonUtils.JdbcUtils;
import com.walkerChen.estore.commonUtils.ReflectUtils;
import com.walkerChen.estore.commonUtils.WebUtils;
import com.walkerChen.estore.dao.pagingBeanOfAdmin.AdminPageBean;
import com.walkerChen.estore.dao.pagingBeanOfAdmin.PageInfoOfAdmin;

/**
 * Created by cbh12 on 9/26/2016.
 */
@SuppressWarnings("all")
@WebServlet("/AdminServlet.servlet")
public class AdminServlet extends HttpServlet {
	
    BusinessService businessService= DaoFactory.newInstance().createDataAccessibleFactoryByInterface(BusinessService.class);
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String method = request.getParameter("method");
        System.out.println(method);
        if(method!=null){
            ReflectUtils.invokeMethodServlet(this.getClass(),method,request,response);
        }
    }
    /**
     * 登陆验证管理员，是否数据库存在
     * 并且定义是超级管理员就直接放行
     * @param request
     * @param response
     */
    private void ajaxValidate(HttpServletRequest request, HttpServletResponse response){
        try {
            String logonName = request.getParameter("logonName");
            String logonPwd = request.getParameter("logonPwd");
            Admin admin = businessService.findAdmin(logonName, logonPwd);
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("{\"logonMessage\":");
            if(admin==null){
                stringBuilder.append("\"logonFailed\"").append("}");
            }else{
                HttpSession httpSession = request.getSession(false);
                httpSession.setMaxInactiveInterval(1000*60*60*60*3);//session最大存储时间是3小时
                httpSession.setAttribute("admin",admin);
                stringBuilder.append("\"logonSuccess\"").append("}");
            }
            System.out.println(admin+" "+stringBuilder.toString());
            response.setContentType("text/javascript");
            response.getWriter().print(stringBuilder.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * 登陆成功放行到管理界面
     * @param request
     * @param response
     * @throws IOException 
     * @throws ServletException 
     */
    private void logonSuccess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
       request.getRequestDispatcher("/WEB-INF/backstage/index.jsp").forward(request , response);
    }

    /**
     * 根据我写好的工具类检验登陆的管理员用户是否具备添加其他管理员的权利
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException 
     */
    public void addAdminCheck(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
    	response.setContentType("text/javascript");
		WebUtils webUtils = new WebUtils();
		webUtils.fromWebAuthorityCheck(request, response);
    }
    /**
     * 是否具备添加管理员的权限检查通过，就进入添加管理员的界面
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    public void addAdminTarget(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
    	List<Role> roleList = businessService.findAllRole();
    	request.setAttribute("roleList", roleList);
        request.getRequestDispatcher("/WEB-INF/backstage/admin/additionalAdmin.jsp").forward(request , response);
    }
    /**
     * 检验添加管理员和的数据库的其他管理员用户有名字重复
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    private void verifiedAdminname(HttpServletRequest request, HttpServletResponse response)
    		throws IOException, ServletException{
    	response.setContentType("text/javascript");
    	try{
    		String adminname = request.getParameter("adminname");
        	StringBuilder message = new StringBuilder("{\"message\":");
        	System.out.println(adminname);
        	if(adminname!=null){
        		List<String> adminnames = businessService.findAllAdminName();
        		System.out.println(adminnames);
        		JdbcUtils.commitTranscation();
            	for(String verifiedName : adminnames){
            		if(adminname.trim().equalsIgnoreCase(verifiedName)){
            			message.append("\"no\"}");
                		response.getWriter().print(message.toString());
                		return;
            		}
            	}
            	message.append("\"yes\"}");
        		response.getWriter().print(message.toString());
        	}
    	}finally{
    		JdbcUtils.closebleTranscation();
    	}
    }
    /**
     * 添加管理员，并且添加头像文件信息
     * 
     * 
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    private  void additionAdminInfo(HttpServletRequest request, HttpServletResponse response)
    		throws IOException, ServletException{
    	response.setContentType("text/javascript");
    	
    	StringBuilder sb = new StringBuilder("{\"message\":");
    	WebUtils webUtils = new WebUtils();
    	Admin admin = null;
    	try{
    		
    		String roleIds = request.getParameter("roleIds");
    		String password = request.getParameter("password");
    		String adminname = request.getParameter("adminname");
    		String description = request.getParameter("description");
    		String imgLocal = request.getParameter("imgLocal");
    		System.out.println(roleIds+","+adminname+","+password+","+description);
    		String[] roleIdArray=null;
    		List<Role> roleList=null;
    		if(roleIds!=null){
    			if(roleIds.length() !=0 && !roleIds.equals("")){
    				roleIdArray = roleIds.split(",");
    			}else{
    				roleIdArray=null;
    			}
    		}
    		if(roleIdArray!=null){
    			roleList = new ArrayList<Role>();
    			for(String roleId : roleIdArray){
    				Role role= businessService.findRole(roleId);
    				roleList.add(role);
    			}
    		}
    		admin = webUtils.servletFileUploadToBean(request, Admin.class, new String[]{});
    		admin.setId(new WebUtils().generateUnique());
    		admin.getRoleSet().addAll(roleList==null?new ArrayList():roleList);
    		businessService.addAdmin(admin);
    		System.out.println(admin);
    		sb.append("\"yes\"}");
    		System.out.println(sb.toString());
    		response.getWriter().print(sb.toString());
    		JdbcUtils.commitTranscation();
    	}catch(Exception e){
    		e.printStackTrace();
    		webUtils.deleteFileInfo();
    		sb.append("\"no\"}");
    		System.out.println(sb.toString());
			response.getWriter().print(sb.toString());
    	}finally{ JdbcUtils.closebleTranscation();}
    }
    /**
     * 更新管理员的信息
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    private void updateAdminInfo(HttpServletRequest request, HttpServletResponse response)
    		throws IOException, ServletException{
    	synchronized(this){
    		StringBuilder sb = new StringBuilder("{\"message\":");
        	WebUtils webUtils = new WebUtils();
        	Admin admin = null;
        	try{
        		String adminId = request.getParameter("id");
        		String description = request.getParameter("description");
        		String roleIds = request.getParameter("roleIds");
        		System.out.println(roleIds+","+adminId+","+description);
        		String[] roleIdArray=null;
        		Set<Role> roleSet=null;
        		if(roleIds!=null){
        			if(roleIds.length() !=0 && !roleIds.equals("")){
        				roleIdArray = roleIds.split(",");
        			}else{
        				roleIdArray=null;
        			}
        		}
        		if(roleIdArray!=null){
        			roleSet = new HashSet<Role>();
        			for(String roleId : roleIdArray){
        				Role role= businessService.findRole(roleId);
        				roleSet.add(role);
        			}
        		}
        		 admin = businessService.findAdmin(adminId);
        		 Admin updateAdmin = webUtils.servletFileUploadToBean(request, Admin.class , new String[]{});
        		 if(updateAdmin != null){
        			 if(updateAdmin.getImgLocal()!=null){
            			 if(admin.getImgLocal()!=null){
                			 webUtils.deleteFileInfo(admin.getImgLocal());
                		 }
            			 admin.setImgLocal(updateAdmin.getImgLocal());
            		 }
        		 }
        		 System.out.println(updateAdmin.getImgLocal()+" wo shi zai 236 line");
        		 admin.setDescription(description);
        		 admin.setRoleSet(roleSet==null?new HashSet():roleSet); //这里是查询了之前的没有被覆盖而是直接往后添加了
        		//admin.setImgLocal();
        		 businessService.updateAdmin(admin);//开始更新
        		 JdbcUtils.commitTranscation();
        		System.out.println(admin);//Admin [id=null, adminname=null, password=null, imgLocal=F:。。。。
        		sb.append("\"yes\"}");
        		System.out.println(sb.toString());
        		response.getWriter().print(sb.toString());
        		
        	}catch(Exception e){
        		e.printStackTrace();
        		webUtils.deleteFileInfo();
        		sb.append("\"no\"}");
        		System.out.println(sb.toString());
    			response.getWriter().print(sb.toString());
        	}finally{ JdbcUtils.closebleTranscation();}
    		
    	}
    	
    }
    /**
     * 
     * @param request
     * @param response
     */
    private void searchAdmin(HttpServletRequest request, HttpServletResponse response){
        try{
            List<Admin> adminList =  businessService.findAllAdmin();
            request.setAttribute("adminList",adminList);
        }catch(Exception e){
            throw new RuntimeException(e);
        }
    }
    /**
     * 超级管理员在查看其他管理员而显示被查管理员的头像
     * @param request
     * @param response
     */
    private  void showAdminHead(HttpServletRequest request, HttpServletResponse response){
    	synchronized(this){
    		String adminId = request.getParameter("adminId");
    		InputStream inStream=null;
    		Admin admin = null;
    		File file = null;
    		try {
	    		if(adminId!=null){
	    			admin= businessService.findAdmin(adminId);
	    			JdbcUtils.commitTranscation();
	    			String iconLocation = admin.getImgLocal();
	    			if(iconLocation==null || iconLocation.trim().equals("")){
	    				String defaultHead = request.getServletContext().getRealPath("backgroundPlug/AddRole/images/IMG_0076.JPG");
		    			file = new File(defaultHead);
	    			}
	    			file = new File(iconLocation);
	    		}else{
	    			String defaultHead = request.getServletContext().getRealPath("backgroundPlug/AddRole/images/IMG_0076.JPG");
	    			file = new File(defaultHead);
	    		}
				inStream = new FileInputStream(file);
				byte[] flush = new byte[1024];
				int len = 0 ; 
				while((len=inStream.read(flush))!=-1){
					response.getOutputStream().write(flush, 0, len);
				}
				inStream.close();
			} catch (Exception e) {
				e.printStackTrace();
			}finally{JdbcUtils.closebleTranscation();}
    	}
    }
    /**
     * 分页展现admin
     * @param request
     * @param response
     * @throws IOException
     */
    private void pagingShowAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException{
    	response.setContentType("text/javascript");
    	synchronized(this){
			try {
				String indexBar = request.getParameter("indexBar");
				String pageSize = request.getParameter("pageSize");
				PageInfoOfAdmin pageInfo = new PageInfoOfAdmin();
				if (indexBar != null) {
					pageInfo.setCurrentPage(Integer.parseInt(indexBar));
				}
				if(pageSize!=null){
					pageInfo.setPageSize(Integer.parseInt(pageSize));
				}
				System.out.println(indexBar);
				BusinessService businessService = DaoFactory.newInstance()
						.createDataAccessibleFactoryByInterface(
								BusinessService.class);
				AdminPageBean adminPageBean = businessService.
						queryAdmiPageBean(pageInfo);
				ObjectMapper om = new ObjectMapper();
				String pageBean = om.writeValueAsString(adminPageBean);
				JdbcUtils.commitTranscation();
				response.getWriter().println(pageBean);
			} catch (Exception e) {
				e.printStackTrace();
				String error = "{\"error\":\"error\"}";
				response.getWriter().print(error);
			} finally {
				JdbcUtils.closebleTranscation();
			}
    	}
    }
    /**
     * 检查当前管理员是否具备检查其他管理员的权利
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    private void findAllAdminCheck (HttpServletRequest request, HttpServletResponse response)
    		throws IOException, ServletException{
    	response.setContentType("text/javascript");
		WebUtils webUtils = new WebUtils();
		webUtils.fromWebAuthorityCheck(request, response);
    }
    /**
     * 如果当前权限检查通过，就遍历出所有管理员的权限
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    private  void ergodicAdmin (HttpServletRequest request, HttpServletResponse response)
    		throws IOException, ServletException{
    	try {
    		
    		PageInfoOfAdmin pageInfo = new PageInfoOfAdmin();
    		pageInfo.setPageSize(6);
			BusinessService businessService = DaoFactory.newInstance()
					.createDataAccessibleFactoryByInterface(
							BusinessService.class);
			AdminPageBean adminPageBean = businessService.
					queryAdmiPageBean(pageInfo);
			request.setAttribute("adminPageBean", adminPageBean);
			JdbcUtils.commitTranscation();
			request.getRequestDispatcher(
					"/WEB-INF/backstage/admin/ergodicAdmin.jsp").forward(request,
					response);
		} catch (Exception e) {
			request.getRequestDispatcher("/500.jsp").forward(request, response);
		} finally {
			JdbcUtils.closebleTranscation();
		}
    }
    /**
     * 删除管理员
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
	private void deleteAdmin(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String adminId = request.getParameter("adminId");
		if (admin != null) {
			if (admin.getId().equals(adminId)) {
				return;
			}
		}
		System.out.println(adminId);
		WebUtils webUtils = new WebUtils();
		webUtils.fromWebAuthorityDeleteCheck(request, response, "deleteAdmin",
				adminId);

	}
    /**
     * 检索某一个名字像某的管理员用户
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    private void  retrievalAdmin (HttpServletRequest request, HttpServletResponse response)
    		throws IOException, ServletException{
    	synchronized(this){
    		String conditionValue = request.getParameter("retrievalValue");
    		if(conditionValue != null){
    			try{
    				List<Admin> adminList = businessService.searchLikeAdmin(conditionValue);
    				JdbcUtils.commitTranscation();
        			ObjectMapper om = new ObjectMapper();
        			String admins = om.writeValueAsString(adminList);
        			response.getWriter().println(admins);
    			}catch(Exception e){
    				e.printStackTrace();
    			}finally{
    				JdbcUtils.closebleTranscation();
    			}
    		}
    	}
    }
   /**
    * 重新改写管理员的名字
    * @param request
    * @param response
    * @throws IOException
    * @throws ServletException
    */
    private void alterAdminName(HttpServletRequest request, HttpServletResponse response)
    		throws IOException, ServletException{
    	
    	synchronized(this){
    		StringBuilder sb = new StringBuilder("{\"message\":");
    		try{
    			String adminId = request.getParameter("adminId");
        		String newName = request.getParameter("newName");
        		Admin admin = (Admin) request.getSession().getAttribute("admin");
        		DaoAuthorityFactory authorityFactory = new DaoAuthorityFactory(admin);
        		BusinessService businessService = authorityFactory.createDaoAuthorityFactoryByInterface(BusinessService.class);
        		List<String> adminNames = businessService.findAllAdminName();
  
        		for(int i = 0 ; adminNames!=null && i<adminNames.size();i++){
        			if(adminNames.get(i).equalsIgnoreCase(newName)){
        				sb.append("\"ban\"}");
        				System.out.println(sb.toString());
                		response.getWriter().println(sb.toString());
                		return ;
        			}
        		}
        		if(adminId!=null && admin!=null){//不可以修改超级管理员
        			if(adminId.trim().equals("83eebac535d14f791f6ee4dbefe689dc")){
        				sb.append("\"ban\"}");
        				System.out.println(sb.toString());
        				response.getWriter().println(sb.toString());
                		return ;
        			}else if(admin.getId().equals(adminId)){
        				businessService.alterAdminName(adminId , newName);
        				JdbcUtils.commitTranscation();
        				sb.append("\"oneself\"}");
        				System.out.println(sb.toString());
        				response.getWriter().println(sb.toString());
                		return ;
        			}
        		}
        		businessService.alterAdminName(adminId , newName);
        		JdbcUtils.commitTranscation();
        		sb.append("\"yes\"}");
        		System.out.println(sb.toString());
        		System.out.println(sb.toString());
        		response.getWriter().println(sb.toString());
    		}catch(Exception e){
    			e.printStackTrace();
    			sb.append("\"no\"}");
    			System.out.println(sb.toString());
        		response.getWriter().println(sb.toString());
    		}finally{
    			JdbcUtils.closebleTranscation();
    		}
    		
    	}
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
    }

}
