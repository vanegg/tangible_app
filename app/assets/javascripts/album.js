$(document).ready(function(ev){
 
    doDraggable('.draggable');
    doDroppable('.photoboard');
});

function handleDrop(event, ui){
  console.log($(this).attr('id'));
  url = ui.draggable.context.id;
  $(this).empty().append('<img src=' + url + '>');
}