$(document).ready(function(ev){
 
  doDraggable('.draggable');
  doDroppable('.photoboard');

  $('#title_field').on('change', function(event){
  	console.log('cambio');
    updateTitle();

  });

  num_album = $('#num_album').text();
  $('#edit_album_' + num_album).on('submit', function(event){
  	event.preventDefault();
    updateTitle();
  	
  });

});

function updateTitle(){
	console.log($('#title_field').val());
	album = {};
	album.id = $('#num_album').text();
	album.title = $('#title_field').val();
	$.post('/update_title',album, function(resp) {
    console.log('callback:' + resp);
  });
};