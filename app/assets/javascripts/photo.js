$(document).on('ready',function(){

  $(".container").on("click", "#insta_link", function(event){
    event.preventDefault();
    $('.modal').css('display', 'block');
  });

  $('#download').on("click", function(){
    $('.modal').css('display', 'none');
    // function promptNewAlbum();
  });

  $('#cancel').on("click", function(event){
    event.preventDefault();
    $('.modal').css('display', 'none');
  });
});


// function promptNewAlbum(){
//   m = "Perfecto! Ya que tienes fotos estas listo para crear un album."
//   button = "<a href=''>Ok!</a>"
//   $('#dim-message').html(m);
//   $('#dim-screen').css('display', 'block');
//   $('#dim-message').css('display', 'block');
// };