{include file='../../../elements/get_fields.tpl' scope='parent'}

{if !empty($_link_)}
    {$get_url = $_link_}
{/if}

{if !empty($name)}
    {$title = $name}
{/if}

<div class="tpl-architect-person-summary tpl-image-{if !empty($image)}yes{else}no{/if} {if isset($viewClass)}{$viewClass}{/if}">
    <div class="tpl-content-holder">
        
        <a href="{if !empty($get_url)}{$get_url}{else}javascript:;{/if}" class="tpl-image-link">
            <div class="tpl-image-holder">
                <img src="{$image|resize:500:357}" alt="image" />
            </div>
        </a>
        
        <div class="tpl-only-image">
            <div class="tpl-image-holder">
                <img src="{$image|resize:500:357}" alt="image" />
            </div>
        </div>
        
        <div class="tpl-content">
            {if !empty($title)}
                <h5 class="tpl-title">{$title}</h5>
            {/if}
            
            {if !empty($position)}
                <div class="tpl-position"><b>{$position}</b></div>
            {/if}
            
            {if !empty($summary)}
                <div class="tpl-summary tpl-body-teaser">
                    {$summary}
                </div>
            {/if}

            {if !empty($get_url)}
                <div class="tpl-button-holder">
                    <a class="tpl-button" href="{$get_url}" {if $new_tab}target="_blank"{/if}>{translate}More Info{/translate}</a>
                </div>
            {/if}
        </div>
        <div class="clearfix"></div>
    </div>
</div>