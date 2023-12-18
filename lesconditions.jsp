<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>
<form action="#" method="post">
    <p>Saisir la valeur 1 : <input type="text" id="inputValeur" name="valeur1"></p>
    <p>Saisir la valeur 2 pour comparer à la valeur 1 : <input type="text" id="inputValeur" name="valeur2"></p>
    <p>Saisir la valeur 3 pour savoir si elle est comprise entre 1 et 2 : <input type="text" id="inputValeur" name="valeur3"></p>
    <p><input type="submit" name="submit" value="Afficher"></p>
    <p><input type="submit" name="exo1" value="Exercice 1"></p>
    <p><input type="submit" name="exo2" value="Exercice 2"></p>
</form>

<%-- Récupération des valeurs --%>
<%
    String valeur1 = request.getParameter("valeur1");
    String valeur2 = request.getParameter("valeur2");
    String valeur3 = request.getParameter("valeur3");

    if (request.getParameter("submit") != null) {
        if (valeur1 != null && valeur2 != null && valeur3 != null) {
            try {
                int intValeur1 = Integer.parseInt(valeur1);
                int intValeur2 = Integer.parseInt(valeur2);
                int intValeur3 = Integer.parseInt(valeur3);
    
                if (intValeur3 > intValeur1 && intValeur3 < intValeur2) {
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
                <p>Les valeurs saisies ne sont pas des nombres valides.</p>
        <%
            }
        } else if (valeur2 != null) {
            try {
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
            } catch (NumberFormatException e) {
        %>
                <p>Les valeurs saisies ne sont pas des nombres valides.</p>
        <%
            }
        } else if (valeur1 != null) {
            try {
                int intValeur1 = Integer.parseInt(valeur1);

                if (intValeur1 % 2 == 0) {
        %>
                    <p>Le nombre est pair.<p>
        <%
                } else {
        %>
                    <p>Le nombre est impair.</p>
        <%
                }
            } catch (NumberFormatException e) {
        %>
                <p>La valeur saisie n'est pas un nombre valide.</p>
        <%
            }
        } else {
        %>
            <p>Veuillez entrer un chiffre.</p>
        <%
        }
    } else if (request.getParameter("exo1") != null) {
        // Code pour l'exercice 1
        // Vous pouvez ajouter ici votre code pour l'exercice 1
    } else if (request.getParameter("exo2") != null) {
        // Code pour l'exercice 2
        // Vous pouvez ajouter ici votre code pour l'exercice 2
    }
%>

<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
