package com.walkerChen.estore.dao;


import java.util.List;

import com.walkerChen.estore.bean.page.QueryPaging;
import com.walkerChen.estore.bean.page.QueryResult;
import com.walkerChen.estore.bean.substance.Product;

public interface ProductDao {

	public abstract void addProduct(Product product);
	
	public abstract void remainderProductQuantity(String productId, int totalSale);
	
	public abstract Product findProduct(String id);



	public abstract void deleteProduct(String id);

	public Boolean isDuplicateNameOfProduct(String productName);

	QueryResult getProductQueryResult(QueryPaging queryInfo);

	public void updateProduct(Product product);

	List<Product> findPagingProductByCategory(QueryPaging queryInfo,
			String categoryId);
	
}