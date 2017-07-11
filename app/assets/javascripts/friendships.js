$(document).on('turbolinks:load', function () {
  $('.friendship_button').on('mouseenter mouseleave', function (e) {
    var container = $(this).find('.unfriend');
    var friends = "<i class='checkmark icon'></i><span>Friends</span>";
    var unfriend = "<i class='remove icon'></i><span>Unfriend</span>";
    container.html(e.type == 'mouseenter' ? unfriend : friends);
  });

  $('.raised.card .image').dimmer({
    on: 'hover',
  });
});
