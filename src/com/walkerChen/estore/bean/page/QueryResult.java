package com.walkerChen.estore.bean.page;

import com.walkerChen.estore.bean.substance.Product;

import java.util.List;



public class QueryResult {
	private int recodeResult;
	
	private List<Product> list;

	public int getRecodeResult() {
		return recodeResult;
	}

	public void setRecodeResult(int recodeResult) {
		this.recodeResult = recodeResult;
	}

	public List<Product> getList() {
		return list;
	}

	public void setList(List<Product> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "QueryResult [recodeResult=" + recodeResult + ", list=" + list
				+ "]";
	}
	
}
