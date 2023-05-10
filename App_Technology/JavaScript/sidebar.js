$(document).ready(function () {

    $('.sub-btn-vex').click(function () {
        $(this).find('.dropdown').toggleClass('rotate');
        $(this).next('.sub-menu-vex').slideToggle();
    });

});