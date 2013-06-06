//document.addEventListener("page:change", refresh);


function refresh() {
  $(".autosize").autosize();
  $(".sortable").sortable();
  $('.datepicker').datepicker({dateFormat: "yy-mm-dd"});
}

$(document).ready(refresh);
document.addEventListener("page:change", refresh);