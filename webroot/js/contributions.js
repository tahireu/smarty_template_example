$(document).ready(function(){

    function registerGivingForms() {
        $('.tpl-elements-giving-form').each(function(){
            var givingForm = $(this);
            if(!givingForm.data('loaded')){
                givingForm.data('loaded',true);

                var currentPopUp = false;
                var minAmount = parseInt(givingForm.attr('data-min-amount'));
                var maxAmount = parseInt(givingForm.attr('data-max-amount'));
                var errorMessage = 'Please enter numeric value for amount.';

                givingForm.find("form").on('submit', function(e){
                    var me = this;
                    var amount = parseInt(givingForm.find(".amount").val());
                    var maxAmountCondition = true;
                    e.preventDefault();

                    // Fix for max amount condition
                    if (maxAmount){ // if max amount is set
                        if (amount > maxAmount) { // and if amount is bigger than max amount
                            maxAmountCondition = false; // set maxAmountCondition to false
                        }
                    }

                    if(amount && amount > 0 && amount >= minAmount && maxAmountCondition){
                        me.submit();
                    } else {
                        if(currentPopUp) {
                            currentPopUp.destroyAlert();
                        }

                        if(amount < minAmount){
                            errorMessage = 'Please enter a donation amount of $' + minAmount + ' or more.';
                        }

                        if(amount > maxAmount){
                            errorMessage = 'Maximum donation amount is $' + maxAmount + '';
                        }

                        currentPopUp  = new SS.customAlert({
                            title: 'Donation Error',
                            cls: 'give-form-error-dialog',
                            msg: '<div class="tpl-error-message">'+errorMessage+'</div>',
                            buttons: {
                                ok: {
                                    btnText: 'Ok',
                                    btnCls: false,
                                    overCls: false
                                },
                                cancel: false
                            }
                        });
                    }

                    return false;
                });

                givingForm.find('[name="sponsorship-type"]').on('click', function(){
                    // Un-check all radio buttons
                    givingForm.find('.tpl-radio-holder').removeClass('checked');
                    // Check clicked radio button
                    $(this).closest('.tpl-radio-holder').addClass('checked');

                    if($(this).val() == 'fixed') {
                        // Set default amount
                        var value = givingForm.find('input.amount').attr('data-value');
                        if(value) {
                            givingForm.find('input.amount').val(value);
                        }
                    } else {
                        // Clear amount
                        givingForm.find('input.amount').val('');
                    }
                });

                // Select first radio button on load
                givingForm.find('[name="sponsorship-type"]:first').trigger('click');
            }
        })
    }
    
    registerGivingForms();

    $('.infinite-container').on('onAfterPageLoad',function(event){
        registerGivingForms();
    });
})
