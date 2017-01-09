package com.walkerChen.estore.bean.page;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.walkerChen.estore.bean.substance.Category;
import com.walkerChen.estore.bean.substance.Product;
import com.walkerChen.estore.commonUtils.Md5Utils;
import com.walkerChen.estore.dao.impl.ProductDaoImpl;


public class ShoppingCart implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6007818787899970155L;
	//存储每一个购物项，根据产品的id，颜色分类id，大小分类id ，生成 Md5 加密识别键
	private Map<String , ShoppingItem> storeSqlMap = new HashMap<String , ShoppingItem>();
	//显示某个产品下的购物项 ， 产品的id为 key键 ， value就是这个关于这个产品的购物项集合
	private Map<String  , List<ShoppingItem>> presentPageData  = new HashMap<String , List<ShoppingItem>>(); 
	//显示出所有购物项的总价
	private double totalMoney;
	/**
	 * 前台开始添加产品
	 * @param product 
	 * @param buyQuantity 产品的购买数量
	 * @param color 产品的颜色
	 * @param size 产品的大小
	 */
	public void appendProduct(Product product, int buyQuantity, Category color, Category size){//购买该产品的需要的它的的颜色和大小
		//MD5生成一个加密的名字 根据颜色和大小，产品添加到购物车map集合中
	    String encipherKey= Md5Utils.md5(product.getId()+color.getCid()+size.getCid());
		ShoppingItem updateShopItem = storeSqlMap.get(encipherKey);//无论是相同的产品还是不同产品，只要类型参数（比如颜色 和 大小）不一样就是一个购物项
		if(updateShopItem==null){
			//如果更新的购物项是空那么，开始新添加购物项并填充该产品的参数
			updateShopItem  = new ShoppingItem();
			updateShopItem.setProduct(product);//购物项是那一款产品
			updateShopItem.setProductId(product.getId());//需要对比的购物项是否同一个购物项尤其看他是否一个同一个产品
			updateShopItem.setBuyQuantity(buyQuantity);//购物项的数量
			updateShopItem.setColor(color.getName());//购物项颜色
			updateShopItem.setColorCId(color.getCid());//需要对比的购物项是否同一个购物项的颜色属性
			updateShopItem.setSize(size.getName());//购物项的大小
			updateShopItem.setSizeCId(size.getCid());//需要对比的购物项是否同一个购物项的大小属性
			/**
			 * 这里map存储的数据是要带给数据库的
			 * 每个购物项都有一个加密键
			 */
			storeSqlMap.put(encipherKey, updateShopItem);
		}else{
			//否则就说明该购物想是存在，那么就更新该产品的数量
			 updateShopItem.setBuyQuantity(buyQuantity);//在后面更新页面数据需要最新的数据
			 
			storeSqlMap.get(encipherKey).setBuyQuantity(buyQuantity);//更新购物项的购买数量
		}
		/**
		 * 前台需要的页面数据访问
		 * 是同一个产品的购物项
		 */
		List<ShoppingItem>shoppingItems = presentPageData.get(product.getId());//以产品id为map的主键 ， 获取该产品的下的不同类型的订单项
		if(shoppingItems==null){
			//如果shopingItems 等于空就说明是第一次添加数据
			shoppingItems = new LinkedList<ShoppingItem>();
			shoppingItems.add(updateShopItem);//就新创建一个list集合添加关于这个产品的订单项
			presentPageData.put(product.getId(), shoppingItems);//然后递交给网页的map数据，添加上这个key 和 value
		}else{
			//定义一个临时的boolean判断是否该更新购物项 还是新添加购物项
			boolean isExist = false;//默认是不存在
			//否则就说明这个presentPageData 存在这个产品，那么它自然list中就存在一个购物项
			for(int i= 0 ; i<shoppingItems.size();i++){
				ShoppingItem shoppingItem = shoppingItems.get(i);//接着就判断这个购物项在产品对应的list购物项是否已经存在这个购物项
				if(updateShopItem.equals(shoppingItem)){//如果存在就原来该购物项对应的下标添加更新的购物项
					//这里是根据获取的对象 ， 和获取创建的对象是两个概念，要在当前对象的（presentPageData）map集合中对数据做出更新
					presentPageData.get(product.getId()).remove(i);
					presentPageData.get(product.getId()).add(updateShopItem);//添加新的更新购物项
					isExist = true;
					break;
				}else{
					continue;
				}
			}
			if(!isExist){//如果不存在就新添加购物项
				presentPageData.get(product.getId()).add(updateShopItem);
			}
		}
	}
	@JsonIgnore
	public Map<String, ShoppingItem> getStoreSqlMap() {
		return storeSqlMap;
	}

	public void setStoreSqlMap(Map<String, ShoppingItem> storeSqlMap) {
		this.storeSqlMap = storeSqlMap;
	}
	public Map<String, List<ShoppingItem>> getPresentPageData() {
		return presentPageData;
	}
	public void setPresentPageData(Map<String, List<ShoppingItem>> presentPageData) {
		this.presentPageData = presentPageData;
	}
	//由内部的自动算出产品的总价格
	public double getTotalMoney() {
		double price = 0;
		Set<Entry<String , ShoppingItem>> entrySet = storeSqlMap.entrySet();
		Iterator<Entry<String, ShoppingItem>>iterator = entrySet.iterator();
		while(iterator.hasNext()){
			Entry<String, ShoppingItem> entry= iterator.next();
			ShoppingItem shopItem= entry.getValue();
			price +=shopItem.getSubtotal();
		}
		BigDecimal decimal = new BigDecimal(price);
		decimal = decimal.setScale(3, BigDecimal.ROUND_HALF_UP);//向上取整，去后3位小数点
		totalMoney= Double.parseDouble(decimal.toString());
		return totalMoney;
	}
	public static void main(String[] args) throws Exception{
		ProductDaoImpl dao = new ProductDaoImpl();
		Product product = dao.findProduct("1009f2c208be45ccb72aeafa5b014e87");
		System.out.println(product);
		//ShoppingCart shoppingCart = new ShoppingCart();
		
	}
}
