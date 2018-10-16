{include file='./get_fields.tpl' scope='parent'}

{$truncate = 200}
{$resizeX = 220}
{$resizeY = 220}
{if isset($architect_story)}
    {$truncate = 250}
    {$resizeX = 260}
    {$resizeY = 180}
{/if}

<div class="tpl-architect-summary{if empty($image)} no-image{/if}" id="tpl-architect-summary-{$id}">
    <div class="tpl-content-holder">

        {if !empty($image)}
            <div class="tpl-summary-left">
                <a href="{$_link_}"><img src="{$image|resize:$resizeX:$resizeY}" alt="{$title}"></a>
            </div>
        {/if}

        <div class="tpl-summary-center">
            <h6>{$title}</h6>
            {if isset($architect_story)}
                <div class="tpl-subtitle-holder tpl-date">
                    {$publish_date|date_format:'%B %e, %Y'}
                </div>
            {else}
                <div class="tpl-subtitle-holder">
                    <b>In: </b>{include file='./get_tags.tpl'}
                </div>
            {/if}
            <div class="tpl-body">
                <span>{$summary|strip_tags|truncate:$truncate}</span>
                {if !empty($architect_story)}
                    <a href="{$_link_}" class="tpl-read-more-after-summary">Learn More</a>
                {/if}
            </div>
        </div>

        <div class="tpl-summary-right">
            {if !empty($campaign.id) && !isset($architect_story)}
                <div class="tpl-giving-form">
                    <a href="{$_link_}" class="tpl-read-more">Learn More</a>
                    {include file='./giving_form.tpl'}
                    <div class="clearfix"></div>
                </div>
            {/if}
        </div>

        <div class="clearfix"></div>
    </div>
</div>