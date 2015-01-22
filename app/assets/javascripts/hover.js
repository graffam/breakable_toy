

// $(".add_form_fields").hover(function(){
//   $(".add_form_fields").css("background-color","yellow");
// },function(){
//   $(".add_form_fields").css("background-color","pink");
// });

var $costObjectDiv = $('#cost-object');
var $costInput = $('#order_cost_object_id');

var $neededByDiv = $('#needed-by');
var $needInput = $('#order_needed_by');

var $commentDiv = $('#comment');
var $commentInput = $('#order_comment');

var $kitDiv = $(".kitDiv");
var $kitInput =$("#kit");

var $metric = $(".metric");
var $metric_link = $(".metric_link");

var $user_email_field = $("#user_email");

$costObjectDiv.on('mouseover', function() {
  $costInput.css('background-color', '#D9F0FF');
});

$costObjectDiv.on('mouseout', function() {
  $costInput.css('background-color', '#FFF');
});

$neededByDiv.on('mouseover', function() {
  $needInput.css('background-color', '#D9F0FF');
});

$neededByDiv.on('mouseout', function() {
  $needInput.css('background-color', '#FFF');
});

$commentDiv.on('mouseover', function() {
  $commentInput.css('background-color', '#D9F0FF');
});

$commentDiv.on('mouseout', function() {
  $commentInput.css('background-color', '#FFF');
});

$kitDiv.on('mouseover',function() {
  $(this).find("input.kit").css("background", '#D9F0FF');
});

$kitDiv.on('mouseout',function() {
  $(this).find("input.kit").css("background", '#FFF');
});
