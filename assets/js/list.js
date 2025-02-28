async function fetchAndProcessJSON(url) {
    try {
        const response = await fetch(url);

        if (!response.ok) {
            throw new Error(`Erreur HTTP : ${response.status}`);
        }

        const data = await response.json();

        let arrayList = "";
        let i = 0;

        console.log(data.destinations);

        // Parcours des données avec un forEach
        data.destinations.forEach(item => {

                arrayList += "<div class='destination'>";
                arrayList += "<img src ='"+item["image"]+"' alt='"+item["destination"]+"'>";
                arrayList += "<div class='description'>";
                arrayList += "<h2>"+item["destination"]+" : à "+item["heureDepart"]+" | <span class='blue'> "+item["prix"]+" €</span></h2>";
                arrayList += "<p>"+item["description"]+"</p>";
                arrayList += "<a href='formulaire.html?destination="+i+"'>";
                arrayList += "<button class='bouton'>Réservation</button>";
                arrayList += "</a>";
                arrayList += "</div>";
                arrayList += "</div>";

                 i++;

        });

        return arrayList; // Retourne les données pour un usage ultérieur

    } catch (error) {
        console.error("Erreur lors de la récupération du JSON :", error);
    }
}

// Fonction pour insérer le résultat dans le DOM
async function displayData(term) {
    let datalist = await fetchAndProcessJSON('./assets/Json/destination.json');
    document.getElementById("destinations").innerHTML = datalist;
}

// Appel de la fonction après le chargement de la page
displayData("");

