{assign var=uid value='1'|mt_rand:500}

{include file='../../../elements/get_fields.tpl' scope='parent'}

{include file='./get_fields.tpl' scope='parent'}

{if !isset($show_gifts)}
    {$show_gifts = true}
    {if isset($smarty.get.sponsor) || isset($smarty.get.mysponsorship)}
        {$show_gifts = false}
    {/if}
{/if}
{$my_sponsorship = false}
{if isset($smarty.get.mysponsorship)}
    {$my_sponsorship = true}
{/if}

{$currency = '<span class="tpl-currency">$</span>'}

<div class="tpl-architect-child-detail tpl-architect-child-detail-shared{if $show_gifts} gifts{/if}{if $show_gifts || $my_sponsorship} no-give-at-top{/if}" id="tpl-architect-child-detail-{$uid}">
    <div class="tpl-architect-detail tpl-image-{if !empty($image)}yes{else}no{/if}">
        <div class="tpl-top-section">
            <div class="tpl-centered-1000">
                <div class="tpl-top-section-inner">
                    <div class="tpl-table">
                        <div class="tpl-title-holder tpl-cell">
                            
                            <div class="tpl-before-title">{if !$show_gifts}Hello, I’m{else}Give a gift to{/if}</div>

                            {if !empty($title)}
                                <h2 class="tpl-title">{$title}</h2>
                            {/if}
                        </div>
                        {* Only for default content *}
                        {if !$show_gifts && !$my_sponsorship}
                            {if !empty($sponsorship_amount)}
                                <div class="tpl-sponsorship-amount-and-text-holder tpl-cell">
                                    <div class="tpl-sponsorship-text">
                                        Sponsor this child <br />for <div class="tpl-sponsorship-amount">${$sponsorship_amount}</div> per month.
                                    </div>
                                </div>
                            {/if}

                            <div class="tpl-top-button-holder tpl-cell">
                                {include file='../../../elements/giving_form.tpl' child=true}
                                <a class="tpl-button tpl-button-download-info" href="{$_link_}.pdf" target="_blank" download>{translate}Download Info{/translate}</a>
                            </div>
                        {/if}
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tpl-main-section">
            <div class="tpl-centered-1000">
                <div class="tpl-image-and-buttons-holder">
                    {if !empty($image)}
                        <div class="tpl-image-holder">
                            <img src="{$image|resize:250:350}" alt="" />
                        </div>
                    {/if}
                </div>
                <div class="tpl-main-holder">
                    <div class="tpl-details">
                        {include file="./child_info.tpl"}
                        
                        {* Only for gifts content *}
                        {if $show_gifts}
                            {if !empty($campaign.id)}
                                {if !empty($country_external_id)}
                                    {get_data_group_items var='gift_items' alias='GiftItem' conditions=['tag_id' => $country_external_id]}

                                    {if !empty($gift_items)}
                                        <div class="tpl-gifts">
                                            <form action="{if !empty($shoppingCartChannelUrl)}{$shoppingCartChannelUrl}{/if}{$campaign.add_to_cart_link}" method="{if !empty($shoppingCartChannelUrl)}get{else}post{/if}" novalidate>
                                                
                                                <div class="tpl-hidden-fields" data-campaign-id="{$campaign.id}"></div>
                                                
                                                <div class="tpl-gift-items">
                                                    {foreach $gift_items as $key => $gift_item}
                                                        {if !empty($gift_item.amount)}
                                                            <div class="tpl-gift-item tpl-image-{if !empty($gift_item.image)}yes{else}no{/if} tpl-max-multi-item-{if !empty($gift_item.max_multi_item)}yes{else}no{/if} tpl-min-cash-value-{if !empty($gift_item.min_cash_value)}yes{else}no{/if}">
                                                                <div class="tpl-checkbox-holder">
                                                                    <div class="tpl-custom-checkbox">
                                                                        <input 
                                                                            type="checkbox" 
                                                                            id="gift_item[{$key}]" 
                                                                            value="{$gift_item.amount}" 
                                                                            {if !empty($gift_item.title)}data-gift-item-title="{$gift_item.title}"{/if} 
                                                                            {if !empty($gift_item.source_code)}data-source-code="{$gift_item.source_code}"{/if} 
                                                                            {if !empty($gift_item.max_multi_item)}data-max-multi-items="{$gift_item.max_multi_item}"{/if} 
                                                                            {if !empty($gift_item.min_cash_value)}data-min-cash-value="{$gift_item.min_cash_value}"{/if} />
                                                                        <label for="gift_item[{$key}]"></label>
                                                                    </div>
                                                                </div>

                                                                {if !empty($gift_item.image)}
                                                                    <div class="tpl-gift-image-holder">
                                                                        <img src="{$gift_item.image|resize:150:150}" alt="" />
                                                                    </div>
                                                                {/if}

                                                                <div class="tpl-gift-item-content">
                                                                    <h4 class="tpl-gift-item-top">
                                                                        <span class="tpl-gift-item-title">
                                                                            {if !empty($gift_item.title)}{$gift_item.title}{/if}
                                                                        </span>
                                                                        
                                                                        <span class="tpl-gift-item-amount">
                                                                            {if !empty($gift_item.min_cash_value)}
                                                                                {$currency}<input type="text" value="{$gift_item.min_cash_value}" name="custom-cash-amount" />
                                                                            {else}
                                                                                {$currency}<span class="tpl-amount">{$gift_item.amount}</span>
                                                                            {/if}
                                                                        </span>
                                                                        <span class="clearfix"></span>
                                                                    </h4>
                                                                    {if !empty($gift_item.description)}
                                                                        <div class="tpl-gift-item-description">
                                                                            {$gift_item.description}
                                                                        </div>
                                                                    {/if}
                                                                    
                                                                    {if !empty($gift_item.max_multi_item)}
                                                                        <div class="tpl-multi-field-holder">
                                                                            <select name="number-of-items">
                                                                                {for $i=1 to $gift_item.max_multi_item}
                                                                                    <option value="{$i}"{if $i==1} selected{/if}>{$i}</option>
                                                                                {/for}
                                                                            </select>
                                                                        </div>
                                                                    {/if}
                                                                </div>
                                                            </div>
                                                        {else}
                                                            <div class="tpl-invalid-item">
                                                                {translate}Amount field is empty for this item{/translate}{if !empty($gift_item.title)} [{$gift_item.title}]{/if}
                                                            </div>
                                                        {/if}
                                                        <div class="clearfix"></div>
                                                    {/foreach}
                                                </div>
                                                
                                                <h4 class="tpl-gifts-total">
                                                    <span class="tpl-label">{translate}Total Gift Amount: {/translate}</span>
                                                    <span class="tpl-value">
                                                        {$currency}<span class="tpl-amount">0.00</span>
                                                    </span>
                                                </h4>

                                                <div class="tpl-add-to-cart-holder">
                                                    <input type="submit" value="{translate}Add to Cart{/translate}" class="tpl-button" />
                                                </div>
                                            </form>
                                        </div>
                                    {else}
                                        {$give_message = "Error: External ID [`$country_external_id`] was found in Country tag, but no Data Group \"Gift Items\" were found with that Tag ID."}
                                    {/if}
                                {/if}
                            {else}
                                {$give_message = "Error: There is no Campaign ID for this Child. Possibly Child content type isn't configured in Contributions."}
                            {/if}
                            
                            {if !empty($give_message)}
                                <div class="tpl-give-message">
                                    {$give_message}
                                </div>
                            {/if}
                        {/if}
                    </div>

                    {if $my_sponsorship}
                        <div class="tpl-custom-give">
                            {include file='../../../elements/giving_form.tpl' radio_options=true allow_multiple_in_cart=true}
                        </div>
                    {/if}

                    {* Only for default content *}
                    {if !$show_gifts && !$my_sponsorship}
                        {if !empty($body)}
                            <div class="tpl-body">
                                {$body}
                            </div>
                        {/if}
                        
                        <div class="tpl-child-content">
                            {if !empty($about_me)}
                                <h6>About Me:</h6>
                                <div class="tpl-body">
                                    {$about_me}
                                </div>
                            {/if}

                            {if !empty($about_my_community)}
                                <h6>About My Community:</h6>
                                <div class="tpl-body">
                                    {$about_my_community}
                                </div>
                            {/if}

                            {if !empty($benefits_of_the_program)}
                                <h6>Benefits of the Program:</h6>
                                <div class="tpl-body">
                                    {$benefits_of_the_program}
                                </div>
                            {/if}
                        </div>

                        {if !empty($video) && !empty($video.html)}
                            <div class="tpl-video-holder">
                                {$video.html}
                            </div>
                        {/if}
                    {/if}
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>

    {* Only for gifts content *}
    {if $show_gifts}
        <script type="application/javascript">
            $(document).ready(function() {
                var gifts = $("#tpl-architect-child-detail-{$uid} .tpl-gifts");

                // If there are gifts in this view
                if(gifts && gifts.length > 0) {
                    var checkboxes = gifts.find('.tpl-gift-item .tpl-custom-checkbox input[type=checkbox]');

                    // Un-checked each checkbox to avoid issues, because state can be remembered on page refresh
                    $.each(checkboxes, function(){
                        $(this).prop('checked', false);

                        // Reset custom cash amount field to default value on load
                        var minCashValue = $(this).attr('data-min-cash-value');
                        if(minCashValue){
                            $(this).parents('.tpl-gift-item').find('input[name=custom-cash-amount]').val(parseInt(minCashValue));
                        }
                    });
                    
                    // Disable submit button on load
                    gifts.find('.tpl-add-to-cart-holder input[type=submit]').prop('disabled', true);
                    

                    // If there is some item with "Max Multi Items" value
                    var numberOfGifts = gifts.find('select[name=number-of-items]');
                    if(numberOfGifts){
                        // Clear "Multi Items" dropdown on load (select first one)
                        numberOfGifts.val(numberOfGifts.find("option:first").val());

                        // On "Multi Items" dropdown change
                        numberOfGifts.on('change.MultiItemChange', function(){
                            var thisCheckbox = $(this).parents('.tpl-gift-item').find('.tpl-custom-checkbox input[type=checkbox]');

                            // If item was checked, just re-calculate all values or if it wasn't trigger "click" even which will also re-calculate
                            if(thisCheckbox.prop('checked')){
                                updateAllValues();
                            } else {
                                thisCheckbox.trigger('click');
                            }
                        });
                    }

                    // If there is some item with "Min Cash Value"
                    var customCashValue = gifts.find('input[name=custom-cash-amount]');
                    if(customCashValue){
                        var delay = (function(){
                            var timer = 0;
                            return function(callback, ms){
                                clearTimeout (timer);
                                timer = setTimeout(callback, ms);
                            };
                        })();

                        // On "Custom Cash Amount" change
                        customCashValue.on('keyup.CustomCashAmount', function(){
                            var amount = $(this);

                            delay(function(){

                                var thisCheckbox = amount.parents('.tpl-gift-item').find('.tpl-custom-checkbox input[type=checkbox]');

                                var minValue = parseInt(thisCheckbox.attr('data-min-cash-value'));

                                // If amount is valid (not less than minimum)
                                if(amount.val() && parseInt(amount.val()) >= minValue){

                                    amount.removeClass('has-error');

                                    // If item was checked, just re-calculate all values or if it wasn't trigger "click" even which will also re-calculate
                                    if(thisCheckbox.prop('checked')){
                                        updateAllValues();
                                    } else {
                                        thisCheckbox.trigger('click');
                                    }
                                } else {

                                    // If amount is smaller than minimum, set "error" class and un-check checkbox (this will re-calculate everything)
                                    amount.addClass('has-error');

                                    if(thisCheckbox.prop('checked')){
                                        thisCheckbox.trigger('click');
                                    }
                                }

                            }, 500);
                        });
                    }
                    

                    // On checkbox click
                    checkboxes.on('change.GiftCheckbox', function(){
                        
                        // Toggle "checked" class
                        $(this).parents('.tpl-custom-checkbox').toggleClass('checked');

                        updateAllValues();
                    });
                    
                    
                    function updateAllValues(){
                        // Get new total and notes for each checkbox
                        var total = 0;
                        var cartIndex = 0;
                        {* todo: Remove when task is finished *}
//                        var notes = [];
//                        var checkedItems = [];

						var hiddenFieldsHolder = gifts.find('.tpl-hidden-fields');

						// Remove all hidden fields, new ones will be created below
						hiddenFieldsHolder.html('');
                        
                        $.each(checkboxes, function(){
                            if(this.checked){
                                var thisItem = $(this).parents('.tpl-gift-item');
                                // First define default values, which might get changed for custom gifts (custom amount, multiple gifts, etc.)
                                var thisAmount = parseInt($(this).val());
                                var thisTitle = $.trim($(this).attr('data-gift-item-title'));
                                var sourceCodes = $(this).attr('data-source-code') ? [$.trim($(this).attr('data-source-code'))] : [];
                                var extraData = null;
                                
                                sourceCodes.push("7/1/17");
                                
                                // Take amount (for current item) from custom cash amount field
                                var customCashValue = thisItem.find('input[name=custom-cash-amount]');
                                if(customCashValue && customCashValue.val()){
                                    thisAmount = parseInt(customCashValue.val());
									extraData = thisAmount;
									
                                    {* todo: Remove when task is finished *}
                                    // thisTitle = thisTitle + " $" + customCashValue.val();
                                }

                                // Take number of gifts if it's multi gift
                                var numberOfGifts = thisItem.find('select[name=number-of-items]');
                                if(numberOfGifts && numberOfGifts.val()) {
                                    // Multiply value of this item with number of gifts
                                    thisAmount = thisAmount * parseInt(numberOfGifts.val());

									extraData = numberOfGifts.val();
									
                                    // Update value in upper right section for this item
                                    thisItem.find('.tpl-amount').html(thisAmount);

                                    {* todo: Remove when task is finished *}
                                    // Append x2, x3, etc.
                                    // if(parseInt(numberOfGifts.val()) > 1){
                                    //    thisTitle = thisTitle + " x " + numberOfGifts.val();  
                                    // }
                                }
                                
                                if(thisAmount){
                                    total += thisAmount;   
                                }

								{* todo: Remove when task is finished *}
//                                if(thisTitle){
//                                    notes.push(thisTitle);
//                                }
                                
//								checkedItems.push({
//                                    amount: thisAmount ? thisAmount : null,
//                                    sourceCode: sourceCodes ? sourceCodes : null,
//                                    note: thisTitle ? thisTitle : null
//                                });


								// Update hidden fields
								hiddenFieldsHolder.append(
									'<input type="hidden" name="cart['+cartIndex+'][campaign_id]" value="'+hiddenFieldsHolder.attr('data-campaign-id')+'" />' +
									'<input type="hidden" name="cart['+cartIndex+'][amount]" value="'+thisAmount+'" />'
								);

								if(sourceCodes.length > 0){
									hiddenFieldsHolder.append(
										'<input type="hidden" name="cart['+cartIndex+'][source_codes]" value="'+sourceCodes.join(', ')+'" />'
									);    
                                }
								if(extraData){
									hiddenFieldsHolder.append(
										'<input type="hidden" name="cart['+cartIndex+'][extra_data]" value="'+extraData+'" />'
									);    
                                }
								if(thisTitle){
									hiddenFieldsHolder.append(
										'<input type="hidden" name="cart['+cartIndex+'][notes]" value="'+thisTitle+'" />'
									);    
                                }
								
								cartIndex++;
                            }
                        }, this);

                        {* todo: Remove when task is finished *}
						// Update hidden fields
//						if(checkedItems.length > 0){
//							$.each(checkedItems, function(index, checkedItem){
//								hiddenFieldsHolder.append(
//									'<input type="hidden" name="cart['+index+'][campaign_id]" value="'+hiddenFieldsHolder.attr('data-campaign-id')+'" />' +
//									'<input type="hidden" name="cart['+index+'][amount]" value="'+checkedItem.amount+'" />' +
//									'<input type="hidden" name="cart['+index+'][notes]" value="'+checkedItem.sourceCode+'" />' +
//									'<input type="hidden" name="cart['+index+'][source_codes]" value="'+checkedItem.sourceCode+'" />'
//                                );
//							});
//						}
                        
						// Add additional hidden fields (single)
						hiddenFieldsHolder.append(
                                {* todo: Remove when task is finished *}
							// '<input type="hidden" name="notes" value="'+notes.join('; ')+'" />' +
							'<input type="hidden" name="allow_multiple_in_cart" value="1" />'
                        );

						// Update visible total amount
						gifts.find('.tpl-gifts-total .tpl-amount').html(total + '.00');

                        // Update submit button disabled/enabled state
                        gifts.find('.tpl-add-to-cart-holder input[type=submit]').prop('disabled', !total > 0);
                    }
                }
            });
        </script>
    {/if}
</div>