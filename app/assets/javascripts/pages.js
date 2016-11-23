$(document).ready(function(ev){
	 
  $('right-btn').on('click', function(){
  	console.log("rigth button pushed");
  });

  $('.select-layout li').on('click', function(){
    album = $('#num_album').text();
    layout = $(this).index() + 1;
    page_num = $(this).children().attr('id');
    console.log(page_num);
    lay1 = '<div class="container-fluid"><div class="row board-container layout_1"><div class="photoboard"></div></div></div>'
    lay2 = '<div class="container-fluid"><div class="row board-container layout_2"><div class="photoboard"></div><p></p><div class="photoboard"></div></div></div>'
    lay3 = '<div class="container-fluid"><div class="row board-container layout_3">'
    + '<div class="photoboard"></div><div class="photoboard"></div><br><div class="photoboard"></div><div class="photoboard"></div></div></div>'
    $(this).children().attr('href','/updatelayout?album=' + album + '&page_num=' + page_num + "&layout=" + layout);
    $(this).parent().parent().replaceWith(eval("lay" + layout));
  });
});