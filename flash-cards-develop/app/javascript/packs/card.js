function searchInTable() {
  // Declare variables
  const userInput = document.getElementById("myInput");
  const searchQuery = userInput.value.trim().toUpperCase();

  const table = document.getElementById("myTable");
  const tableRows = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  // start from 1 bacause first row is header
  let txtValue;
  for (let i = 1; i < tableRows.length; i++) {
    rowData = tableRows[i].getElementsByTagName("td");
    for (let j = 0; j < rowData.length; j++) {
      txtValue = rowData[j].textContent || rowData[j].innerText;
      if (txtValue.toUpperCase().includes(searchQuery)) {
        tableRows[i].style.display = "";
        break;
      } else {
        tableRows[i].style.display = "none";
      }
    }
  }
}

const input = document.getElementById("myInput");

input.addEventListener('keydown', (event) => {
  searchInTable();
});
