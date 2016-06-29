package edu.neu.nxist.continuingedu.Interceptor;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.neu.nxist.continuingedu.register.model.UserInfo;

@SuppressWarnings("serial")
public class Loginfilter  extends HttpServlet implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;  
        HttpServletResponse respon = (HttpServletResponse)response;  
        HttpSession session = req.getSession(true);
        
        String url = req.getRequestURI(); //请求的URL 
        
        UserInfo admin= (UserInfo)session.getAttribute("userInfo"); //用户信息
        if (admin == null&&url.startsWith("/ContinuingEducation/admin")) {  
            request.setAttribute("error", "请先登录!"); 
            request.getRequestDispatcher("logout").forward(request, response);  
            System.out.println("成功拦截到外星人企图入侵网站后台   :  " + url);  
            respon.setHeader("Cache-Control", "no-store");  
            respon.setDateHeader("Expires", 0);  
            respon.setHeader("Pragma", "no-cache");  
        } else {  
            chain.doFilter(request, response);  
        }  
	}

	public void init(FilterConfig filterConfig) throws ServletException {
	}

}
