<?php
  echo "OK !";

  try {
    $connexion = new PDO('mysql:host=<SGBD HOST>','<USERNAME>','<PASSWORD>');
    $req = "SELECT * FROM stage.stagiaires ORDER BY prenom,nom";
    $sth = $connexion->prepare($req);
    $sth->execute();

    print("Stagiaire :\n");
    print("<table>\n");
    print("<tr><th>Prénom</th><th>Nom</th><th>Émail</th></tr>\n");
    while ($ligne = $sth->fetch(PDO::FETCH_ASSOC)) {
      print("<tr><td>$ligne[prenom]</td><td>$ligne[nom]</td><td>$ligne[email]</td>\n");
    }
    print("</table>\n");
  } catch (Exception $e) {
      die($e->getMessage());
  }
?>
