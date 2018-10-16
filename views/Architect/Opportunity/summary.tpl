{include file='../../../elements/get_fields.tpl' scope='parent'}

<div class="tpl-architect-opportunity-summary tpl-architect-summary{if empty($image)} no-image{/if}">
    <div class="tpl-content-holder">
        {if !empty($image)}
            <div class="tpl-summary-left">
                <a href="{$_link_}"><img src="{$image|resize:220:220}" alt="{$title}"></a>
            </div>
        {/if}

        <div class="tpl-summary-center">
            <h6>{$title}</h6>
            
            {*<div class="tpl-subtitle-holder">*}
                {*{include file='../../../elements/get_tags.tpl' tags_label="In:"}*}
            {*</div>*}
            
            <div class="tpl-body">
                <span>{$summary|strip_tags|truncate:250}</span>
            </div>
        </div>

        <div class="tpl-summary-right">
            <div class="tpl-buttons-holder">
                <a href="{$_link_}" class="tpl-button tpl-first-button">{translate}Learn More{/translate}</a>
                <a href="javascript:;" class="tpl-button tpl-second-button">{translate}Contact Us{/translate}</a>
            </div>
        </div>

        <div class="clearfix"></div>
    </div>
</div>