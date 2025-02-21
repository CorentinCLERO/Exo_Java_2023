<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les chaines</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les chaines de charactères</h1>
<form action="#" method="post">
    <p>Saisir une chaine (Du texte avec 6 caractères minimum) : <input type="text" id="inputValeur" name="chaine">
    <p><input type="submit" value="Afficher">
</form>
<%-- Récupération des valeurs --%>
    <% String chaine = request.getParameter("chaine"); %>
    
    <% if (chaine != null) { %>

    <%-- Obtention de la longueur de la chaîne --%>
    <% int longueurChaine = chaine.length(); %>
    <p>La longueur de votre chaîne est de <%= longueurChaine %> caractères</p>

    <%-- Extraction du 3° caractère dans votre chaine --%>
    <% char caractereExtrait = chaine.charAt(2); %>
    <p>Le 3° caractère de votre chaine est la lettre <%= caractereExtrait %></p>

    <%-- Obtention d'une sous-chaîne --%>
    <% String sousChaine = chaine.substring(2, 6); %>
    <p>Une sous chaine de votre texte : <%= sousChaine %></p>

    <%-- Recharche de la lettre "e" --%>
    <% char recherche = 'e'; 
       int position = chaine.indexOf(recherche); %>
    <p>Votre premier "e" est en : <%= position %></p>

    
<h2>Exercice 1 : Combien de 'e' dans notre chaine de charactère ?</h2>
<p>Ecrire un programme pour compter le nombre de lettre e dans votre chaine de charactères</p>
<p>
réponse : <br/>
<%
    char rechercheE = 'e';
    int compteur = 0;

    for (int i = 0; i < chaine.length(); i++) {
        if (chaine.charAt(i) == rechercheE) {
            compteur++;
        }
    }
%>
<p>Le nombre d'occurrences de 'e' dans la chaîne est : <%= compteur %></p>
</p>

<h2>Exercice 2 : Affichage verticale</h2>
<p>Ecrire le programme pour afficher le texte en vertical</br>
Exemple : Bonjour</br>
B</br>
o</br>
n</br>
j</br>
o</br>
u</br>
r</p>
<p>
réponse : <br/>
<%
    for (int i = 0; i < chaine.length(); i++) {
        char caractere = chaine.charAt(i);
%>
        <%= caractere %><br/>
<%
    }
%>
</p>

<h2>Exercice 3 : Retour à la ligne</h2>
<p>La présence d'un espace provoque un retour à la ligne </br>
Exemple : L'hiver sera pluvieux</br>
L'hiver</br>
sera</br>
pluvieux</p>
<p>
réponse : <br/>
<%
for (int i = 0; i < chaine.length(); i++) {
    char caractere = chaine.charAt(i);

    if (caractere != ' ') {
%>
        <%= caractere %>
<%
    } else {
%>
        <br/>
<%
    }
}
%>
</p>

<h2>Exercice 4 : Afficher une lettre sur deux</h2>
<p>Ecrire le programme pour afficher seulement une lettre sur deux de votre texte </br>
Exemple : L'hiver sera pluvieux</br>
Lhvrsr lvex</p>
<p>
réponse : <br/>
<%
for (int i = 0; i < chaine.length(); i++) {
    char caractere = chaine.charAt(i);

    if (i % 2 == 0) {
%>
        <%= caractere %>
<%
    }
}
%>
</p>

<h2>Exercice 5 : La phrase en verlant</h2>
<p>Ecrire le programme afin d'afficher le texte en verlant </br>
Exemple : L'hiver sera pluvieux</br>
xueivulp ares revih'l</p>
<p>
réponse : <br/>
<%
    for (int i = chaine.length() - 1; i >= 0; i--) {
        char caractere = chaine.charAt(i);
%>
        <%= caractere %>
<%
    }
%>
</p>

<h2>Exercice 6 : Consonnes et voyelles</h2>
<p>Ecrire le programme afin de compter les consonnes et les voyelles dans votre texte</p>
<p>
réponse : <br/>
<%
int compteurVoyelles = 0;
int compteurConsonnes = 0;
String voyelles = "aeiouy"; // Utilisez une chaîne de caractères pour les voyelles

for (int i = 0; i < chaine.length(); i++) {
    char caractere = chaine.charAt(i);
    
    if (voyelles.indexOf(caractere) != -1) { // Utilisez indexOf pour vérifier si le caractère est une voyelle
        compteurVoyelles++;
    } else if (caractere != ' ') {
        compteurConsonnes++;
    }
}

out.print("Il y a " + compteurVoyelles + " voyelles et " + compteurConsonnes + " consonnes.");
%>
</p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
