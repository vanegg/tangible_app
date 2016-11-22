$(document).ready(function(ev){
 
    $('.draggable').draggable({
       containment: '#content',
       stack: '.photoPile div',
       cursor: 'move',
       helper: "clone"
    });

    $('.photoboard').droppable( {
      // accept: '.photoPile div',
      hoverClass: 'hovered',
      drop: handleDrop
    }); 
  
});

function handleDrop(event, ui){
  console.log($(this).attr('id'));
  console.log(ui.draggable.context);
}