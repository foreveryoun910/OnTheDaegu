package co.yedam.otd.payment.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.otd.common.DataSource;
import co.yedam.otd.review.service.ReviewService;
import co.yedam.otd.review.serviceImpl.ReviewServiceImpl;
import co.yedam.otd.review.vo.ReviewVO;

@WebServlet("/RefundServlet")
public class RefundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public RefundServlet() {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json;charset=utf-8");

		HttpSession session = request.getSession();
		String sessionValue = String.valueOf(session.getAttribute("session"));
		System.out.println(sessionValue);

		ReviewService dao = new ReviewServiceImpl();
		ReviewVO vo = new ReviewVO();
		vo.setEmail(request.getParameter("email"));
		vo.setReviewLike(Integer.valueOf(request.getParameter("reviewLike")));
		vo.setReviewContent(request.getParameter("reviewContent"));
		dao.reviewInsert(vo);
		
		
		Gson gson = new GsonBuilder().create();
		response.getWriter().print(gson.toJson(vo));
		
		SqlSession sqlSession = DataSource.getInstance().openSession();
		sqlSession.close();	
	}
	}

