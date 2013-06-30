// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.ui.sortable

function newLines(text) {
  var lines = text.split("\n");
  return lines.join("<br />\n");
}

function copySongsText() {
  var chorus = $("#js-chorus")[0].innerText;
  console.log("chorus: "+chorus);
  var verses = $(".js-verse");
  var text = "";
  if (chorus != "") {
    text = chorus+"\n###\n";
  }
  verses.each(function (index) {
      text = text + verses[index].innerText;
      if(verses[index].innerText != "") {
        if(index != verses.length-1) {
          text = text + "\n===\n";
        }
      }
  });
  $("#song_text").val(text);
  return 1;
}

function addVerseBlock() {
  var new_index = $(".js-verse").length + 1;
  var toAppend = '<div class="js-VerseBlock c-VerseBlock">\
  <button type="button" class="c-VerseBlockHandle c-VerseBlockHandle-top" onclick="removeBlock(this);">&times;</button>\
      <label class="c-SectionTagline" for="verse'+new_index+'-label">Zwrotka '+new_index+'</label>\
      <div id="chorus" class="js-verse c-InputVerse" contenteditable></div>\
    </div>';
  if($(".js-VerseBlock").length == 0) {
    $("#js-chorus").after(toAppend);
  }
  else {
    $(".js-VerseBlock").last().after(toAppend);
  }
  
}

function watchVerseBlocksForAdding() {
  $(".js-VerseBlock").last().children(".js-verse").on("blur", function() {
    if($(this).text() != "")
    {
      $(this).off("blur");
      addVerseBlock();
      watchVerseBlocksForRemoving();
      watchVerseBlocksForAdding();
    }
  });
}

function refreshLabels() {
  $(".js-VerseBlock").each(function (index) {
    $(this).children("label").text("Zwrotka "+(index+1));
    $(this).children("label").attr("for", "verse"+(index+1)+"-label");
  });
}

function watchVerseBlocksForRemoving() {
  $(".js-VerseBlock .js-verse").on("blur", function() {
    if($(this).text() == "")
    {
      $(this).parent().remove();
      refreshLabels();
    }
  })
}

function removeBlock(handle) {
  $(handle).parent().remove();
  refreshLabels();
}
