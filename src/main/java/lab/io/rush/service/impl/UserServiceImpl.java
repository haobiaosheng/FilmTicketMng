package lab.io.rush.service.impl;

import lab.io.rush.dao.UserDao;
import lab.io.rush.pojo.User;
import lab.io.rush.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;

	@Override
	public User login(User user) {
		return userDao.login(user);
	}

}
