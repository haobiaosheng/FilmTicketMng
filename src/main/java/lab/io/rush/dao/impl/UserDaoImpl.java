package lab.io.rush.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import lab.io.rush.dao.UserDao;
import lab.io.rush.pojo.User;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository("userDao")
public class UserDaoImpl extends HibernateDaoSupport implements UserDao{
	
	private String hql;
	
	@Resource(name = "sessionFactory")  
    public void setMySessionFactory(SessionFactory sessionFactory){  
        super.setSessionFactory(sessionFactory);  
    }

	@Override
	public User login(User user) {
		hql = "from User u where u.email = '"+ user.getEmail() + "'";
		List userList = getHibernateTemplate().find(hql);
		if (userList.size() == 0) {
			getHibernateTemplate().save(user);
		}else {
			user = (User) userList.get(0);
		}
		return user;
	}

}
