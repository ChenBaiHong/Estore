package com.walkerChen.estore.dao;

import com.walkerChen.estore.bean.substance.User;

import java.util.List;


public interface UserDao {

	public abstract void addUser(User user);

	public abstract User findUser(String id);

	public abstract User findUser(String username, String password);

	public abstract List<User> findAllUser(String state);

	public abstract List<User> searchLikeUser(Object conditionParam);

	public boolean isExistSimilarUsername(String username);

	public User findUserByActivecode(String activecode);

	void UpdateUser(User user);

	boolean isExistSimilarEmail(String email);

	boolean isExistSimilaCellphone(String cellphone);
}