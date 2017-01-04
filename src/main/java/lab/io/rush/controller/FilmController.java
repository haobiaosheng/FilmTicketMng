package lab.io.rush.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lab.io.rush.model.FilmModel;
import lab.io.rush.pojo.Film;
import lab.io.rush.pojo.Record;
import lab.io.rush.pojo.User;
import lab.io.rush.service.FilmService;
import lab.io.rush.service.RecordService;
import lab.io.rush.service.UserService;
import lab.io.rush.util.DateUtil;
import lab.io.rush.util.EmailUtil;
import lab.io.rush.util.Paging;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/film/")
public class FilmController {
	
	@Autowired
	private FilmService filmService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RecordService recordService;
	
	@Autowired
	private EmailUtil email;
	
	@RequestMapping("filmInfos.do")
	public String filmInfos(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		String curPage = request.getParameter("curPage");
		FilmModel filmModel = filmService.getFilms("filmInfos.do", curPage);
		request.setAttribute("films", filmModel);
		return "film";
		
	}
	
	@RequestMapping("login.do")
	public void login(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		ServletOutputStream os = response.getOutputStream();
		response.setContentType("application/json;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		User user = new User();
		user.setEmail(email);
		request.getSession().setAttribute("user", userService.login(user));
		os.write("success".getBytes("UTF-8"));
		
	}
	
	@RequestMapping("quit.do")
	public void quit(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ServletOutputStream os = response.getOutputStream();
		response.setContentType("application/json;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.getSession().setAttribute("user", null);
		os.write("success".getBytes("UTF-8"));
		
	}
	
	@RequestMapping("snap.do")
	public String snap(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String filmId = request.getParameter("filmId");
		Film film = filmService.getFilmById(Integer.parseInt(filmId));
		List<Film> hotFilms = filmService.getHotFilms(film.getId());
		request.setAttribute("film", film);
		request.setAttribute("hotFilms", hotFilms);
		
		return "content";
		
	}
	
	@RequestMapping("shopping.do")
	public void shopping(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		ServletOutputStream os = response.getOutputStream();
		response.setContentType("application/json;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		String filmId = request.getParameter("filmId");
		String ticketNum = request.getParameter("ticketNum");
		Film film = filmService.getFilmById(Integer.parseInt(filmId));
		User user = (User)request.getSession().getAttribute("user");
		Record record = new Record();
		record.setFilm(film);
		record.setTicketNum(Integer.parseInt(ticketNum));
		record.setUser(user);
		record.setSnapTime(DateUtil.getData());
		if (recordService.addRecord(record)) {
			String subject = "抢票成功通知";
			String content = "尊敬的" +user.getEmail()+ ",您于" + DateUtil.getData() + 
					"成功抢购了" + ticketNum + "张《" + film.getFilmName() + "》,请在当天到指定的电影院观看，再次感谢您的参与，祝安好！";
			String aimEmail = user.getEmail();
			email.sendEmail(subject, content, aimEmail);
			
			os.write("success".getBytes("UTF-8"));
		}else {
			os.write("fail".getBytes("UTF-8"));
		}
		
	}

}
