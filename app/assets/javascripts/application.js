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

    // old code used to change active mini-page with carousel
    // $('#custom_carousel').on('slide.bs.carousel', function (evt) {
    //   $('#custom_carousel .controls li.active').removeClass('active');
    //   $('#custom_carousel .controls li:eq('+$(evt.relatedTarget).index()+')').addClass('active');
    // })

    // mini-pages are listening
    // mini-page selected has desired page number
    // page number and album number are sent to pagecontroller#showpage
    // adjust which mini page and large page are active
    $('.mini').on("click", function (evt) {
      new_page = $(this).attr('id');
      album = $('#num_album').text();

      active_page = $('.item.active')
      active_page.removeClass("active");
      $('#' + new_page + '.square_album').parent().parent().parent().parent().addClass('active');
      
      active_mini = $('#custom_carousel .controls li.active')
      active_mini.removeClass("active");
      $('#' + new_page + '.mini').addClass('active');

      $('#' + new_page + '.mini a').attr('href','/showpage?album=' + album + '&page=' + new_page);
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
  
  $(this).empty().append("<img src=" + url +" style='height: 100%; width: 100%; object-fit: fill'/>");

  data = {};
  data.album = album_id;
  data.num_page = num_page
  data.page_place = page_place;
  data.url = url;
  console.log(data);


  $.post('/add_page',data, function(resp) {
    console.log('lalala');
    console.log(resp);
  }, "json");
}

// $.post('/create_survey',json, function(url){
//     window.location.href = url + "";
// });