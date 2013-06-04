//document.addEventListener("page:change", refresh);


function refresh() {
  $("textarea").autosize();
}

$(document).ready(refresh);
document.addEventListener("page:change", refresh);