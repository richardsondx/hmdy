var days, today;
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
$(function() {
  var flashCallback;
  flashCallback = function() {
    return $(".flash-message").fadeOut();
  };
  $(".flash-message").bind('click', __bind(function(ev) {
    return $(".flash-message").fadeOut();
  }, this));
  return setTimeout(flashCallback, 3000);
});
days = {
  monday: 1,
  tuesday: 2,
  wednesday: 3,
  thursday: 4,
  friday: 5,
  saturday: 6,
  sunday: 7
};
if (yesterday === thursday) {
  today = friday;
  we.excited();
  we.have({
    ball: today
  });
}