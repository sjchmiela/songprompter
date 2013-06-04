//document.addEventListener("page:change", refresh);


function refresh() {
  $("textarea").autosize();
  $(".sortable").sortable();
}

$(document).ready(refresh);
document.addEventListener("page:change", refresh);