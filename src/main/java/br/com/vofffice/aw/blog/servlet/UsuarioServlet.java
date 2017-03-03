package br.com.vofffice.aw.blog.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.vofffice.aw.blog.dao.UserDao;
import br.com.vofffice.aw.blog.dao.mysql.UserDaoMysql;
import br.com.vofffice.aw.blog.domain.User;
import br.com.vofffice.aw.blog.service.UsuarioService;

/**
 * Servlet implementation class UsuarioServlet
 */
@WebServlet("/user/*")
public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao dao = new UserDaoMysql();
		
		List<User> users = dao.findAll();
		request.setAttribute("users", users);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/userPages/list.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getPathInfo();
		
		UsuarioService service = new UsuarioService();
		Long id = null;
		String strId = request.getParameter("id");
		if (strId != null) {
			id = Long.valueOf(strId);
		}
		
		String destino = null;
		
		switch(acao) {
			case "/delete" :
				service.delete(id);
				request.setAttribute("users", service.findAll());
				destino = "/userPages/list.jsp";
				break;
			case "/edit" :
				destino = "/userPages/form.jsp";
				break;
				
			case "/save" :
				String fullName = request.getParameter("fullName");
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				
				User user = new User(id, fullName, username, password);
				service.save(user);

				request.setAttribute("users", service.findAll());
				
				destino = "/userPages/list.jsp";
				break;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(destino);
		dispatcher.forward(request, response);
		
	}

}
