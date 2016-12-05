package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GameNumber;
import sun.rmi.server.Dispatcher;

/**
 * Servlet implementation class GameServlet
 */
@WebServlet(description = "Processes the player's guess and creates a response to send back.", urlPatterns = { "/doGuess", "/GameServlet" })
public class GameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//get incoming game values
		GameNumber min 		= new GameNumber(Integer.parseInt(request.getParameter("min")));
		GameNumber max 		= new GameNumber(Integer.parseInt(request.getParameter("max")));
		GameNumber guess 	= new GameNumber(Integer.parseInt(request.getParameter("guess")));
		GameNumber target 	= new GameNumber(Integer.parseInt(request.getParameter("target")));
		GameNumber guesses	= new GameNumber(Integer.parseInt(request.getParameter("guesses")));
		
		//analyze the values
		//formulate response
		
		String msg = "You guessed " + guess.getValue();
		String uri = "/guess.jsp";
		if (guess.getValue() == target.getValue()) {
			msg += " correctly in " + guesses.getValue() + " guesses.";
			uri = "/correct.jsp";
		} else {
			msg += (guess.getValue() > target.getValue()) ? " and that's too high." : " and that's too low.";
			guesses.increment();
		}

		//add values to request
		request.setAttribute("msg", msg);
		request.setAttribute("guesses", guesses);
		
		//forward the processing
		RequestDispatcher dispatch = request.getRequestDispatcher(uri);
		dispatch.forward(request, response);
		
//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//		
//		//I'm not going to waste time copy/pasting every line of index.jsp into println() like at ~20m
//		//Turns out that the gist of this video / series is an exercise in the bad habit of generating
//		//view in the controller -- don't do it.
//		
//		out.println(msg);
		
//		response.getWriter().append("This was added by GameServlet::doPost()");
//		doGet(request, response);
	}


}
