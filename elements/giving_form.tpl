{if !empty($child)}
    {$type = "hidden"}
    {$button_value = "Sponsor"}
    {if !empty($sponsorship_amount)}
        {$value = $sponsorship_amount}
    {/if}
{else}
    {$type = "text"}
    {$button_value = "Give"}
{/if}

{$show_radio_options = false}
{if isset($radio_options) && $radio_options == true}
    {$show_radio_options = true}
    {$button_value = "Checkout"}
    {if !empty($sponsorship_amount)}
        {$value = $sponsorship_amount}
    {/if}
{/if}

{if !empty($campaign.id)}
    {assign var=uid value='1'|mt_rand:500}
    
     {*Hide with "hide_giving" content item field or variable passed to this view*}
    {$show = !isset($hide_giving) || (isset($hide_giving) && $hide_giving !== true)}
    
     {*Hide with "Disabled" contribution option*}
    {if isset($campaign.is_disabled) && $campaign.is_disabled == true}
        {$show = false}
    {/if}
    
    {$cls = "tpl-elements-giving-form"}
    {if $show_radio_options}
        {$cls = "`$cls` tpl-show-radio-options tpl-elements-giving-form-small"}
    {/if}
    {if !$show}
        {$cls = "`$cls` tpl-elements-giving-form-hidden"}
    {/if}
    
    <div class="{$cls}" id="tpl-elements-giving-form-{$uid}" data-min-amount="{if !empty($campaign.min_amount)}{$campaign.min_amount}{else}0{/if}" data-max-amount="{if !empty($campaign.max_amount)}{$campaign.max_amount}{else}{/if}">
        {if $show}
            <form action="{if !empty($shoppingCartChannelUrl)}{$shoppingCartChannelUrl}{/if}{$campaign.add_to_cart_link}" class="campaign-form" method="{if !empty($shoppingCartChannelUrl)}get{else}post{/if}" novalidate>
                <input type="hidden" name="campaign_id" value="{$campaign.id}"/>

                {if !empty($child)}
                    <input type="hidden" name="source_codes" value="Child Sponsorship" />
                {/if}
                
                {if !empty($allow_multiple_in_cart)}
                    <input type="hidden" name="allow_multiple_in_cart" value="1"/>
                {/if}
                
                {if $show_radio_options}
                    <div class="tpl-radio-buttons">
                        <div class="tpl-radio-holder">
                            <input type="radio" name="sponsorship-type" value="fixed" id="fixed-sponsorship-type">
                            <label for="fixed-sponsorship-type"><span>Donate monthly sponsorship</span></label>
                        </div>
                        <div class="tpl-radio-holder">
                            <input type="radio" name="sponsorship-type" value="custom" id="custom-sponsorship-type">
                            <label for="custom-sponsorship-type"><span>Donate custom sponsorship amount</span></label>
                        </div>
                    </div>
                {/if}
                <div class="tpl-input-field-and-button">
                    <div class="tpl-field">
                        <div class="tpl-amount-field-holder">
                            <input class="amount" type="{$type}"{if !empty($value)} value="{$value}" data-value="{$value}"{/if} name="amount" placeholder="{if $show_radio_options}Enter Custom Amount{/if}"/>
                        </div>
                    </div>
                    <div class="tpl-amount-button-holder">
                        <input class="tpl-button tpl-amount-submit amount-submit" type="submit" value="{$button_value}"/>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </form>
        {/if}
    </div>
{/if}