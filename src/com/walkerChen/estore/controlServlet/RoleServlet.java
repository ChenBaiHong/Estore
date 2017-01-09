package com.walkerChen.estore.controlServlet;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.walkerChen.estore.bean.backstage.Admin;
import com.walkerChen.estore.bean.backstage.Privilege;
import com.walkerChen.estore.bean.backstage.Role;
import com.walkerChen.estore.businessFactory.DaoAuthorityFactory;
import com.walkerChen.estore.businessFactory.DaoFactory;
import com.walkerChen.estore.businessService.BusinessService;
import com.walkerChen.estore.businessService.BusinessServiceImpl;
import com.walkerChen.estore.commonUtils.JdbcUtils;
import com.walkerChen.estore.commonUtils.ReflectUtils;
import com.walkerChen.estore.commonUtils.MySecurityException;
import com.walkerChen.estore.commonUtils.WebUtils;
import com.walkerChen.estore.dao.pagingBeanOfRole.PageInfo;
import com.walkerChen.estore.dao.pagingBeanOfRole.RolePageBean;

/**
 * Created by cbh12 on 9/27/2016.
 */
@WebServlet("/RoleServlet.servlet")
@SuppressWarnings("all")
public class RoleServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("method"));
		String method = request.getParameter("method");
		if (method != null) {
			ReflectUtils.invokeMethodServlet(this.getClass(), method, request,
					response);
		}
	}

	/**
	 * 添加角色检查是否具备权限 来自Ajax的验证方法
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void addRoleCheck(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//自定义的工具类权限检查
		WebUtils webUtils = new WebUtils();
        webUtils.fromWebAuthorityCheck(request, response);
	}
	/**
	 * 添加权限普通方法跳转
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void additionalRole(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			BusinessService businessService = DaoFactory.newInstance()
					.createDataAccessibleFactoryByInterface(
							BusinessService.class);
			List<Privilege> privileges = businessService.findAllPrivilege();
			request.setAttribute("privileges", privileges);
			request.getRequestDispatcher(
					"/WEB-INF/backstage/role/additionalRole.jsp").forward(
					request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("/500.jsp").forward(request, response);
		}
	}

	private void searchAboutRolePrivilegeByAjax(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/javascript");
		try {
			String searcCondition = request.getParameter("searchEvent");
			BusinessService businessService = DaoFactory.newInstance()
					.createDataAccessibleFactoryByInterface(
							BusinessService.class);
			List<Privilege> privileges = businessService
					.searchLikePrivilege(searcCondition);
			ObjectMapper objectMapper = new ObjectMapper();
			String objectJSON = objectMapper.writeValueAsString(privileges);
			response.getWriter().print(objectJSON);
		} catch (Exception e) {
			e.printStackTrace();
			String objectJSON = "{\"error\":\"error\"}";
			response.getWriter().print(objectJSON);
		}
	}

	/**
	 * 创建的角色保存到数据库
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void additionalRoleSaveSQL(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/javascript");
		try {
			BusinessService businessService = DaoFactory.newInstance()
					.createDataAccessibleFactoryByInterface(
							BusinessService.class);
			String ids = request.getParameter("ids");
			String name = request.getParameter("roleName");
			String description = request.getParameter("description");
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.append("{\"message\":");
			if (businessService.isExistRole(name.trim()) || ids == null) {
				stringBuilder.append("\"no\"}");
			} else {
				List<Privilege> privilegeList = new ArrayList<Privilege>();
				Role role = new Role();
				role.setName(name.trim());
				role.setDescription(description);
				role.setId(new WebUtils().generateUnique());
				String[] idArray = ids.split(",");
				for (int i = 0; i < idArray.length; i++) {
					Privilege privielge = businessService
							.findPrivilege(idArray[i].trim());
					privilegeList.add(privielge);
				}
				role.getPrivilegeSet().addAll(privilegeList);
				businessService.addRole(role);
				JdbcUtils.commitTranscation();
				stringBuilder.append("\"yes\",\"currentRoleId\":\""
						+ role.getId() + "\"}");
			}
			response.getWriter().print(stringBuilder.toString());
		} catch (Exception e) {
			e.printStackTrace();
			String message = "{\"message\":\"error\"}";
			response.getWriter().print(message);
		} finally {
			JdbcUtils.closebleTranscation();
		}
	}

	/**
	 * 分页展现角色
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void ergodicRoleFromAjax(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/javascript");
		try {
			String indexBar = request.getParameter("indexBar");
			PageInfo pageInfo = new PageInfo();
			if (indexBar != null) {
				pageInfo.setCurrentPage(Integer.parseInt(indexBar));
			}
			System.out.println(indexBar);
			BusinessService businessService = DaoFactory.newInstance()
					.createDataAccessibleFactoryByInterface(
							BusinessService.class);
			RolePageBean rolePageBean = businessService
					.queryRolePageBean(pageInfo);
			;
			ObjectMapper om = new ObjectMapper();
			String pageBean = om.writeValueAsString(rolePageBean);
			JdbcUtils.commitTranscation();
			response.getWriter().print(pageBean);
		} catch (Exception e) {
			e.printStackTrace();
			String error = "{\"error\":\"error\"}";
			response.getWriter().print(error);
		} finally {
			JdbcUtils.closebleTranscation();
		}
	}

	private void updateRoleFromAjax(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/javascript");
		try {
			BusinessService businessService = DaoFactory.newInstance()
					.createDataAccessibleFactoryByInterface(
							BusinessService.class);
			String roleId = request.getParameter("roleId");
			String description = request.getParameter("description");
			String privilegeIds = request.getParameter("privilegeIds");
			List<Privilege> privilegeList = null;
			if (privilegeIds != null && privilegeIds.trim().length() != 0) {
				privilegeList = new ArrayList<Privilege>();
				String[] privilegeIdArray = privilegeIds.split(",");
				for (int i = 0; i < privilegeIdArray.length; i++) {
					Privilege privilege = businessService
							.findPrivilege(privilegeIdArray[i]);
					privilegeList.add(privilege);
				}
			}
			businessService.updateOfRolePrivilege(roleId, description,
					privilegeList);
			JdbcUtils.commitTranscation();
			String message = "{\"message\":\"yes\"}";
			response.getWriter().print(message);
		} catch (Exception e) {
			e.printStackTrace();
			String error = "{\"message\":\"error\"}";
			response.getWriter().print(error);
		} finally {
			JdbcUtils.closebleTranscation();
		}
	}

	private void ergodicRole(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			BusinessService businessService = DaoFactory.newInstance()
					.createDataAccessibleFactoryByInterface(
							BusinessService.class);
			List<Role> roleList = businessService.findAllRole();
			request.setAttribute("roleList", roleList);
			JdbcUtils.commitTranscation();
			request.getRequestDispatcher(
					"/WEB-INF/backstage/role/ergodicRole.jsp").forward(request,
					response);
		} catch (Exception e) {
			request.getRequestDispatcher("/500.jsp").forward(request, response);
		} finally {
			JdbcUtils.closebleTranscation();
		}
	}

	private void findAllRoleCheck(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//自定义的工具类权限检查
		WebUtils webUtils = new WebUtils();
        webUtils.fromWebAuthorityCheck(request, response);
	}

	private void findRoleOfAjaxById(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/javascript");
		try {
			String roleId = request.getParameter("roleId");
			BusinessService businessService = DaoFactory.newInstance()
					.createDataAccessibleFactoryByInterface(
							BusinessService.class);
			Role role = businessService.findRole(roleId);
			JdbcUtils.commitTranscation();
			ObjectMapper objectMapper = new ObjectMapper();
			String objectJSON = objectMapper.writeValueAsString(role);
			System.out.println(objectJSON + "\n" + roleId);
			response.getWriter().print(objectJSON);
		} catch (Exception e) {
			e.printStackTrace();
			String objectJSON = "{\"message\":\"error\"}";
			response.getWriter().print(objectJSON);
		} finally {
			JdbcUtils.closebleTranscation();
		}
	}

	private void updateRoleNameOfAjaxById(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/javascript");
		try {
			String roleId = request.getParameter("roleId");
			String roleName = request.getParameter("roleName");
			System.out.println(roleName + "\n" + roleId);
			BusinessService businessService = DaoFactory.newInstance()
					.createDataAccessibleFactoryByInterface(
							BusinessService.class);
			if (!businessService.isExistRole(roleName)) {
				businessService.updateRoleName(roleName, roleId);
				String objectJSON = "{\"message\":\"yes\"}";
				JdbcUtils.commitTranscation();
				response.getWriter().print(objectJSON);
			} else {
				String objectJSON = "{\"message\":\"duplicate\"}";
				JdbcUtils.commitTranscation();
				response.getWriter().print(objectJSON);
			}
		} catch (Exception e) {
			e.printStackTrace();
			String objectJSON = "{\"message\":\"error\"}";
			response.getWriter().print(objectJSON);
		} finally {
			JdbcUtils.closebleTranscation();
		}
	}

	private void deleteRoleOfAjaxById(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/javascript");
		StringBuilder builderStatement = new StringBuilder("{\"message\":");
		try {
			DaoAuthorityFactory authorityFactory = new DaoAuthorityFactory(
					(Admin) request.getSession().getAttribute("admin"));
			BusinessService businessService = authorityFactory
					.createDaoAuthorityFactoryByInterface(BusinessService.class);
			businessService.deleteRole(request.getParameter("roleId"));
			JdbcUtils.commitTranscation();
			builderStatement.append("\"yes\"}");
			response.getWriter().print(builderStatement.toString());
		} catch (Exception e) {
			e.printStackTrace();
			if (e.getMessage().equals("noAuthority")) {
				System.out.println("noAuthotity");
				builderStatement.append("\"noAuthotity\"}");
				response.getWriter().print(builderStatement.toString());
				return;
			} else if (e.getMessage().equals("noIdentity")) {
				System.out.println("noIdentity");
				builderStatement.append("\"noIdentity\"}");
				response.getWriter().print(builderStatement.toString());
				return;
			} else if (e.getMessage().equals("dataBindingError")) {
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
		} finally {
			JdbcUtils.closebleTranscation();
		}
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
