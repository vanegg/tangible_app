$(document).on('ready',function(ev){
 
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

  $('#terminar-album').on('click', function(event){
    event.preventDefault();
    a = $('#num_album').html();
    m = "<h4>Felicidades en completar tu album!</h4><br>"
    button1 = "<a href='/checkout?album=" + a + "'>Comprar</a>"
    button2 = "<a href=''>Oops! Seguir editando</a>"
    $('#dim-message').html(m + button2 + button1);
    $('#dim-screen').css('display', 'block');
    $('#dim-message').css('display', 'block');
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