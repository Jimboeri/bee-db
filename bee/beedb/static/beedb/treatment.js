async function TreatRemoveDtXX()
{
  // First get the value of the treatmentType from the form select
  var select = document.getElementById('id_treatmentType');

  // Next construct the URL for our API call
  // get current url and split at beedb
  console.log(window.location.href);
  let hAr = window.location.href.split("beedb");
  console.log(hAr);

  //var url = new URL(hAr[0] + "beedb/api/treatmentType/viewByName/");
  
  //var url = new URL("http://localhost:8005/beedb/api/treatmentType/viewByName/");
  //url.searchParams.append("name", select.options[select.selectedIndex].text);
  //console.log(url);

  // Make the API call
  //const response = await fetch(url);
  //const data = await response.json();
  const data = [];
  if (data.length > 0)
  {
    // ensure removal date is visible
    if (data[0]["requireRemoval"] == false) {
      document.getElementById("tRemoveDt").style.display = "none";
      document.getElementById("tRemoveDt").hidden = false;
    }
    // convert days in hive to milliseconds
    addMs = data[0]["daysInHive"] * 24 * 60 * 60 * 1000;

    // Get the insert date from tyhe form
    const insDtTxt = document.getElementById("id_insertDt").value;
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
  }
}

