//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap

jQuery(function($) {
$("tr[data-link]").click(function() {
window.location = this.dataset.link
});
})