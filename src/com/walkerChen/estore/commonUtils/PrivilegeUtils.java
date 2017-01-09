package com.walkerChen.estore.commonUtils;

import com.walkerChen.estore.bean.backstage.PrivilegeInject;

import java.lang.reflect.Method;
import java.util.*;

/**
 * Created by cbh12 on 9/29/2016.
 */
public class PrivilegeUtils {

    public static <T>List<String> fetchBusinessAuthorityNameOfChinese(Class<T> tClass){
        try{
          List<String> authorityNames = new ArrayList<String>();
          Map<String,String> authorityMap =fetchBusinessAuthorityNameOfMap(tClass);
            Set<Map.Entry<String , String>> authorityEntry= authorityMap.entrySet();
            Iterator<Map.Entry<String , String>> iterator = authorityEntry.iterator();
            while(iterator.hasNext()){
                Map.Entry<String , String> entry=iterator.next();
                authorityNames.add(entry.getValue());
            }
            return authorityNames;
        }catch(Exception e){
            throw new MySecurityException(e);
        }
    }
    public static <T>Map<String,String> fetchBusinessAuthorityNameOfMap(Class<T> tClass){
        try{
            Map<String,String> authorityMap = new HashMap<String,String>();
            Method[] declaredMethods = tClass.getDeclaredMethods();
            for (int i = 0 ; declaredMethods!=null && i<declaredMethods.length;i++){
                Method method = declaredMethods[i];
                method.setAccessible(true);
                PrivilegeInject privilegeInject = method.getDeclaredAnnotation(PrivilegeInject.class);
                if(privilegeInject==null){
                    continue;
                }
                Method annotationMethodOfValue = privilegeInject.getClass().getDeclaredMethod("chineseValue", new Class[]{});
                String value = (String) annotationMethodOfValue.invoke(privilegeInject,new Object[]{});
                Method annotationMethodOfKey = privilegeInject.getClass().getDeclaredMethod("englishKey", new Class[]{});
                String key = (String) annotationMethodOfKey.invoke(privilegeInject,new Object[]{});
                authorityMap.put(key,value);
            }
            return authorityMap;
        }catch(Exception e){
            throw new MySecurityException(e);
        }
    }
}
