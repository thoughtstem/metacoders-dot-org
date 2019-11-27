
//Top 100 female names plus top 100 male names
//  From which we choose uniformly at random.
//  If someone has a more gender-neutral way of doing this.  Open a ticket with a suggestion.
//
//  ~Stephen R. Foster
var names = [
"mary",
"patricia",
"linda",
"barbara",
"elizabeth",
"jennifer",
"maria",
"susan",
"margaret",
"dorothy",
"lisa",
"nancy",
"karen",
"betty",
"helen",
"sandra",
"donna",
"carol",
"ruth",
"sharon",
"michelle",
"laura",
"sarah",
"kimberly",
"deborah",
"jessica",
"shirley",
"cynthia",
"angela",
"melissa",
"brenda",
"amy",
"anna",
"rebecca",
"virginia",
"kathleen",
"pamela",
"martha",
"debra",
"amanda",
"stephanie",
"carolyn",
"christine",
"marie",
"janet",
"catherine",
"frances",
"ann",
"joyce",
"diane",
"alice",
"julie",
"heather",
"teresa",
"doris",
"gloria",
"evelyn",
"jean",
"cheryl",
"mildred",
"katherine",
"joan",
"ashley",
"judith",
"rose",
"janice",
"kelly",
"nicole",
"judy",
"christina",
"kathy",
"theresa",
"beverly",
"denise",
"tammy",
"irene",
"jane",
"lori",
"rachel",
"marilyn",
"andrea",
"kathryn",
"louise",
"sara",
"anne",
"jacqueline",
"wanda",
"bonnie",
"julia",
"ruby",
"lois",
"tina",
"phyllis",
"norma",
"paula",
"diana",
"annie",
"lillian",
"emily",
"robin",
"james",
"john",
"robert",
"michael",
"william",
"david",
"richard",
"charles",
"joseph",
"thomas",
"christopher",
"daniel",
"paul",
"mark",
"donald",
"george",
"kenneth",
"steven",
"edward",
"brian",
"ronald",
"anthony",
"kevin",
"jason",
"matthew",
"gary",
"timothy",
"jose",
"larry",
"jeffrey",
"frank",
"scott",
"eric",
"stephen",
"andrew",
"raymond",
"gregory",
"joshua",
"jerry",
"dennis",
"walter",
"patrick",
"peter",
"harold",
"douglas",
"henry",
"carl",
"arthur",
"ryan",
"roger",
"joe",
"juan",
"jack",
"albert",
"jonathan",
"justin",
"terry",
"gerald",
"keith",
"samuel",
"willie",
"ralph",
"lawrence",
"nicholas",
"roy",
"benjamin",
"bruce",
"brandon",
"adam",
"harry",
"fred",
"wayne",
"billy",
"steve",
"louis",
"jeremy",
"aaron",
"randy",
"howard",
"eugene",
"carlos",
"russell",
"bobby",
"victor",
"martin",
"ernest",
"phillip",
"todd",
"jesse",
"craig",
"alan",
"shawn",
"clarence",
"sean",
"philip",
"chris",
"johnny",
"earl",
"jimmy",
"antonio"
]

String.prototype.toProperCase = function () {
    return this.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
};

var rand_name = names[Math.floor(Math.random() * Math.floor(names.length))].toProperCase()

function replaceOneBlank(){
  document.body.innerHTML = document.body.innerHTML.replace(/____/, rand_name);

  if(document.body.innerHTML.match(/____/)){
    setTimeout(replaceOneBlank, 100);
  }
}

replaceOneBlank()



