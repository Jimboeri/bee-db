function rowVisibility3(boxId, rowId1, rowId2, rowId3) {
    const box = document.getElementById(boxId);
    if (box.checked) {
        document.getElementById(rowId1).style.display = "";
        document.getElementById(rowId2).style.display = "";
        document.getElementById(rowId3).style.display = "";
    } else {
        document.getElementById(rowId1).style.display = "none";
        document.getElementById(rowId2).style.display = "none";
        document.getElementById(rowId3).style.display = "none";
    }
}

function arrVisibility(boxId, rowArr) {
    const box = document.getElementById(boxId);
    let i = 0;
    if (box.checked) {
        for (i = 0; i < rowArr.length; i++) {
            //console.log("Show item " + rowArr[i]);
            document.getElementById(rowArr[i]).style.display = "";
            //document.getElementById(rowArr[i]).hidden = false;
        }
    } else {
        for (i = 0; i < rowArr.length; i++) {
            //console.log("hide item " + rowArr[i]);
            document.getElementById(rowArr[i]).style.display =  "none";
            //document.getElementById(rowArr[i]).hidden = true;
        }
    }
}


function pad(x)
{
    if (x < 10) return "0" + x;
    return x;
}

async function TreatRemoveDtAA()
{
  console.log("Hi Jim")
}

async function TreatRemoveDt(inDtID)
{
  
  // First get the value of the treatmentType from the form select
  var select = document.getElementById('id_treatmentType');

  // Next construct the URL for our API call
  // get current url and split at beedb

  let hAr = window.location.href.split("beedb");
  var url = new URL(hAr[0] + "beedb/api/treatmentType/viewByName/");
  url.searchParams.append("name", select.options[select.selectedIndex].text);
  console.log(url)

  // Make the API call
  const response = await fetch(url);
  const data = await response.json();

  if (data.length > 0)
  {
    console.log(data[0]["name"])
    // ensure removal date is visible
    if (data[0]["requireRemoval"] == false) {
      document.getElementById("tRemoveDt").style.display = "none";
      document.getElementById("tCompleted").style.display = "none";
    } else {
      document.getElementById("tRemoveDt").style.display = " ";
      document.getElementById("tCompleted").style.display = " ";
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
    document.getElementById("tDescr").style.display = "none";
    document.getElementById("tInstr").style.display = "none";
  }
}