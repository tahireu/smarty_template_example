{if isset($advocacy_stage)}
    {if $campaign.goal_amount > 0}
    <div class="tpl-funding-wrapper{if $campaign.percentage >= 93} tpl-funding-almost-complete{/if}">
        <div class="tpl-funding-title">
            <span class="tpl-funding-donated">${$campaign.raised_amount}</span> <label>donated</label>
            <span class="tpl-funding-total">${$campaign.goal_amount}</span>
        </div>
        <div class="tpl-funding-progress-wrapper">
            <div class="tpl-funding-progress">
                <div class="tpl-funding-progress-level tpl-colored-progress" style="width: {$campaign.percentage}%;"></div>
            </div>
            <div class="tpl-funding-percentage-wrapper">
                <span class="tpl-funding-percentage" style="width: {$campaign.percentage}%;"><span>{$campaign.percentage}%</span></span>
                <span class="tpl-funding-percentage-total" {if $campaign.percentage > 75}style="display:none"{/if}><span>100%</span></span>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
    {/if}


{else}


    <div class="tpl-funding-progress-wrapper">
        <div class="tpl-funding-progress">
            <div class="tpl-funding-progress-level tpl-colored-progress" style="width: {$campaign.percentage}%;"></div>
        </div>
        <div class="tpl-funding-percentage-wrapper">
            <span class="tpl-funding-percentage" style="width: {$campaign.percentage}%;"><span>{$campaign.percentage}%</span></span>
            <span class="tpl-funding-percentage-total" {if $campaign.percentage > 75}style="display:none"{/if}><span>100%</span></span>
            <div class="clearfix"></div>
        </div>
    </div>
{/if}