{*Get image*}
{if is_array($image) && !empty($image[0])}
    {$image = $image[0]}
{/if}


{*Get advocacy back url*}
{$advocacy_back_url = $advocacy.select_url}
{if $advocacy.select_url|strstr:"/p/"}
    {$advocacy_back_url = "javascript:history.go(-1);"}
{/if}


{*Get action button text*}
{$action_button = 'Customize Your Campaign'}
{if !empty($advocacy.wording.review_action_button)}
    {$action_button = $advocacy.wording.review_action_button}
{/if}


{*Get Title*}
{if empty($title) && !empty($name)}
    {$title = $name}
{/if}


<div class="tpl-architect-ministry-advocacy-review tpl-advocacy-review">
    <div class="tpl-advocacy-page-title">
        {if !empty($title)}
            <h2>{if isset($_link_)}<a href="{$_link_}">{/if}{$title}{if isset($_link_)}</a>{/if}</h2>
        {/if}
        <a href="{$advocacy.customize_url}" class="tpl-button tpl-advocacy-action-button">{$action_button}</a>
        <div class="clearfix"></div>
    </div>

    <div class="tpl-campaign-details">
        <div class="tpl-image-holder">
            <img src="{$image|resize:475:300}" alt="image" />
        </div>

        <div class="tpl-content-holder">
            {if !empty($content)}
                <div class="tpl-body">
                    {$content}
                </div>
            {elseif !empty($body)}
                <div class="tpl-body">
                    {$body}
                </div>
            {/if}

            {include file='../../../elements/progress_bar.tpl' advocacy_stage = true}

        </div>
        <div class="clearfix"></div>
    </div>

    <div class="tpl-advocacy-page-footer">
        <a href="{$advocacy.customize_url}" class="tpl-button tpl-advocacy-action-button">{$action_button}</a>
        <a href="{$advocacy_back_url}" class="tpl-button-brown tpl-advocacy-go-back-button">Go Back</a>
        <div class="clearfix"></div>
    </div>
</div>