var interval;

$(function(){
  changeSlide = function(){
    $img = $('.banner-content img.active');

    $img.removeClass('active');

    if ($img.is(':last-child')){
      $next = $($img.siblings(':first'));
    } else {
      $next = $($img.next());
    }

    $next.addClass('active');
  }

  interval = setInterval(changeSlide, 5000);
})
