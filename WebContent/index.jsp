<%@page import="model.GameNumber"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
//initialize the game numbers
GameNumber min		= new GameNumber(0);
GameNumber max		= new GameNumber(1000);
GameNumber target	= new GameNumber();
target.setRandom(min.getValue(), max.getValue());
//initial number of guesses
GameNumber guesses	= new GameNumber(1);
String previousGuesses	= "";

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MVC Java/JSP Guessing Game</title>
</head>
<body>
<h1>Java/JSP Guessing Game</h1>
<p>Welcome to the guessing game! (MVC)</p>
<p>
Please guess a number between <%= min.getValue() %> and <%= max.getValue() %>
</p>

<form name="formGuesses" action="doGuess" method="post">

<label>Guess <%= guesses.getValue() %></label>

<input name="guess" value="0" type="text"
placeholder="Guess between <%= min.getValue() %> and <%= max.getValue() %>" />
<br />

<button type="submit">Go</button>

<!-- Temporary hidden fields to store state.
 Learning only / this is a bad practice -->

<input name="min" value="<%= min.getValue() %>" type="hidden" />
<input name="max" value="<%= max.getValue() %>" type="hidden" />
<input name="target" value="<%= target.getValue() %>" type="hidden" />
<input name="guesses" value="<%= guesses.getValue() %>" type="hidden" />
<input name="previousGuesses"	value="<%= previousGuesses %>" type="hidden" />


</form>




</body>
</html>