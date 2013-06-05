//document.addEventListener("page:change", refresh);


function refresh() {
  $(".autosize").autosize();
  $(".sortable").sortable();
  $('.datepicker').datepicker();
}

$(document).ready(refresh);
document.addEventListener("page:change", refresh);