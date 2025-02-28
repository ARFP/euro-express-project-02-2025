async function fetchAndProcessJSON(url,cell) {
    try {
        const response = await fetch(url);

        if (!response.ok) {
            throw new Error(`Erreur HTTP : ${response.status}`);
        }

        const data = await response.json();

        let arrayList = data.destinations[cell];

      
        return arrayList; // Retourne les données pour un usage ultérieur

    } catch (error) {
        console.error("Erreur lors de la récupération du JSON :", error);
    }
}

// Fonction pour insérer le résultat dans le DOM
async function displayData(cell) {
    let datalist = await fetchAndProcessJSON('./assets/Json/destination.json',cell);

    console.log(Object.keys(datalist));

    let dataname = Object.keys(datalist);


    for(let y=1; y < dataname.length; y++){

        console.log(dataname[y]);

    document.getElementById("booking-"+dataname[y]).innerHTML = datalist[dataname[y]];

    }

}


function getParam(){


            const queryString = window.location.search;
        console.log(queryString);

        const urlParams = new URLSearchParams(queryString);

        return urlParams.get('destination');


}


// Appel de la fonction après le chargement de la page
displayData(getParam());

document.getElementById("bookingForm").addEventListener("submit", function(event) {
    event.preventDefault(); // Empêche le rechargement de la page

    const form = event.target;
    const formData = new FormData(form);
    
    // Convertir les données du formulaire en paramètres d'URL
    const queryString = new URLSearchParams(formData).toString();
    const apiUrl = "http://localhost:8080/booking/create?" + queryString;

    fetch(apiUrl, {
        method: "GET",
        headers: {
            "Accept": "application/json",
        }
    })

});

