$(document).on('turbolinks:load', function() {
  var $revealTrigger = $('.js-reveal');
  var $revealSection = $('.js-reveal__hidden-section');

  var toggleReveal = function(e) {
    e.preventDefault();
    $revealSection.toggle();
  };

  $revealTrigger.on('click', toggleReveal);
});
