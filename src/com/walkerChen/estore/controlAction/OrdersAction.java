package com.walkerChen.estore.controlAction;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.walkerChen.estore.bean.substance.Orders;
import com.walkerChen.estore.businessFactory.DaoFactory;
import com.walkerChen.estore.businessService.BusinessService;
import com.walkerChen.estore.commonUtils.ReflectUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * Created by cbh12 on 9/27/2016.
 */
@WebServlet("/OrdersServlet.servlet")
@SuppressWarnings("all")
public class OrdersAction extends HttpServlet {
    BusinessService businessService= DaoFactory.newInstance().createDataAccessibleFactoryByInterface(BusinessService.class);
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String method = request.getParameter("method");
        if("alwaysUpdateOrdersByJSON".equals(method)){
            ReflectUtils.invokeMethodServlet(this.getClass(),method,request,response);
        }
    }
    private void alwaysUpdateOrdersByJSON(HttpServletRequest request, HttpServletResponse response){
        try{
            List<Orders> ordersList = businessService.findStateOrders("false");
            ObjectMapper objectMapper = new ObjectMapper();
            String ordersDetails = objectMapper.writeValueAsString(ordersList);
            response.setContentType("text/javascript");
            response.getWriter().println(ordersDetails);
        }catch(Exception e){e.printStackTrace();}
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response);
    }
}
