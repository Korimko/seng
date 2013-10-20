//This file contains code static information about parties, such as party affiliations and colors
//Note some of the names for the parties affiliations are not official names, but shortforms used by the AEC data file

var coalition = ["Liberal Party of Australia","Liberal National Party of Queensland","National Party of Australia","Country Liberal Party","Liberal","Liberal/National Coalition","The Nationals","Country Liberals NT","Coalition"];
var labor = ["Australian Labor Party","Labor","Australian Labor Party Northern Territory Branch"];
var other = ["Palmer United Party","Katters Australian Party","Independent","The Greens","Other Parties", "Australian Greens", "The Greens WA", "Socialist Alliance", "Citizens Electoral Council", "Australia First Party", "One Nation", "Christian Democratic Party Fred Nile Group", "Family First Party", "Sex Party", "Family First", "Secular Party of Australia"];
var individualColors = [
  {"party":"Liberal Party of Australia", "color": "#006fb9"},
  {"party":"Liberal National Party of Queensland", "color": "#006fb9"},
  {"party":"National Party of Australia", "color": "#006fb9"},
  {"party":"Country Liberal Party", "color": "#006fb9"},
  {"party":"Liberal", "color": "#006fb9"},
  {"party":"Liberal/National Coalition", "color": "#006fb9"},
  {"party":"The Nationals", "color": "#006fb9"},
  {"party":"Country Liberals NT", "color": "#006fb9"},
  {"party":"Coalition", "color": "#006fb9"},
  {"party":"Australian Labor Party", "color": "#bf311a"},
  {"party":"Country Labor", "color": "#bf311a"},
  {"party":"Labor", "color": "#bf311a"},
  {"party":"Australian Labor Party Northern Territory Branch", "color": "#bf311a"},
  {"party":"The Greens", "color": "#00FF00"},
  {"party":"Australian Greens", "color": "#00FF00"},
  {"party":"Independent", "color": "#FF7F00"},
  {"party":"Australian Independent", "color": "#FF7F00"},
  {"party":"Sex Party", "color": "#FFFF00"},
  {"party":"Palmer United Party", "color": "#FF8500"},
  {"party":"Christian Democratic Party Fred Nile Group", "color": "#909090"},
  {"party":"Christian Democratic Party", "color": "#C0C0C0"},
  {"party":"Family First Party", "color": "#CECECE"},
  {"party":"Rise Up Australia Party", "color": "#800080"},
  {"party":"Stable Population Party", "color": "#C9AE5D"},
  {"party":"Citizens Electoral Council", "color": "#C9AE5D"},
  {"party":"Australian Christians", "color": "#C0C0C0"},
  {"party":"The Greens WA", "color": "#00FF00"},
  {"party":"Katters Australian Party", "color": "#FF8500"},
  {"party":"One Nation", "color": "#FF8500"},
  {"party":"Democratic Labour Party DLP", "color": "#000080"},
  {"party":"Australia First Party", "color": "#915F6D"},
  {"party":"Bullet Train For Australia", "color": "#915F60"},
  {"party":"AFNPP", "color": "#FF7F00"}
];
var LIBERAL_COLOR = "#006fb9";
var LABOR_COLOR = "#bf311a";
var OTHER_COLOR = "#FF7F00";



//Get the affiliation of a given party, this could be either Coalition or Labor, or Other for anyone else
//If the party is unrecognized, the function will print an appropriate error response to the console
function getParty(party) {
  for (var i = 0; i < coalition.length; i++) {
    if (party == coalition[i]) {
      return "Coalition";
    }
  }
  for (var i = 0; i < labor.length; i++) {
    if (party == labor[i]) {
      return "Labor";
    }
  }
  for (var i = 0; i < other.length; i++) {
    if (party == other[i]) {
      return "Other";
    }
  }
  console.log("parties: failed to find a matching party for " + party);
}

function getPartyAffiliationColor(party) {
  var partyAffiliation = getParty(party);
  if (partyAffiliation == "Coalition") {
    return LIBERAL_COLOR;
  } else if (partyAffiliation == "Labor") {
    return LABOR_COLOR;
  } else if (partyAffiliation == "Other") {
    return OTHER_COLOR;
  } else {
    return "#000000";
  }
}

function getPartyColor(party) {
  for (var i = 0; i < individualColors.length; i++) {
    if (party == individualColors[i].party) {
      return individualColors[i].color;
    }
  }
  console.log("Failed to find a color for party " + party);
  return "#000000";
}