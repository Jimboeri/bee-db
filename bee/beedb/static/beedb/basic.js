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
