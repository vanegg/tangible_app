$(document).on('ready',function(){

  $(".container").on("click", "#insta_link", function(event){
    event.preventDefault();
    $('.modal').css('display', 'block');
  });

  $('#download').on("click", function(){
    $('.modal').css('display', 'none');
  });

  $('#cancel').on("click", function(event){
    event.preventDefault();
    $('.modal').css('display', 'none');
  });
});