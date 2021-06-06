package myservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RequestServlet
 */
@WebServlet("/rs")
public class RequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter outa = response.getWriter();
		request.setCharacterEncoding("utf-8");
		
//		String[] hobby = request.getParameterValues("hobby");
//		if(hobby!=null)
//			for(String s : hobby)
//				out.println("<h3>" + s + "</h3>");
		
		// ������ȡ������ֵ
		// ��ȡ����������
		Enumeration<String> pnames = request.getParameterNames();
		// ����pnames
		while(pnames.hasMoreElements())
		{
			String name = pnames.nextElement();
			// �������ֶ�ȡ������ֵ
			String [] values = request.getParameterValues(name);
			// �������������
			outa.println("<h3>" + name + ": ");
			if(values != null)
			{
				for(String s : values)
					outa.println(s + " ");
				outa.println("</h3>");
			}
			else
				outa.println("null</h3>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
