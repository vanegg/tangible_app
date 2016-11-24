$(document).ready(function(ev){
 
  doDraggable('.draggable');
  doDroppable('.photoboard');

  $('#album_title').on('change', function(event){
    console.log($('#album_title').val());

  });

  num_album = $('#num_album').text();
  $('#edit_album_' + num_album).on('submit', function(event){
  	event.preventDefault();
    console.log($('#album_title').val());
  	
  });

});

function saveTitle(){
	title = $('#album_title').val();
	$.post('/save_title',title, function(resp) {
    console.log('callback:' + resp);
  });
};