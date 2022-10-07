function yep(){
    var dt = new Date();
    let selectedElement = document.getElementById("datetime")
    console.log(selectedElement)
    selectedElement.innerText = dt.getMinutes();
}

function hide(){
    let selectedElement2 = document.getElementById("element")
    console.log(selectedElement2)
    selectedElement2.style.display="none";
}

function popup(){
    alert("Welcome to the website!!!!!!!");
}


function parseArray(){ 
    var array = [], inputCat=['First Number','Second Number','Third Number','Fourth Number']; 
    inputCat.forEach((item) => {
        var input = prompt(`enter one ${item}`);
        array.push(input);
      });
    array.sort
    document.getElementById('array').innerText = `You entered ${array.join(', ')}.
    I sorted them ${array.sort((a, b) => a - b).join(', ')}`;
}





function wikiAPI(){

    var searchTerm =document.getElementById('searchTerm').value;
    var connect =new XMLHttpRequest();
    var url=  "https://en.wikipedia.org/w/api.php?action=query&origin=*&format=json&generator=search&gsrnamespace=0&gsrlimit=20&gsrsearch=" + searchTerm;
    connect.open('GET',url);
    connect.onload = function(){
        var wikiObject = JSON.parse(this.response);
        var pages = wikiObject.query.pages;
        for (var i in pages){
            var newDiv = document.createElement("div");
            newDiv.setAttribute('class','row h4');
            document.getElementById("wiki").appendChild(newDiv);
            newDiv.innerText=pages[i].title;
            
        }
    }
    connect.send();
}

function mapLoad(){
   
    var latLng = [ 27.98744, 86.92468,];
  
    var mbAttr = 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, ' +
    'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    mbUrl = 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw';
  
    var grayscale   = L.tileLayer(mbUrl, {id: 'mapbox/light-v9', tileSize: 512, zoomOffset: -1, attribution: mbAttr}),
    streets  = L.tileLayer(mbUrl, {id: 'mapbox/streets-v11', tileSize: 512, zoomOffset: -1, attribution: mbAttr});
  
    var map = L.map('map', {
      center: latLng,
      zoom: 16,
      layers: [streets]
    });
  
    var baseLayers = {
      "Grayscale": grayscale,
      "Streets": streets
    };
  
    L.control.layers(baseLayers).addTo(map);
  
    L.marker(latLng).addTo(map)
    .bindPopup("<b>Mount<br>Everest</b>").openPopup();
  
  
  

    var popup = L.popup();
  
    function onMapClick(e) {
      popup
      .setLatLng(e.latlng)
      .setContent("You clicked the map at " + e.latlng.toString())
      .openOn(map);
    }
    map.on('click', onMapClick);
  }

var parentElement = document.getElementById('ochreTableBody');
var url= "https://ochre.lib.uchicago.edu/ochre?uuid=accd571b-bae3-4d42-93d9-58b65ec79300";

function loadXML(){
    XMLrequest(url); 
    console.log('loadXML -- ok');
};

function XMLrequest(link){
    var connect2 = new XMLHttpRequest();
    connect2.onreadystatechange = function() {
        if (this.readyState == 4 && this.status ==200){
            listTexts(this.responseXML);
    
        };
    };
    connect2.open('GET', link, true);
    connect2.send();
    console.log('XML request -- ok'); 
}

function listTexts(sourceXML){

    document.getElementById('projectTitle').innerText = sourceXML.getElementsByTagName('metadata')[0].children[1].innerHTML;
    document.getElementById('setTitle').innerText= sourceXML.getElementsByTagName('set')[0].children[3].children[0].innerHTML;
    document.getElementById('setDescription').innerText= sourceXML.getElementsByTagName('set')[0].children[4].innerHTML;
    var licenseText = document.getElementById('license');
    licenseText.innerText = sourceXML.getElementsByTagName('availability')[0].children[0].innerHTML;
    licenseText.setAttribute('href',sourceXML.getElementsByTagName('availability')[0].children[0].attributes[0].nodeValue);




    console.log(sourceXML);
    var textList = sourceXML.getElementsByTagName('text');
    console.log(textList);
    for (i=0; i<textList.length; i++){
        var tr= document.createElement('tr');
        tr.setAttribute('class','ochretableRows');
        tr.setAttribute('id', 'row_'+i);
        document.getElementById('ochretableBody').appendChild(tr);
        var td=document.createElement('td');
        td.setAttribute('id','td_name_'+i);
        td.textContent = textList[i].children[0].children[0].innerHTML;
        document.getElementById('row_'+i).appendChild(td);
        var td2 = document.createElement('td');
        td2.setAttribute('id','td_desc_'+i);
        td2.textContent = textList[i].children[3].innerHTML;
        document.getElementById('row_'+i).appendChild(td2);
    }

}