package br.com.vofffice.aw.blog.service;

import java.util.List;

import br.com.vofffice.aw.blog.dao.UserDao;
import br.com.vofffice.aw.blog.dao.mysql.UserDaoMysql;
import br.com.vofffice.aw.blog.domain.User;

public class UsuarioService {
	
	UserDao dao = new UserDaoMysql();

	public List<User> findAll() {
		return dao.findAll();
	}
	
	public User save(User user) {
		return dao.save(user);
	}
	
	public void delete(Long id) {
		User user = new User(id);
		dao.delete(user);
	}
}
