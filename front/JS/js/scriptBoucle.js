//Menu des exos

function Menu() {

}


//Saisie

function Saisie() {
    let cpt = 0                                             //Compte le nombre prenom rentrer 
    let t = true;

    while (t) {
        let prenom = window.prompt("Saisi numero " + cpt + " Entrer un prenom")      //Fait entrer un prenom a l'utilisateur
        if (prenom == "") {
            alert("tu n'a plus rentrer de prenom le jeux est fini");
            break;

        } else {
            cpt++;
            console.log(cpt);
            alert("tu a rentrer " + prenom);
        }
    }
}
//Saisie();

//Inferieur au nombre donner

function cal() {
    let N = window.prompt("Entrer un numéro");

    for (i= 1; i <= N; i++) {
        console.log(N-i);
    }
}
//cal();

//Ajout la somme de tout les chiffre a partir de celui donner

function cal2() {
    let N = parseInt(window.prompt("Entrer un numéro"));
    let total = 0;

    for (i= 0; i <= N; i++) {
        total = total + i;
        console.log(total);

    }
}
//cal2();

//Somme Intervalle

function intervalle(){
    let n1 = parseInt(window.prompt("Entrer le premier chiffre de l'intervalle"));
    let n2 = parseInt(window.prompt("Entrer le premier chiffre de l'intervalle"));

    

}
intervalle();