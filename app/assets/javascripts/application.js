//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var artistTabs = function() {

	$('#photosclick').click(function() {
    $('#photos').toggle(300);
  });

  $('#videosclick').click(function() {
    $('#videos').toggle(300);
  });


};

$(document).ready(artistTabs);
$(document).on('page:load', artistTabs);