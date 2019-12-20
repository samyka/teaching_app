$(document).ready(function(){
	$('#display-teachers').hide();	
  $('#all-teachers-button').click(function(){
    $('#display-teachers').show().then(autoScrollTo('display-teachers'));
  });
  $('.img-responsive').click(function(){
    $('#display-teachers').show().then(autoScrollTo('display-teachers'));
  });
});

var scrollY = 0;
var distance = 40;
var speed = 24;
function autoScrollTo(el) {
  var currentY = window.pageYOffset;
  var targetY = document.getElementById(el).offsetTop + 700;
  var bodyHeight = document.body.offsetHeight;
  var yPos = currentY + window.innerHeight;
  var animator = setTimeout('autoScrollTo(\''+el+'\')', speed);
  if(yPos > bodyHeight){
    clearTimeout(animator);
  } else {
    if(currentY < targetY - distance){
        scrollY = currentY + distance;
        window.scroll(0, scrollY);
      } else {
        clearTimeout(animator);
      }
  }
}

$(document).on('ready page:load', function() {
  // put your javascript here
});