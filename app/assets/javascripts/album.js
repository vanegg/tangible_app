$(document).on('ready turbolinks:load',function(ev){
 
  doDraggable('.draggable');
  doDroppable('.photoboard');

  $('#album_title').on('change', function(event){
    updateTitle();

  });

  num_album = $('#num_album').text();
  $('#edit_album_' + num_album).on('submit', function(event){
  	event.preventDefault();
    updateTitle();
  	
  });

});

function updateTitle(){
	console.log($('#album_title').val());
	album = {};
	album.id = $('#num_album').text();
	album.title = $('#album_title').val();
	$.post('/update_title',album, function(resp) {
    console.log('callback:' + resp);
  });
};