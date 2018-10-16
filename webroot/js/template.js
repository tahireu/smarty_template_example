$(document).ready(function(){

	var body = $('body'),
        delay = (function(){
            var timer = 0;
            return function(callback, ms){
                clearTimeout (timer);
                timer = setTimeout(callback, ms);
            };
        })();


    var header = $('.tpl-position-header');

	// Toggle user drop content
	var userDropTrigger = header.find('.tpl-user-menu-trigger');
	var userDropContent = header.find('.tpl-section-user-drop-content');

	userDropTrigger.on('click.ToggleUserDropContent', function(e){
        // If there is user drop content and it's not clicked inside of it
		if(userDropContent && userDropContent.length > 0
            && !userDropContent.is(e.target) && userDropContent.has(e.target).length === 0
        ) {
            userDropContent.toggleClass('visible');
		}
        e.stopPropagation();
	});

	// Hide user drop content on outside click
	$(document).mouseup(function (e) {
		if (userDropContent && userDropContent.length > 0
            && !userDropContent.is(e.target) && userDropContent.has(e.target).length === 0
            && !userDropTrigger.is(e.target) && userDropTrigger.has(e.target).length === 0
        ) {
            userDropContent.removeClass('visible');
		}
	});


    // Replace "(for receipt purpose)" text on Checkout page
    $('.contributions #contributions-payment-form .currency-options .title .note').html('(For tax receipt purpose)');

    // Set placeholder text to be label (Checkout Page)
    $('#ContributionCheckoutForm').find('.secure-payment input[type=card],' +
        '.secure-payment input[type=text],' +
        '.secure-payment select,' +
        '.billing-information input[type=card],' +
        '.billing-information input[type=text],' +
        '.billing-information input[type=email],' +
        '.billing-information input[type=phone],' +
        '.billing-information select,' +
        '.organization-information input[type=text],' +
        '.organization-information input[type=email],' +
        '.organization-information input[type=phone]').each(function(index, element) {
        if($(this).parent().siblings('label').length >0 ) {
            var label = $(this).parent().siblings('label');
            var labelText = label.text();

            if(!$(this).is('select') && !$(this).parent().parent().hasClass('is-combo') && (!$(this).attr('placeholder') || $(this).attr('placeholder')=="") ) {
                $(this).attr('placeholder',labelText);
            }

            //label.remove();
        }
    });

    // Set placeholder text to be label (Checkout Thank You Page)
    $('#ContributionCheckoutThanksForm').find('input[type=text], input[type=password]').each(function(index, element) {
        if($(this).parent().siblings('label').length >0 ) {
            var label = $(this).parent().siblings('label');
            var labelText = label.text();

            if(!$(this).is('select') && !$(this).parent().parent().hasClass('is-combo') && (!$(this).attr('placeholder') || $(this).attr('placeholder')=="") ) {
                $(this).attr('placeholder',labelText);
            }

            //label.remove();
        }
    });

    // Set placeholder text to be label (Edit Payment Method Page)
    $('#PaymentProcessorEditPaymentMethodForm').find('input[type=text],' +
        'input[type=email],' +
        'input[type=phone],' +
        'input[type=numeric]').each(function(index, element) {
        if($(this).parent().siblings('label').length >0 ) {
            var label = $(this).parent().siblings('label');
            var labelText = label.text();

            if(!$(this).attr('placeholder') || $(this).attr('placeholder')=="") {
                $(this).attr('placeholder',labelText);
            }

            //label.remove();
        }
    });

    // Toggle "checked" class for radio field labels in "Custom Alert" popup
    body.on('DOMNodeInserted', function(e) {
        if ($(e.target).is('.customAlert')) {
            delay(function(){

                // Get radio wrapper
                var radioWrapperInCustomAlertPopup = $(".customAlert .customAlertInner .customAlertMsg .radio-wrapper");

                // On load
                radioWrapperInCustomAlertPopup.find("input:radio:checked").parent().find("label").addClass("checked");

                // On label click
                radioWrapperInCustomAlertPopup.find("label").on('click', function () {
                    radioWrapperInCustomAlertPopup.find('label').removeClass("checked");
                    $(this).addClass("checked");
                });

                // On checkbox click
                radioWrapperInCustomAlertPopup.find("input:radio").change(function(){
                    radioWrapperInCustomAlertPopup.find('label').removeClass("checked");
                    $(this).parent().find("label[for='"+$(this).attr('id')+"']").addClass("checked");
                });

            }, 200);
        }
    });


    // Toggle flyout menu visibility.
    var flyoutTrigger = $('.tpl-side-menu-trigger');
    var flyoutCloseTrigger = $('.tpl-mobile-menu-close-trigger');
    var flyoutMenu = $('.tpl-position-flyout');
    var flyoutWidth = flyoutMenu.width();
    var flyoutIsOpen = false;

    flyoutTrigger.on('click', toggleFlyout);
    flyoutCloseTrigger.on('click', toggleFlyout);

    function toggleFlyout() {
        var bodyContent = $('.tpl-section-main-container');

        if(!flyoutIsOpen){
            flyoutIsOpen = true;
            // When this is commented out, flyout menu will not move whole page when it opens and close; It will open over page.
            /*bodyContent.addClass('open-flyout');
            header.addClass('open-flyout');*/
            flyoutMenu.css({
                right: '0'
            });
        } else {
            flyoutIsOpen = false;
            // When this is commented out, flyout menu will not move whole page when it opens and close; It will open over page.
            /*bodyContent.removeClass('open-flyout');
            header.removeClass('open-flyout');*/
            flyoutMenu.css({
                right: -flyoutWidth + 'px'
            });
        }
    }

    // Play videos with Magnific Popup plugin
    if ($.fn.magnificPopup && typeof $.fn.magnificPopup !== "undefined") {
        $('.tpl-open-video-in-magnific-popup').magnificPopup({
            type: 'video'
        });
    }
});
