$(document).ready(function(){

  // listening to a lyout selection
  // replaces layout option with layout selected
  // stores page layout selection in database
  $('.select-layout li').on('click', function(){
    album = $('#num_album').text();
    layout = $(this).index() + 1;

    page_num = $(this).children().attr('id');
    lay1 = '<div class="container-fluid"><div class="row board-container layout_1"><div id="0" class="photoboard"></div></div></div>'
    lay2 = '<div class="container-fluid"><div class="row board-container layout_2"><div id="0" class="photoboard"></div><p></p><div id="1" class="photoboard"></div></div></div>'
    lay3 = '<div class="container-fluid"><div class="row board-container layout_3">'
    + '<div id="0" class="photoboard"></div><div id="1" class="photoboard"></div><br><div id="2" class="photoboard"></div><div id="3" class="photoboard"></div></div></div>'
    $(this).children().attr('href','/updatelayout?album=' + album + '&page_num=' + page_num + "&layout=" + layout);
    $(this).parent().parent().replaceWith(eval("lay" + layout));

    doDraggable('.draggable');
    doDroppable('.photoboard');
  });

  // listening to carousel < > arrows
  // sends album_id, page_id and next or prev, to pages#newpage
  $( "body" ).on( "click", ".carousel-control", function(event) {
    page = $('.item.active').children().children().children().children().first().attr('id');
    album = $('#num_album').text();
    $('#' + $( this ).attr('id')).attr('href','/newpage?album=' + album + '&page=' + page + "&type=" + $( this ).attr('id'));
    // $('#custom_carousel .controls li.active').removeClass('active');
    // $('#custom_carousel .controls li:eq('+$(event.relatedTarget).index()+')').addClass('active');
  });

  // $('#custom_carousel').on('slide.bs.carousel', function (evt) {
  // })

});