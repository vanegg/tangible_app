// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

$(document).ready(function(ev){
	// var items = $(".nav li").length;
 //    var leftRight=0;
 //    if(items>5){
 //        leftRight=(items-5)*50*-1;
 //    }
    $('#custom_carousel').on('slide.bs.carousel', function (evt) {
      $('#custom_carousel .controls li.active').removeClass('active');
      $('#custom_carousel .controls li:eq('+$(evt.relatedTarget).index()+')').addClass('active');
    })
    // $('.nav').draggable({ 
    //     axis: "x",
    //      stop: function() {
    //         var ml = parseInt($(this).css('left'));
    //         if(ml>0)
    //         $(this).animate({left:"0px"});
    //             if(ml<leftRight)
    //                 $(this).animate({left:leftRight+"px"});
                    
    //     }
      
    // });

});

function doDraggable(selector) {
    $(selector).draggable({
       containment: '#content',
       stack: '.photoPile div',
       cursor: 'move',
       helper: "clone"
    });
};

function doDroppable(selector){
     $(selector).droppable( {
      // accept: '.photoPile div',
      hoverClass: 'hovered',
      drop: handleDrop
    }); 
};

function handleDrop(event, ui){
  page_place = $(this).attr('id');
  num_page = $(this).parent().parent().parent().attr('id');
  url = ui.draggable.context.id;
  album_id = $('#num_album').text();
  $(this).css('border','0px');
  $(this).empty().append("<img src=" + url +" style='height: 100%; width: 100%; object-fit: fill'/>");

  data = {};
  data.album = album_id;
  data.num_page = num_page
  data.page_place = page_place;
  data.url = url;
  // console.log(data);

  $.post('/add_page',data, function(resp) {
    console.log('callback:' + resp.id);
  });
}