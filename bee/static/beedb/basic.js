// ################################################################################
function classVisibility(boxId, classID) {
  // First get the check box element
  const box = document.getElementById(boxId);
  // Now get all lines with the class name
  const tLines = document.getElementsByClassName(classID);
  // defaults to no display
  let lDisp = "none";
  if (box.checked) {
    // if the box is check, display the lines
    lDisp = "";
  }
  // Iterate through list and set the lines to the relevant display option
  for (let i = 0; i < tLines.length; i++) {
    tLines[i].style.display = lDisp;
} 
}


// ################################################################################
function pad(x)
{
    if (x < 10) return "0" + x;
    return x;
}

async function TreatRemoveDtAA()
{
  console.log("Hi Jim")
}

// ################################################################################
async function TreatRemoveDt(inDtID)
{
  
  // First get the value of the treatmentType from the form select
  var select = document.getElementById('id_treatmentType');
  const tTypeLines = document.getElementsByClassName("treatmentType");

  // Next construct the URL for our API call
 

  var url = new URL(window.location.protocol + "//" + window.location.host + "/beedb/api/treatmentType/viewByName/");
  url.searchParams.append("name", select.options[select.selectedIndex].text);

  // Make the API call
  const response = await fetch(url);
  const data = await response.json();

  if (data.length > 0)
  {
    //console.log(data[0]["name"])
    // ensure removal date is visible
    if (data[0]["requireRemoval"] == false) {
      document.getElementById("tRemoveDt").style.display = "none";
      if (document.getElementById("tCompleted") !== null){
        document.getElementById("tCompleted").style.display = "none";
      }
    } else {
      document.getElementById("tRemoveDt").style.display = "";
      if (document.getElementById("tCompleted") !== null){
        document.getElementById("tCompleted").style.display = "";
      }
    }

    //console.log("Show descr & instr")
    // make description & instruction visible and fill text
    document.getElementById("tDescr").style.display = "";
    document.getElementById("tInstr").style.display = "";
    document.getElementById("tDescrTxt").innerHTML = data[0]["description"]
    document.getElementById("tInstrTxt").innerHTML = data[0]["instructions"]

    // convert days in hive to milliseconds
    addMs = data[0]["daysInHive"] * 24 * 60 * 60 * 1000;

    // Get the insert date from the form
    const insDtTxt = document.getElementById(inDtID).value;
    const insDt = new Date(insDtTxt);
    //console.log(insDt);

    // newT is new date in ms
    newT = insDt.getTime() + addMs;
    // newDt is today plus days in hive
    nextDt = new Date(newT)
    // create date in correct format
    formDt = nextDt.getFullYear() + "-" + pad(nextDt.getMonth()+1) + "-" + pad(nextDt.getDate())
    // update form field
    document.getElementById("id_removeDt").value = formDt;
  } else {
    console.log("No API response")
    for (let i = 0; i < tTypeLines.length; i++) {
      tTypeLines[i].style.display = "none";
    }
    document.getElementById("tDescrTxt").innerHTML = "";
    document.getElementById("tInstrTxt").innerHTML = "";
  }
}

function submitform(colID)
{
  colField = document.getElementById("id_colID");
  colField.value = colID;

  document.selectForm.submit();
}

function showHide(id) {
  var x = document.getElementById(id);
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}