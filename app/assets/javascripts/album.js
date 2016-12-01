$(document).on('ready',function(ev){
 
  doDraggable('.draggable');
  doDroppable('.photoboard');

  $('#title_field').on('change', function(event){
    updateTitle();
  });

  // disable new-album button once clicked
  $( '#new-album' ).on('click', function(){
    $( "#new-album" ).prop( 'disabled', 'true' );
  })

  // listening for photos selected
  // simulates a click on update
  // creates one step upload
  $('#photo_photo').on('change', function(event){
    $( "#upload" ).trigger( "click");
    $( "#photo_photo" ).prop( 'disabled', 'true' );
    // promptNewAlbum();
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
    button2 = "<a href=''>¡Oops! Seguir editando</a>"
    $('#dim-message').html(m + button2 + button1);
    $('#dim-screen').css('display', 'block');
    $('#dim-message').css('display', 'block');
  });

});

function updateTitle(){
	album = {};
	album.id = $('#num_album').text();
	album.title = $('#title_field').val();
	$.post('/update_title',album, function(resp) {
  });
};

function promptNewAlbum(){
  // m = "Perfecto! Ya que tienes fotos estas listo para crear un album."
  // button = "<a href=''>Ok!</a>"
  // $('#dim-message').html(m);
  // $('#dim-screen').css('display', 'block');
  // $('#dim-message').css('display', 'block');
};