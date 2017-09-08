$(document).ready(function () {

  var result, fuse, tosearch;
  var data = $("#player-data").html();

  var playerdata = tableToJSON(data);

  var options = {
    id: "id",
    shouldSort: true,
    tokenize: true,
    matchAllTokens: true,
    threshold: 0.2,
    location: 0,
    distance: 100,
    maxPatternLength: 32,
    minMatchCharLength: 1,
    keys: ["name"]
  };

  $('#search').keyup(function (e) {

    tosearch = $("#search").val();
    fuse = new Fuse(playerdata, options);
    result = fuse.search(tosearch);
    console.log(result);
    populateResults();
  });

  function populateResults() {
    $("#player-data tr").removeClass("show").addClass("hide");
    $.each(result, function (index, value) {
      $("tr[data-id='" + value + "']").removeClass("hide").addClass("show");
    })
  }

  function tableToJSON(tablehtml) {
    var jsondata = []
    var rows = tablehtml.trim().replace(/[\r\n]/g, '').replace(/<\/tr>/g, "").replace(/<\/td>/g, "").replace("<tbody>", "").replace("</tbody>", "").split(/<tr data-id="\d*">/).filter(item => item);

    rows.forEach(function (row) {
      cells = row.trim().split("<td>").filter(item => item);
      var trimmedcells = []
      cells.forEach(function (cell) {
        trimmedcells.push(cell.trim());
      });

      jsondata.push(JSON.parse(JSON.stringify({
        id: trimmedcells[0],
        name: trimmedcells[1],
        position: trimmedcells[2],
        team: trimmedcells[3]
      })));
    });
    return JSON.parse(JSON.stringify(jsondata));
  }
});