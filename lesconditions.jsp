<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>les conditions</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les conditions</h1>
<form action="#" method="post">
    <p>Saisir la valeur 1 : <input type="text" id="inputValeur" name="valeur1">
    <p>Saisir la valeur 2 : <input type="text" id="inputValeur" name="valeur2">
    <p><input type="submit" value="Afficher">
</form>
<h2>Exercice 1 : Comparaison 1</h2>
<p>Ecrire un programme qui demande à l'utilisateur de saisir 3 valeurs (des chiffres),</br>
A, B et C et dites nous si la valeur de C est comprise entre A et B.</br>
Exemple :</br>
A = 10</br>
B = 20</br>
C = 15</br>
Oui C est compris entre A et B</p>
<form action="#" method="post">
    <p>Saisir la valeur 1 : <input type="text" id="inputValeur" name="valeurcomp1"></p>
    <p>Saisir la valeur 2 : <input type="text" id="inputValeur" name="valeurcomp2"></p>
    <p>Saisir la valeur 3 pour savoir si elle est comprise entre la valeur 1 et la valeur 2 : <input type="text" id="inputValeur" name="valeurcomp3"></p>
    <p><input type="submit" value="Afficher"></p>
</form>
<%-- Récupération des valeurs --%>
    <% String valeur1 = request.getParameter("valeur1"); %>
    <% String valeur2 = request.getParameter("valeur2"); %>

    <%-- Vérification de la condition entre les deux valeurs --%>
    <% if (valeur1 != null && valeur2 != null) { %>
        <%-- Conversion des valeurs en entiers pour la comparaison --%>
        <% int intValeur1 = Integer.parseInt(valeur1); %>
        <% int intValeur2 = Integer.parseInt(valeur2); %>
        
        <%-- Condition if pour comparer les valeurs --%>
        <% if (intValeur1 > intValeur2) { %>
            <p>Valeur 1 est supérieure à Valeur 2.</p>
        <% } else if (intValeur1 < intValeur2) { %>
            <p>Valeur 1 est inférieure à Valeur 2.</p>
        <% } else { %>
            <p>Valeur 1 est égale à Valeur 2.</p>
        <% } %>
   
    

<%-- Récupération des valeurs --%>
<%
    String valeurcomp1 = request.getParameter("valeurcomp1");
    String valeurcomp2 = request.getParameter("valeurcomp2");
    String valeurcomp3 = request.getParameter("valeurcomp3");

    if (valeurcomp1 != null && valeurcomp2 != null && valeurcomp3 != null) {
        int intValeurcomp1 = Integer.parseInt(valeurcomp1);
        int intValeurcomp2 = Integer.parseInt(valeurcomp2);
        int intValeurcomp3 = Integer.parseInt(valeurcomp3);

        if (intValeurcomp3 >= intValeur1 && intValeurcomp3 <= intValeur2) {
%>
            <p>La valeur 3 est entre la valeur 1 et la valeur 2.</p>
<%
        } else {
%>
            <p>La valeur 3 n'est pas entre la valeur 1 et la valeur 2.</p>
<%
        }
    }
%>


<h2>Exercice 2 : Pair ou Impair ?</h2>
<p>Écrivez un programme pour vérifier si un nombre est pair ou impair en utilisant une structure if</p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
