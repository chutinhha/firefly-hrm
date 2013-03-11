// JavaScript Document

function GoURL(form){
var URL = document.forms.item(0).site.options[document.forms.item(0).site.selectedIndex].value;
window.location.href = URL;
}
