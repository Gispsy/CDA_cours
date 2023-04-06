let message = "Hello";
alert(message);

//Fonction pour savoir le prenom, nom et sexe d'une personne basique
function Exo01() {
    let prenom;
    let nom;
    let sexe;

    prenom = window.prompt("Entrer votre prenom");
    console.log(prenom);

    nom = window.prompt("Entrer votre nom");
    console.log(nom);

    if (sexe = window.confirm("Est tu un homme ?") == true) {
        alert("tu est un homme");
        console.log(sexe);
    } else {
        alert("tu est une femme");
        console.log(sexe);
    }

}
//Exo01();

//Condition
//Fonction qui sert pour savoir si un nombre est pair ou impair
function Exo02() {
    let nombre = window.prompt("Entrer un nombre");

    if (nombre % 2 == 0) {
        alert("Le nombre est pair");
    } else {
        alert("Le nombre est impair")
    }
}
//Exo02();

//Fonction ou on donne une année pour ensuite savoir l'age et savoir si il est mienur ou majeur

function Exo03() {
    let age = new Date(window.prompt("Entrer votre année de naissance"));
    age = age.getFullYear();
    //console.log(age.getFullYear());
    let annee = new Date();                                         //Date du jour
    annee = annee.getFullYear();                                            //ne prend que l'année actuelle
    //console.log(année.getFullYear());
    let diff = annee - age;
    console.log(diff);

    if (diff >= 18) {
        alert("Vous avez " + diff + " est vous etes majeur")
    } else {
        alert("Vous avez " + diff + " est vous etes mineur")
    }

}
//Exo03();

//Calculette

function Calculette() {
    let nombre1 = window.prompt("Entrer votre premier nombre");
    let operateur = window.prompt("Entrer votre opérateur");
    let nombre2 = window.prompt("Entrer votre deuxieme nombre");
    let resultat;
    console.log(operateur);

    if (operateur == "*" || operateur == "-" || operateur == "/" || operateur == "+" || operateur == "x") {
        switch (operateur) {
            case operateur = "*":
                resultat = nombre1 * nombre2;
                alert(nombre1 + operateur + nombre2 + "=" + resultat)
                break;

            case operateur = "+":
                resultat = nombre1 + nombre2;
                alert(nombre1 + operateur + nombre2 + "=" + resultat)
                break;

            case operateur = "-":
                resultat = nombre1 - nombre2;
                alert(nombre1 + operateur + nombre2 + "=" + resultat)
                break;

            case operateur = "/":
                resultat = nombre1 / nombre2;
                alert(nombre1 + operateur + nombre2 + "=" + resultat)
                break;

            case operateur = "x":
                resultat = nombre1 * nombre2;
                alert(nombre1 + operateur + nombre2 + "=" + resultat)
                break;
        }
    } else {
        alert("L'opérateur n'est pas bon");
    }

}
//Calculette();

function Remis(){
    let prix = window.prompt("Entrer le prix du produit");
    let Qte = window.prompt("Entrer la quantité");
    let PAP = prix * Qte;
    let PORT = 6;
    let REM;
    let TOT;

    

}
Remis();