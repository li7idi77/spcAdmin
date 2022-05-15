$(document).ready(function() {
	$("#mainSlider").bxSlider({
		mode: "fade",
		moveSlides: 1,
		slideMargin: 30,
		infiniteLoop: true,
		slideWidth: 1170,
		minSlides: 1,
		maxSlides: 1,
		speed: 400,
		auto: true,
		pause: 4000,
		autoHover: true,
		touchEnabled: false,

	});
});
/**
$(document).ready(function() {
	$("#mainStockSlider").bxSlider({
		mode: "vertical",
		moveSlides: 1,
		slideMargin: 0,
		infiniteLoop: true,
		slideWidth: 1170,
		minSlides: 1,
		maxSlides: 1,
		speed: 600,
		auto: true,
		pause: 4000,
		autoHover: true,
		touchEnabled: false,
		pager:false,
	});
});
*/
function openTabService(evt, tabName) {
	var i, tabContent, tablinks;
	tabContent = document.getElementsByClassName("tab_content");
	for (i = 0; i < tabContent.length; i++) {
		tabContent[i].style.display = "none";
	}
	tabLink = document.getElementsByClassName("tab_link");
	for (i = 0; i < tabLink.length; i++) {
		tabLink[i].className = tabLink[i].className.replace(" active", "");
	}
	document.getElementById(tabName).style.display = "block";
	evt.currentTarget.className += " active";

}
document.getElementById("defaultOpen").click();
