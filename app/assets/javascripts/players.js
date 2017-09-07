$(document).ready(function () {

  var result, fuse, tosearch;
  var data = $("#player-data").html();

  var playerdata = tableToJSON(data);
  console.log(playerdata);

  function tableToJSON(tablehtml) {
    var jsondata = []
    var rows = tablehtml.trim().replace(/[\r\n]/g, '').replace(/<\/tr>/g, "").replace(/<\/td>/g, "").replace("<tbody>", "").replace("</tbody>", "").split("<tr>").filter(item => item);

    rows.forEach(function(row) {
      cells = row.trim().split("<td>").filter(item => item);
      var trimmedcells = []
      cells.forEach(function(cell) {
        trimmedcells.push(cell.trim());
      });

      jsondata.push( JSON.stringify({ id: trimmedcells[0], name: trimmedcells[1], position: trimmedcells[2], team: trimmedcells[3]}) );
    });

    return JSON.stringify(jsondata);
  }
});

// var options = {
//   keys: ['name'],
//   id: 'name'
// }

// $('#search').keyup(function (e) {

//   tosearch = $("#search").val();
//   fuse = new Fuse(data.responseJSON, options);
//   result = fuse.search(tosearch);
//   populateResults();
// });

// function populateResults() {
//   $("#tablebody").empty();
//   $.each(result, function (index, value) {

//     $("#result tbody").append(
//       "<tr>" + "<td class=\"center-align\">" + value + "</td>" + "</tr>")
//   })
// }