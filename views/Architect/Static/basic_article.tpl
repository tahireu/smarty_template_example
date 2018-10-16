{assign var=uid value='1'|mt_rand:500}

{include file='../../../elements/get_fields.tpl' scope='parent'}

{if $viewClass|strstr:'tpl-image-at-bottom' || $viewClass|strstr:'tpl-image-right'}
    {$image_at_bottom = true}
{else}
    {$image_at_bottom = false}
{/if}

{if $viewClass|strstr:'tpl-image-as-background'}
    {include file="../../../elements/background_image.tpl"}
    {$image = false}
{/if}

{if $viewClass|strstr:"tpl-truncate-150"}
    {$body = $body|strip_tags|truncate:150}
{/if}

<div class="tpl-architect-static-basic-article {$viewClass}" id="tpl-background-image-{$uid}">
	<div class="tpl-inner-wrap{if $viewClass|strstr:'tpl-vertical-align-middle'} tpl-table{/if}">
		<div class="tpl-content-holder{if $viewClass|strstr:'tpl-vertical-align-middle'} tpl-cell{/if}">
            {if !empty($image) && $image_at_bottom == false && !$viewClass|strstr:'tpl-image-hidden'}
			    <div class="tpl-image-holder tpl-image-holder-top">
                    <img src="{$image}" alt="" />
                </div>
            {/if}
            
            <div class="tpl-content">
                {if !empty($title)}
                    <h2 class="tpl-title">{$title}</h2>
                {/if}

                {if !empty($description)}
                    <div class="tpl-description tpl-body-teaser">
                        {$description}
                    </div>
                {/if}

                {if !empty($summary)}
                    <div class="tpl-summary tpl-body-teaser">
                        {$summary}
                    </div>
                {/if}

                {if !empty($body)}
                    <div class="tpl-body tpl-body-content">
                        {$body}
                    </div>
                {/if}

                {if !empty($get_url) && !empty($button_text)}
                    <div class="tpl-button-holder">
                        <a class="tpl-button" href="{$get_url}" {if $new_tab}target="_blank"{/if}>{$button_text}</a>
                    </div>
                {/if}
            </div>

            {if !empty($image) && $image_at_bottom == true && !$viewClass|strstr:'tpl-image-hidden'}
                <div class="tpl-image-holder tpl-image-holder-bottom">
                    <img src="{$image}" alt="" />
                </div>
            {/if}
            <div class="clearfix"></div>
		</div>
	</div>
</div>