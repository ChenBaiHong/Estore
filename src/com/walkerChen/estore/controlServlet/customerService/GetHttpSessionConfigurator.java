package com.walkerChen.estore.controlServlet.customerService;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;


//配置类  将http中的session传入websocket中  
public class GetHttpSessionConfigurator extends Configurator{

	@Override
	public void modifyHandshake(ServerEndpointConfig config,
			HandshakeRequest request, HandshakeResponse response) {
		HttpSession httpSession = (HttpSession) request.getHttpSession();
		config.getUserProperties().put(HttpSession.class.getName(), httpSession);
	}
	
}
