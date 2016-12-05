<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.GameNumber"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
//incoming input from index.jsp
GameNumber guess 	= new GameNumber(Integer.parseInt(request.getParameter("guess")));
GameNumber min 		= new GameNumber(Integer.parseInt(request.getParameter("min")));
GameNumber max 		= new GameNumber(Integer.parseInt(request.getParameter("max")));
GameNumber target	= new GameNumber(Integer.parseInt(request.getParameter("target")));
GameNumber guesses	= new GameNumber(Integer.parseInt(request.getParameter("guesses")));

String arr = (guess.getValue() > target.getValue()) ? "<" : ">";
String previousGuesses = request.getParameter("previousGuesses") + ", " + arr + " " + guess.getValue();

String msg = "";

if( guess.getValue() == target.getValue() ){
	msg = "You guessed " + target.getValue() + " correctly in " + guesses.getValue() + " guesses!";
} else {
	msg = (guess.getValue() > target.getValue()) ? guess.getValue() + " is too high " : guess.getValue() + " is too low ";
}
guesses.increment();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java/JSP Guessing Game</title>
</head>
<body>
<h1>Java/JSP Guessing Game</h1>
<p>
<%= msg %>
</p>

<% if (guess.getValue() == target.getValue()) { %>

	<a href="index.jsp">Play Again</a>

<% } else { %>

	<form name="formGuesses" action="guess.jsp" method="post">
	
	<label>Guess <%= guesses.getValue() %></label>
	
	<input name="guess" value="0" type="text"
	placeholder="Guess between <%= min.getValue() %> and <%= max.getValue() %>" />
	<br />
	
	<button type="submit">Go</button>
	
	<!-- Temporary hidden fields to store state.
	 Learning only / this is a bad practice -->
	
	<input name="min" 		value="<%= min.getValue() %>" type="hidden" />
	<input name="max" 		value="<%= max.getValue() %>" type="hidden" />
	<input name="target" 	value="<%= target.getValue() %>" type="hidden" />
	<input name="guesses"	value="<%= guesses.getValue() %>" type="hidden" />
	<input name="previousGuesses"	value="<%= previousGuesses %>" type="hidden" />
	
	<p>Previous:<br /><%= previousGuesses %></p>	
	
	</form>
<% } %>



</body>
</html>