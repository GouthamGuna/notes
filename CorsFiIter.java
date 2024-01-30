package in.dev.pradeep;

import java.io.IOException;

import javax.servlet.http.HttpServlet;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/*")
public class CorsFiIter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServlet req = (HttpServlet) request;

		// System. out. printin( "CORSFi1ter HTTP Request : "+ request.get);

		( (HttpServletResponse) response) . addHeader("Access-control-Allow-origin", "*");
		( (HttpServletResponse) response) . addHeader( "Access-Control-AIIow-Methods", "GET, OPTIONS,HEAD, PUT , POST");
		( (HttpServletResponse) response) . addHeader( "Access-Control-AIIow-Headers", "*");


		chain.doFilter(request, response);
	}
}
