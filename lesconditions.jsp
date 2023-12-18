<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Les conditions</title>
</head>
<body bgcolor="white">
<h1>Exercices sur les conditions</h1>
<form action="#" method="post">
    <p>Saisir la valeur 1 : <input type="text" id="inputValeur1" name="valeur1"></p>
    <p>Saisir la valeur 2 pour comparer à la valeur 1 : <input type="text" id="inputValeur2" name="valeur2"></p>
    <p>Saisir la valeur 3 pour savoir si elle est comprise entre 1 et 2 : <input type="text" id="inputValeur3" name="valeur3"></p>
    <p><input type="submit" value="Afficher"></p>
</form>

<%-- Récupération des valeurs --%>
<%
    String valeur1 = request.getParameter("valeur1");
    String valeur2 = request.getParameter("valeur2");
    String valeur3 = request.getParameter("valeur3");

    if (valeur1 != null && !valeur1.isEmpty() && valeur2 != null && !valeur2.isEmpty() && valeur3 != null && !valeur3.isEmpty()) {
        try {
            int intValeur1 = Integer.parseInt(valeur1);
            int intValeur2 = Integer.parseInt(valeur2);
            int intValeur3 = Integer.parseInt(valeur3);

            if ((intValeur3 > intValeur1 && intValeur3 < intValeur2) || (intValeur3 < intValeur1 && intValeur3 > intValeur2))
            {
%>
                <p>La valeur 3 est entre la valeur 1 et la valeur 2.</p>
<%
            } else {
%>
                <p>La valeur 3 n'est pas entre la valeur 1 et la valeur 2.</p>
<%
            }
        } catch (NumberFormatException e) {
%>
            <p>Erreur de conversion en entier.</p>
<%
        }
    } else if (valeur2 != null && !valeur2.isEmpty()) {
        int intValeur1 = Integer.parseInt(valeur1);
        int intValeur2 = Integer.parseInt(valeur2);

        if (intValeur1 > intValeur2) {
%>
            <p>Valeur 1 est supérieure à Valeur 2.</p>
<%
        } else if (intValeur1 < intValeur2) {
%>
            <p>Valeur 1 est inférieure à Valeur 2.</p>
<%
        } else {
%>
            <p>Valeur 1 est égale à Valeur 2.</p>
<%
        }
    } else if (valeur1 != null && !valeur1.isEmpty()) {
        int intValeur1 = Integer.parseInt(valeur1);
        if (intValeur1 % 2 == 0) {
%>
            <p>Le nombre est pair.</p>
<%
        } else {
%>
            <p>Le nombre est impair.</p>
<%
        }
    } else {
%>
        <p>Veuillez entrer un chiffre.</p>
<%
    }
%>


<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
