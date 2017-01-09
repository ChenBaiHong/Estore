package com.walkerChen.estore.controlServlet.customerService;

import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicInteger;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.juli.logging.Log;
import org.apache.juli.logging.LogFactory;

import com.walkerChen.estore.bean.substance.TempUser;
import com.walkerChen.estore.bean.substance.User;
/**
 * 明确这里的客服是一对一的客服咨询
 * @author cbh12
 *
 */
@SuppressWarnings("all")
@ServerEndpoint(value="/baiHooWebSocket/chat",configurator=GetHttpSessionConfigurator.class)
public class ChatAnnotation {
	//记录日志信息
	private static final Log log = LogFactory.getLog(ChatAnnotation.class);
	private static final Set<ChatAnnotation> connections =
            new CopyOnWriteArraySet<>();
	//来访聊天的顾客id
	private String userId;
	private String username;
    private Session session;
    //获取顾客的id
    private HttpSession httpSession;
    
    public ChatAnnotation() {
		super();
	}
    
	public String getUserId() {
		return userId;
	}

	public String getUsername() {
		return username;
	}

	public HttpSession getHttpSession() {
		return httpSession;
	}

	@OnOpen
    public void start(Session session,  EndpointConfig config) {
        this.session = session;
        this.httpSession=(HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        User user = (User) httpSession.getAttribute("user");
    	if(user !=null){//这里我们只上线来自访问的客户
        	this.userId=user.getId();
        	this.username=user.getUsername();
        	connections.add(this);
    		broadcast(null , 1);//开始上线用户或管理员
        }else{
        	TempUser tempUser = (TempUser) httpSession.getAttribute("tempUser");
        	if(tempUser!=null){
        		this.userId=tempUser.getTempId();
        		this.username=tempUser.getTempName();
        		connections.add(this);
        		broadcast(null , 1);
        	}
        }
    }
    /**
     * 
     * @param msg 要发送的消息
     * @param KDYH 根据对应号选择不同的执行结果
     */
    private  void broadcast(String message , int KDYH) {
        for (ChatAnnotation client : connections) {
            try {
                synchronized (client) {
                	switch(KDYH){
                	case 1:
                		//1 表示某个用户上线
                		if(isUserClient(client) && client.equals(this)){//登陆用户或临时用户咨询
                			message = "{\"KDYH\":\""+(isAdminClient(null)?1:0)+"\",\"onlineUserId\":\""+this.userId+"\"}";
                			client.session.getBasicRemote().sendText(message);
                    	}
                		if(isAdminClient(client)){
                			message = "{\"KDYH\":\"1\",\"onlineUserId\":\""+this.userId+"\"}";
                			client.session.getBasicRemote().sendText(message);
                		}
                		break;
                	case 2:
                		
                	}
                }
            } catch (IOException e) {
                log.debug("Chat Error: Failed to send message to client", e);
                connections.remove(client);
                try {
                    client.session.close();
                } catch (IOException e1) {
                	e1.printStackTrace();
                }
            }
        }
    }
    /**
     * 判定是管理员还是登陆用户或是临时用户
     * @param client
     * @return
     */
    private   boolean isUserClient(ChatAnnotation client){
    	boolean judge=false;
    	Map<String , HttpSession> logonSessioinMap = (Map<String, HttpSession>) client.getHttpSession().getServletContext().getAttribute("logonSessioinMap");
		Map<String , HttpSession> tempSessioinMap = (Map<String, HttpSession>) client.getHttpSession().getServletContext().getAttribute("TempSessioinMap");
		System.out.println(logonSessioinMap+","+tempSessioinMap);
		if(logonSessioinMap!=null && tempSessioinMap!=null){
			if(tempSessioinMap.get(client.getUserId()) !=null || logonSessioinMap.get(client.getUserId())!=null){
				judge=true;
			}else{
				judge=false;
			}
		}else{
			judge=false;
		}
		return judge;
    } 
    /**
     * 判定是否是管理员
     * @param client
     * @return
     */
    private   boolean isAdminClient(ChatAnnotation client){
    	boolean judge=false;
    	Map<String , HttpSession> adminSessioinMap = (Map<String, HttpSession>) client.getHttpSession().getServletContext().getAttribute("adminSessioinMap");
    	System.out.println(adminSessioinMap);
    	if(client !=null){
    		if(adminSessioinMap!=null){
        		if(adminSessioinMap.get(client.getUserId())!=null){
        			judge=true;
        		}else{
        			judge=false;
        		}
        	}else{
        		judge=false;
        	}
        	return judge;
    	}else{
    		if(adminSessioinMap!=null && adminSessioinMap.size()!=0){
        		judge=true;
        	}else{
        		judge=false;
        	}
        	return judge;
    	}
    } 
/**
 * 重写hashcode 和 equals 方法比较
 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		result = prime * result
				+ ((username == null) ? 0 : username.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ChatAnnotation other = (ChatAnnotation) obj;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}
    
}
