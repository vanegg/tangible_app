$(document).on('ready',function(){
  $('#custom_carousel').ready( function(){
    album = $('#num_album').text();
    route = '/showpage?album=' + album + '&page=1'
    $.get(route);
  })


  // listening to a layout selection
  // replaces layout option with layout selected
  // stores page layout selection in database
  $('.select-layout li').on('click', function(){
    album = $('#num_album').text();
    layout = $(this).index() + 1;

    page_num = $(this).children().attr('id');
    lay1 = '<div class="row board-container layout_1"><div id="0" class="photoboard"></div></div>'
    lay2 = '<div class="row board-container layout_2"><div id="0" class="photoboard"></div><p></p><div id="1" class="photoboard"></div></div>'
    lay3 = '<div class="row board-container layout_3">'
    + '<div id="0" class="photoboard"></div><div id="1" class="photoboard"></div><br><div id="2" class="photoboard"></div><div id="3" class="photoboard"></div></div>'
    $(this).children().attr('href','/updatelayout?album=' + album + '&page_num=' + page_num + "&layout=" + layout);
    $(this).parent().parent().replaceWith(eval("lay" + layout));

    doDraggable('.draggable');
    doDroppable('.photoboard');
    dragToDelete('.photo-in-album')
  });

  // listening to carousel < > arrows
  // sends album_id, page_id and next or prev, to pages#showpage
  // removeClass active on active page and mini page
  // addClass active to next/prev page and mini page
  $( "body" ).on( "click", ".carousel-control.i", function(event) {
    page = $('.item.active').children().children().children().children().first().attr('id');
    album = $('#num_album').text();
    console.log("page: " + page + ", album: " + album);
    console.log($(this).attr("id"));
    if (($(this).attr("id") == "next" && page == 7) || ($(this).attr("id") == "prev" && page == 1)) {
      return
    } else {
      active_page = $('.item.active')
      active_page.removeClass("active");
      active_mini = $('#custom_carousel .controls li.active')
      active_mini.removeClass("active");
      if ($(this).attr("id") == "next"){
        page = parseInt(page) + 2;
        active_page.next().addClass("active");
        active_mini.next().addClass("active");
      } else {
        page = parseInt(page) - 2;
        active_page.prev().addClass("active");
        active_mini.prev().addClass("active");
      };
      $(this).attr('href','/showpage?album=' + album + '&page=' + page);
    };
  });

});

