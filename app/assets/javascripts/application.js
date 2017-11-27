//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var artistTabs = function() {

  var allClicks = $('#postsclick, #photosclick, #videosclick, #merchclick, #toursclick, #musicclick, #profileclick')

  $('#postsclick').click(function() {
    allClicks.css('border-left', 'transparent 3px solid')
    $(this).css('border-left', '#D3696C 3px solid');
    $('#posts').show(300);
    $('#photos').hide(300);
    $('#videos').hide(300);
    $('#tours').hide(300);
    $('#merch').hide(300);
    $('#music').hide(300);
    $('#profile').hide(300);
  });

  $('#photosclick').click(function() {
    allClicks.css('border-left', 'transparent 3px solid')
    $(this).css('border-left', '#D3696C 3px solid');
    $('#photos').show(300);
    $('#posts').hide(300);
    $('#videos').hide(300);
    $('#tours').hide(300);
    $('#merch').hide(300);
    $('#music').hide(300);
    $('#profile').hide(300);
  });

  $('#videosclick').click(function() {
    allClicks.css('border-left', 'transparent 3px solid')
    $(this).css('border-left', '#D3696C 3px solid');
    $('#videos').show(300);
    $('#posts').hide(300);
    $('#photos').hide(300);
    $('#tours').hide(300);
    $('#merch').hide(300);
    $('#music').hide(300);
    $('#profile').hide(300);
  });

  $('#toursclick').click(function() {
    allClicks.css('border-left', 'transparent 3px solid')
    $(this).css('border-left', '#D3696C 3px solid');
    $('#tours').show(300);
    $('#posts').hide(300);
    $('#photos').hide(300);
    $('#videos').hide(300);
    $('#merch').hide(300);
    $('#music').hide(300);
    $('#profile').hide(300);
  });

  $('#merchclick').click(function() {
    allClicks.css('border-left', 'transparent 3px solid')
    $(this).css('border-left', '#D3696C 3px solid');
    $('#merch').show(300);
    $('#posts').hide(300);
    $('#photos').hide(300);
    $('#videos').hide(300);
    $('#tours').hide(300);
    $('#music').hide(300);
    $('#profile').hide(300);
  });

  $('#musicclick').click(function() {
    allClicks.css('border-left', 'transparent 3px solid')
    $(this).css('border-left', '#D3696C 3px solid');
    $('#music').show(300);
    $('#posts').hide(300);
    $('#photos').hide(300);
    $('#videos').hide(300);
    $('#tours').hide(300);
    $('#merch').hide(300);
    $('#profile').hide(300);
  });

  $('#profileclick').click(function() {
    allClicks.css('border-left', 'transparent 3px solid')
    $(this).css('border-left', '#D3696C 3px solid');
    $('#profile').show(300);
    $('#posts').hide(300);
    $('#photos').hide(300);
    $('#videos').hide(300);
    $('#tours').hide(300);
    $('#merch').hide(300);
    $('#music').hide(300);
  });

};

$(document).ready(artistTabs);
$(document).on('page:load', artistTabs);



var artistPosts = function() {

  $('#artistpostlinkclick').click(function() {
    $('#artistpostlink').toggle(300);
  });

  $('#artistpostimageclick').click(function() {
    $('#artistpostimage').toggle(300);
  });

};

$(document).ready(artistPosts);
$(document).on('page:load', artistPosts);



var emailCheckbox = function() {

  $('.checkbox-dropdown').click(function() {
    $('.checkbox-container').toggle(300);
  });

};

$(document).ready(emailCheckbox);
$(document).on('page:load', emailCheckbox);






