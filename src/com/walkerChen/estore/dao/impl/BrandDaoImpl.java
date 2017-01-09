package com.walkerChen.estore.dao.impl;

import com.walkerChen.estore.bean.substance.Brand;
import com.walkerChen.estore.dao.BrandDao;
import com.walkerChen.estore.dao.pagingBeanOfBrand.PageInfoOfBrand;
import com.walkerChen.estore.dao.pagingBeanOfBrand.QueryResultOfBrand;
import com.walkerChen.estore.commonUtils.JdbcUtils;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.Connection;
import java.util.List;


public class BrandDaoImpl implements BrandDao {

	@Override
	public void addBrand(Brand brand) {
		try {
			Connection connection = JdbcUtils.getConnection();
			QueryRunner queryRunner = new QueryRunner();
			String sql = "INSERT INTO Brand (id , name , description)VALUES(?,?,?)";
			Object [] params = {brand.getId() , brand.getName(), brand.getDescription()};
			queryRunner.update(connection, sql, params);
		} catch (Exception e) {
			throw new SecurityException(e);
		}
	}


	@Override
	@SuppressWarnings("deprecation")
	public Brand findBrand(String id) {
		try {
			Connection connection = JdbcUtils.getConnection();
			QueryRunner queryRunner = new QueryRunner();
			String sql = "SELECT * FROM Brand WHERE id=?";
			Brand brand = (Brand) queryRunner.query(connection, sql, id, new BeanHandler(Brand.class));
			return brand;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}


	@Override
	@SuppressWarnings("unchecked")
	public List<Brand> findAllBrand() {
		try {
			Connection connection = JdbcUtils.getConnection();
			QueryRunner queryRunner = new QueryRunner();
			String sql = "SELECT * FROM Brand";
			List<Brand> Brands = (List<Brand>) queryRunner.query(connection, sql,  new BeanListHandler(Brand.class));
			return Brands;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public void deleteBrand(String id) {
		try {
			Connection connection = JdbcUtils.getConnection();
			QueryRunner queryRunner = new QueryRunner();
			String sql = "DELETE  FROM Brand WHERE ID=?";
			queryRunner.update(connection, sql, id);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}


	@Override
	public Boolean isDuplicateName(String BrandName) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public QueryResultOfBrand getQueryResultOfBrand(
			PageInfoOfBrand queryInfo) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Brand> likeBlurredSearchBrand(Object conditionParam) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void updateBrand(Brand brand) {
		// TODO Auto-generated method stub
		
	}
}