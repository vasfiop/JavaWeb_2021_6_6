package myservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * Servlet implementation class RequesHeader
 */
@WebServlet("/rh")
public class RequesHeader extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequesHeader() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		// ��ȡ��������ͷ����name
		Enumeration<String> names = request.getHeaderNames();
		// ����names�õ���������ͷ����name
		while(names.hasMoreElements())
		{
			// ��ȡ��һ��ͷ����name
			String name = names.nextElement();
			// ͨ������ͷ����name��ȡͷ��value��ֵ
			String value = request.getHeader(name);
			// �������ͷ����name��value
			out.println("<h3>" + name + ": " + value + "</h3>");
		}
		
		out.println("<h3>Request Context: " + request.getContextPath() + "</h3>");
		out.println("<h3>Request Method: " + request.getMethod() + "</h3>");
		out.println("<h3>Request Protocol: " + request.getProtocol() + "</h3>");
		out.println("<h3>Request URI: " + request.getRequestURI() + "</h3>");
		out.println("<h3>Request QureString: " + request.getQueryString() + "</h3>");
		out.println("<h3>Servlet Path: " + request.getServletPath() + "</h3>");
		out.println("<h3>Request URL: " + request.getRequestURL() + "</h3>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
