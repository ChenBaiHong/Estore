package com.walkerChen.estore.controlAction.foreground;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.apache.struts2.ServletActionContext;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionSupport;
import com.walkerChen.estore.bean.page.SessionShoppingCart;
import com.walkerChen.estore.bean.page.ShoppingCart;
import com.walkerChen.estore.bean.page.ShoppingItem;
import com.walkerChen.estore.bean.page.ShoppingItemParam;
import com.walkerChen.estore.bean.substance.Category;
import com.walkerChen.estore.bean.substance.Product;
import com.walkerChen.estore.businessService.BusinessService;
import com.walkerChen.estore.commonUtils.Md5Utils;
@SuppressWarnings("all")
public class ShoppingCartAction extends ActionSupport {
	private int buyQuantity;
	private String productId;
	private String colorCId;
	private String sizeCId;
	private BusinessService businessService;
	private String jsonData="";
	
	public void setBuyQuantity(int buyQuantity) {
		this.buyQuantity = buyQuantity;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public void setBusinessService(BusinessService businessService) {
		this.businessService = businessService;
	}
	
	public void setColorCId(String colorCId) {
		this.colorCId = colorCId;
	}
	public void setSizeCId(String sizeCId) {
		this.sizeCId = sizeCId;
	}
	public String getJsonData() {
		return jsonData;
	}
	//添加购物项
	public String additionShoppingItemByAjax() throws Exception{
		synchronized(this){
			
			Product product = businessService.findProduct(productId);
			Category color = businessService.findCategory(colorCId);//产品颜色
			Category size = businessService.findCategory(sizeCId);//产品大小
			//把购物车储存到session中去;从session中获取购物项
			HttpServletRequest request= ServletActionContext.getRequest();
			HttpSession session = request.getSession(false);
			session.setMaxInactiveInterval(1000*60*60*60*3);//session最大存储时间是3小时
			ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");
			System.out.println(shoppingCart+"--------------------------------------------64行代码中");
			if(product!=null && color!=null && size!=null && buyQuantity!=0){
				if(shoppingCart==null){
					shoppingCart = new ShoppingCart();
					//购物车添加产品，数量，颜色 ， 大小
					shoppingCart.appendProduct(product, buyQuantity , color , size);
					//反馈给页面需要的真是对应的数据
					this.jsonData="{\"shoppingCart\":\"yes\",\"singlePrice\":\""+product.getSalePrice()+"\"}";
					session.setAttribute("shoppingCart", shoppingCart);//重新放回session中去
				}else{
					shoppingCart.appendProduct(product, buyQuantity,color , size);
					//反馈给页面需要的真是对应的数据
					this.jsonData="{\"shoppingCart\":\"yes\",\"singlePrice\":\""+product.getSalePrice()+"\",\"effectivePrice\":\""+shoppingCart.getTotalMoney()+"\"}";
					
					session.setAttribute("shoppingCart", shoppingCart);//重新放回session中去
				}
			}else{
				this.jsonData="{\"shoppingCart\":\"no\"}";
			}
			return this.SUCCESS;
		}
	}
	
	//删除购物项
	public String deleteShoppingItemByAjax() throws Exception{
		HttpServletRequest request= ServletActionContext.getRequest();
		HttpSession session = request.getSession(false);
		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");
		if(productId!=null && productId.trim().length()!=0 &&
				colorCId!=null && colorCId.trim().length()!=0 &&
				sizeCId!=null && sizeCId.trim().length()!=0){
			String encipherKey = Md5Utils.md5(productId+colorCId+sizeCId);
			//删除购物车map中的的购物项
			
			shoppingCart.getStoreSqlMap().remove(encipherKey);
			
			//更新这个购物车中要出现给页面的某个产品的下面的购物项数据
			//眼删除页面带过的订单数据就跟他是那个产品的id 以及颜色 和 大小 ， 以此做出比较
			ShoppingItem tempShopItem = new ShoppingItem(productId ,colorCId ,sizeCId);
			Map<String  , List<ShoppingItem>> presentPageData  = shoppingCart.getPresentPageData();
			List<ShoppingItem> shoppItems= presentPageData.get(productId);
			//JOptionPane.showMessageDialog(null, shoppItems);
			for(int i = 0 ; i<shoppItems.size() ; i++){
				ShoppingItem shopItem=shoppItems.get(i);
				if(tempShopItem.equals(shopItem)){
					//删除关联某个产品集合中的的购物项
					shoppItems.remove(shopItem);
					shoppingCart.getPresentPageData().get(productId).remove(shopItem);//删除不需要的订单项
					//JOptionPane.showMessageDialog(null, "删除成功！");
					 break;
				}
			}
			//如果该产品下没有关联购物项就移除该键的产品id
			if(shoppItems.size()==0){
				shoppingCart.getPresentPageData().remove(productId);
			}
			//重新唤醒session中shoppingCart中的购物车数据
			this.jsonData="{\"shoppingCart\":\"yes\",\"effectivePrice\":\""+shoppingCart.getTotalMoney()+"\"}";
			session.setAttribute("shoppingCart", shoppingCart);//重新放回session中去
		}else{
			this.jsonData="{\"shoppingCart\":\"no\"}";
		}
		return this.SUCCESS;
	}
	/**
	 * 页面先单个购物项所需的基本参数信息 ， 关于那个产品 ， 产品的颜色 和 大小
	 * @return
	 */
	public String singleShoppingItemProfileByAjax(){
		try{
			Product product = businessService.findProduct(productId);
			if(product!=null){
				ShoppingItemParam shoppingItemParam = new ShoppingItemParam();//包装器类
				shoppingItemParam.setProduct(product);
				
				IndexAction indexAction = new IndexAction();//通过IndexAction共有方法获取关于购物项产品的颜色和大小
				Category colorCategory = indexAction.rootSubcategory().get(3);//颜色分类在跟分类中对应的节点就是3,要遍历产品下的颜色
				List<Category> colorList = new ArrayList<Category>();
				if(colorCategory.getSubCategorys()!=null){
					List<Category> auxiliarylistP = new ArrayList<Category>();
					List<Category> auxiliarylistC = new ArrayList<Category>();
					auxiliarylistP.addAll(product.getCategorySet());//产品类
					auxiliarylistC.addAll(colorCategory.getSubCategorys());//颜色的颜色种类
					for(Category color : auxiliarylistC){
						for(Category category:auxiliarylistP){
							if(color.equals(category)){
								colorList.add(color);
								break;
							}
						}
					}
					//产品具备的颜色集合
					shoppingItemParam.getColorList().addAll(colorList);
				}
				//产品型号分类
				Set<Category> sizeList=indexAction.rootSubcategory().get(4).getSubCategorys();
				shoppingItemParam.getSizeList().addAll(sizeList);
				ObjectMapper om = new ObjectMapper();//转化ajax对象的工具类
				this.jsonData = om.writeValueAsString(shoppingItemParam);//转化包装器中的数据为json对象
			}
		}catch(Exception e){
			e.printStackTrace();
			this.jsonData="{\"message\":\"none\"}";
		}
		return this.SUCCESS;
	}
	/**
	 * 详情购物车jsp页面
	 * @return
	 * @throws Exception
	 */
	public  String shoppingCartDetails() throws Exception{
		//新的导航头
		ServletActionContext.getRequest().setAttribute("navigateCategorys", new IndexAction().navigateHeadCategory());
		HttpServletRequest request= ServletActionContext.getRequest();
		HttpSession session = request.getSession(false);
		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");
		if(shoppingCart!=null){
			List<SessionShoppingCart> sessionCartList = transitionSessionShoppingCart(shoppingCart);
			request.setAttribute("sessionCartList", sessionCartList);
			request.setAttribute("effectivePrice", shoppingCart.getTotalMoney());
		}
		return this.SUCCESS;
	}
	/**
	 *该产品没有根据产品颜色挑选产品，因为只是文字描述
	 * @param shoppingCart
	 * @return
	 * @throws JsonProcessingException
	 */
	public List<SessionShoppingCart> transitionSessionShoppingCart(ShoppingCart shoppingCart) throws JsonProcessingException{
		//反馈给购物车页面你的就是会话购物车（sessionShoppingCart）
		ObjectMapper om = new ObjectMapper();
		List<SessionShoppingCart> sessionCartList = new LinkedList<SessionShoppingCart>();// 创建 给页面的会话，产品对应的购物项集合
		Map<String, List<ShoppingItem>> presentPageData = shoppingCart.getPresentPageData();//真是购物车获取要出现给页面的数据
		//迭代出map中的集合给页面的数据中
		Set<Entry<String , List<ShoppingItem>>>entrySet = presentPageData.entrySet();//出现给网页页面的数据
		Iterator<Entry<String , List<ShoppingItem>>> iterator = entrySet.iterator();
		while(iterator.hasNext()){
			Entry<String , List<ShoppingItem>>entry = iterator.next();
			String productId = entry.getKey();
			Product tempProduct = businessService.findProduct(productId);
			List<ShoppingItem>shoppingItemList = entry.getValue();
			//创建单个产品给页面的会话购物车封装类
			SessionShoppingCart sessionCart = new SessionShoppingCart();
			sessionCart.setProduct(tempProduct);
			sessionCart.setShoppingItemList(shoppingItemList);
			//最后的单个产品的下的购物箱项封装到一个类中
			sessionCartList.add(sessionCart);
		}
		return sessionCartList;
	}
}
