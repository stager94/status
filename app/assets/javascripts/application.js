// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require ckeditor/init
//= require bootstrap
//= require_tree .
$(document).ready(function(){
	 $("[rel=tooltip]").tooltip();
	 $(location).attr('href');
})

VK.init({
    apiId: 3157214 // id созданного вами приложения вконтакте сайт
    // apiId: 3153804 // id созданного вами приложения вконтакте локал
});

function sendwallpost(mydata, vk_id) {
    VK.api("wall.post", {
        owner_id: vk_id,
        message: mydata
    }, function (data) {});
}

function sendnotesadd(title, text) {
    VK.api("notes.add", {
        title: title,
        text: text
    }, function (data) {});
}

function sendstatusset(title, text) {
    VK.api("status.set", {
        text: 'text'
    }, function (data) {alert(2048)});
}