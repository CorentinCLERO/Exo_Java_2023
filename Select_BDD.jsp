<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion à MariaDB via JSP</title>
</head>
<body>
    <h1>Exemple de connexion à MariaDB avec JSP</h1>
    <% 
    String url = "jdbc:mariadb://localhost:3306/films";
    String user = "mysql";
    String password = "mysql";

        // Charger le pilote JDBC (pilote disponible dans WEB-INF/lib)
        Class.forName("org.mariadb.jdbc.Driver");

        // Établir la connexion
        Connection conn = DriverManager.getConnection(url, user, password);
        // Exemple de requête SQL
        String sql = "SELECT idFilm, titre, année FROM Film WHERE année >= 2000";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        List<Map<String, String>> films = new ArrayList<Map<String, String>>();

        // Afficher les résultats (à adapter selon vos besoins)
        while (rs.next()) {
          Map<String, String> filmMap = new HashMap<String, String>();

          String colonne1 = rs.getString("idFilm");
          String colonne2 = rs.getString("titre");
          String colonne3 = rs.getString("année");
          
          // Remplissez la HashMap avec les données du film
          filmMap.put("id", colonne1);
          filmMap.put("titre", colonne2);
          filmMap.put("année", colonne3);

          // Ajoutez la HashMap à la liste des films
          films.add(filmMap);
  
          // Faites ce que vous voulez avec les données...
          //Exemple d'affichage de 2 colonnes
          out.println("id : " + colonne1 + ", titre : " + colonne2 + ", année : " + colonne3 + "</br>");
        }

        // Fermer les ressources 
        rs.close();
        pstmt.close();
        conn.close();
    %>

<h2>Exercice 1 : Les films entre 2000 et 2015</h2>
<p>Extraire les films dont l'année est supérieur à l'année 2000 et inférieur à 2015.</p>
<p>
Réponse : <br/>
<%
for (Map<String, String> film : films) {
  String id = film.get("id");
  String titre = film.get("titre");
  String annee = film.get("année");
  int anneenum = Integer.parseInt(annee);

  if (2000 < anneenum && anneenum < 2015) {
    out.println("id : " + id + ", titre : " + titre + ", année : " + annee + "</br>");
  }
}
%>
</p>

<h2>Exercice 2 : Année de recherche</h2>
<p>Créer un champ de saisie permettant à l'utilisateur de choisir l'année de sa recherche.</p>
<p>
Réponse : <br/>
<form method="post">
    <input type="number" id="inputValeur" name="number">
    <input type="submit" value="Afficher">
</form>

<% 
String yearString = request.getParameter("number");
int year = 0;  // Initialisation avec une valeur par défaut

if (yearString != null && !yearString.isEmpty()) {
    try {
        year = Integer.parseInt(yearString);
    } catch (NumberFormatException e) {
        // Gérer le cas où la chaîne n'est pas un nombre valide
    }
}

if (request.getMethod().equalsIgnoreCase("POST")) {
    // Le formulaire a été soumis, traitez-le ici
    // Par exemple, utilisez votre boucle pour afficher les résultats
    for (Map<String, String> film : films) {
        String id = film.get("id");
        String titre = film.get("titre");
        String annee = film.get("année");
        int anneenum = Integer.parseInt(annee);

        if (anneenum == year) {
            out.println("id : " + id + ", titre : " + titre + ", année : " + annee + "</br>");
        }
    }
}
%>

</p>

<h2>Exercice 3 : Modification du titre du film</h2>
<p>Créer un fichier permettant de modifier le titre d'un film sur la base de son ID (ID choisi par l'utilisateur)</p>
<p>
Réponse : <br/>
<form method="post">
    <label for="filmId">ID du film :</label>
    <input type="text" id="filmId" name="filmId"><br>
    <label for="newTitle">Nouveau titre :</label>
    <input type="text" id="newTitle" name="newTitle"><br>
    <input type="submit" value="Modifier le titre">
</form>
</p>
<%
if (request.getMethod().equalsIgnoreCase("POST")) {
    String filmIdString = request.getParameter("filmId");
    String newTitle = request.getParameter("newTitle");

    if (filmIdString != null && !filmIdString.isEmpty() && newTitle != null && !newTitle.isEmpty()) {
        try {
            int filmId = Integer.parseInt(filmIdString);

            // Effectuez la mise à jour du titre dans la base de données en utilisant JDBC
            // Vous devez écrire la logique de mise à jour ici en utilisant la valeur de filmId et newTitle

            // Après la mise à jour, vous pouvez afficher un message de confirmation
            out.println("Titre du film avec l'ID " + filmId + " a été modifié avec succès !");
        } catch (NumberFormatException e) {
            // Gérer le cas où filmIdString n'est pas un nombre valide
            out.println("L'ID du film n'est pas valide !");
        }
    } else {
        // Gérer le cas où les champs sont vides
        out.println("Veuillez remplir tous les champs !");
    }
}
%>


<h2>Exercice 4 : La valeur maximum</h2>
<p>Créer un formulaire pour saisir un nouveau film dans la base de données</p>
<p>
Réponse : <br/>
<%

%>
</p>

</body>
</html>