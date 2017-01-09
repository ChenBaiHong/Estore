package com.walkerChen.estore.businessFactory;

import com.walkerChen.estore.bean.backstage.Admin;
import com.walkerChen.estore.bean.backstage.Privilege;
import com.walkerChen.estore.bean.backstage.PrivilegeInject;
import com.walkerChen.estore.businessService.BusinessService;
import com.walkerChen.estore.commonUtils.JdbcUtils;
import com.walkerChen.estore.commonUtils.PrivilegeUtils;
import java.io.InputStream;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Map;
import java.util.Properties;
import java.util.Set;


/**
 * 针对业务层写的权限操作工厂
 */
public class DaoAuthorityFactory {
	private static Properties configuration = new Properties();
	BusinessService businessService = DaoFactory.newInstance().createDataAccessibleFactoryByInterface(BusinessService.class);
	private Admin admin;
	static {
		try{
			InputStream inStream =DaoAuthorityFactory.class.getClassLoader().getResourceAsStream("daoConfiguration.properties");
			configuration.load(inStream);
		}catch(Exception e){
			throw new ExceptionInInitializerError(e);
		}
	}
	public DaoAuthorityFactory(Admin admin){
		this.admin=admin;
	}
	
	@SuppressWarnings("all")
	public <T>T createDaoAuthorityFactoryByInterface(Class<T> classBean){
		String interfaceName = classBean.getSimpleName();
		String completeSubclassName = configuration.getProperty(interfaceName);
		//最终声明的对象或方法只能是一次，且不能为空
		final T bean;
		try {
			bean = (T) Class.forName(completeSubclassName).newInstance();
		} catch (Exception e) {throw new com.walkerChen.estore.commonUtils.MySecurityException(e);}
		if(admin==null){
			throw new com.walkerChen.estore.commonUtils.MySecurityException("noIdentity");
		}
		/**
		 * 返回注解被解析的这个bean对象
		 */
		System.out.println(bean);
		return (T) Proxy.newProxyInstance(bean.getClass().getClassLoader(), bean.getClass().getInterfaces(), new InvocationHandler(){
			@Override
			public Object invoke(Object proxy, Method method, Object[] args)
					throws Throwable {
				String methodName=method.getName();
				Method realMethod = bean.getClass().getDeclaredMethod(methodName, method.getParameterTypes());
				realMethod.setAccessible(true);
				PrivilegeInject privilegeInject = realMethod.getDeclaredAnnotation(PrivilegeInject.class);
				System.out.println(privilegeInject);
				System.out.println(methodName);
				if(privilegeInject==null){
					return method.invoke(bean,args);
				}
				//定义最终管理员，只有所有的权利
				if("superAdmin".equals(admin.getAdminname())){
					return method.invoke(bean,args);
				}
				//如果存在权限，执行以下代码
				String privilegeName = privilegeInject.chineseValue();
				Privilege isExist = businessService.searchPrivilege(privilegeName);
				//判断数据库是否具有该权限，有权限才对管理员进行验证是否具备权限
				if(isExist==null){
					return method.invoke(bean,args);
				}
				System.out.println(privilegeName+"\n");
				Privilege privilege = new Privilege(privilegeName);
				Set<Privilege> privilegeSet = businessService.findAdminAllPrivilegeByRole(admin.getId());
				if(privilegeSet!=null && privilegeSet.contains(privilege)){
					return method.invoke(bean, args);
				}
				throw new com.walkerChen.estore.commonUtils.MySecurityException("noAuthority");
			}
		});
	}

	public <T>String authorityIdentify(String englishKeyName,Class<T> classBean){
		try{
			if(admin==null){
				return "noIdentity";
			}
			//定义最终管理员，只有所有的权利
			if("superAdmin".equals(admin.getAdminname())){
				return "pass";
			}
			Map<String,String> authorityMap=PrivilegeUtils.fetchBusinessAuthorityNameOfMap(classBean);
			//如果map中没有该权限就说明是可以放行的链接
			String privilegeName=authorityMap.get(englishKeyName);
			if(privilegeName==null){
				return "pass";
			}
			Privilege isExist = businessService.searchPrivilege(privilegeName);
			//判断数据库是否具有该权限，有权限才对管理员进行验证是否具备权限
			if(isExist==null){
				return "pass";
			}
			Privilege privilege = new Privilege(privilegeName);
			Set<Privilege> privilegeSet = businessService.findAdminAllPrivilegeByRole(admin.getId());
			
			JdbcUtils.commitTranscation();
			System.out.println(privilegeName+"\n");
			if(privilegeSet!=null && privilegeSet.contains(privilege)){
				return "pass";
			}else{
				return "ban";
			}
		}finally{
			JdbcUtils.closebleTranscation();
		}
	}
}
