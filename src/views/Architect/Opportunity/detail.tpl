{include file='../../../elements/get_fields.tpl' scope='parent'}

{if !isset($show_cost) || $show_cost != true || empty($cost)}
    {$cost = false}
{/if}

{$trip_duration = ''}
{if !empty($trip_start_date) && !empty($trip_end_date)}
    {$trip_date_diff = strtotime($trip_end_date) - strtotime($trip_start_date)}
    {$trip_duration = $trip_date_diff / 60 / 60 / 24 + 2}
{/if}

<div class="tpl-architect-opportunity-detail tpl-architect-detail tpl-image-{if !empty($image)}yes{else}no{/if}">
    <div class="tpl-top-section">
        <div class="tpl-centered-1000">
            <div class="tpl-top-section-inner">
                <div class="tpl-table">
                    <div class="tpl-title-holder tpl-cell">
                        {if !empty($title)}
                            <h2 class="tpl-title">{$title}</h2>
                        {/if}
                    </div>
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
                        <img src="{$image|resize:600:600}" alt="" />
                    </div>
                {/if}
                <div class="tpl-buttons">
                    <a class="tpl-button" href="javascript:;">{translate}Request more information{/translate}</a>
                </div>
            </div>
            <div class="tpl-main-holder">
                {*<div class="tpl-details">*}
                    {*{include file='../../../elements/get_tags.tpl' tags_label="In:"}*}
                {*</div>*}
                
                <div class="tpl-list-details">
                    {if !empty($trip_duration)}
                        <div class="tpl-list-detail tpl-trip-duration">{translate}Trip Duration{/translate}: {$trip_duration} days</div>
                    {/if}
                    {if !empty($maximum_participant)}
                        <div class="tpl-list-detail tpl-maximum-participants">{translate}Maximum Participants{/translate}: {$maximum_participant}</div>
                    {/if}
                    {if $cost}
                        <div class="tpl-list-detail tpl-trip-cost">{translate}Trip Cost{/translate}: ${$cost|string_format:"%.2f"}</div>
                    {/if}
                    <div class="tpl-list-detail tpl-trip-location">
                        {include file='../../../elements/get_tags.tpl' get_tag_categories=['Community', 'Country'] tags_label="Community:"}
                    </div>
                </div>

                {if !empty($body)}
                    <div class="tpl-body">
                        {$body}
                    </div>
                {/if}

                {if !empty($video) && !empty($video.html)}
                    <div class="tpl-video-holder">
                        {$video.html}
                    </div>
                {/if}
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>