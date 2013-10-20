var currentPane = 1;

function closePopup(id) {
  d3.select(id).style("display","none");
  popupSelect(1);
}

function openPopup(id) {
  d3.select(id).style("display","block");
  popupSelect(1);
}

function updatePopupHeading(id, text) {
  d3.select(id).select("h1").text(text);
}

function updatePopupBody(id, text) {
  d3.select(id).select("p").text(text);
}

function updatePopupPosition(id,x,y) {
  d3.select(id).style("position","absolute").style("left",x+"px").style("top",y+"px");
}

function popupSelect(paneNumber) {
  if (paneNumber == 1) {
    currentPane = 1;
    document.getElementById("mapPopupPage1").style.display="inline";
    document.getElementById("mapPopupPage2").style.display="none";
    document.getElementById("mapPopupPage3").style.display="none";
  } else if (paneNumber == 2) {
    currentPane = 2;
    document.getElementById("mapPopupPage1").style.display="none";
    document.getElementById("mapPopupPage2").style.display="inline";
    document.getElementById("mapPopupPage3").style.display="none";
  } else {
    if (paneNumber == 3) {
      currentPane = 3;
    } else {
      currentPane = 4;
    }
    document.getElementById("mapPopupPage1").style.display="none";
    document.getElementById("mapPopupPage2").style.display="none";
    document.getElementById("mapPopupPage3").style.display="inline";
  }
}

//Get maximum element of an input array
function getMax(inputArray) {
  var currentMax = 0;
  if (inputArray != null) {
    for (var i = 0; i < inputArray.length; i++) {
      if (Number(currentMax) < Number(inputArray[i])) {
        currentMax = inputArray[i];
      }
    }
  }
  return currentMax;
}