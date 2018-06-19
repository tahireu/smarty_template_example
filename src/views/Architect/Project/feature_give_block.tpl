{assign var=uid value='1'|mt_rand:500}

{if !empty($alternate_subtitle) && $viewClass|strstr:'tpl-use-alternate-subtitle'}
    {$subtitle = $alternate_subtitle}
{/if}

{include file="../../../elements/background_image.tpl"}
{$image = false}

<div class="tpl-architect-project-feature-give-block {$viewClass}" id="tpl-background-image-{$uid}">
    <div class="tpl-content-holder">
        <div class="tpl-table">
            <div class="tpl-cell">
                <div class="tpl-content">
                    {if !$viewClass|strstr:'tpl-use-only-subtitle'}
                        {if !empty($title)}
                            <h1 class="tpl-title"><span>{$title}</span></h1>
                        {/if}

                        {if !empty($subtitle)}
                            <h2 class="tpl-subtitle">{$subtitle}</h2>
                        {/if}

                        {if !empty($summary)}
                            <div class="tpl-summary">
                                {$summary}
                            </div>
                        {/if}
                    {else}
                        {if !empty($subtitle)}
                            <h2 class="tpl-subtitle">{$subtitle}</h2>
                        {/if}
                    {/if}
    
                    {if !empty($campaign.id)}
                        <div class="tpl-giving-form">
                            {if !empty($giving_account)}
                                <h5>{$giving_account}</h5>
                            {else}
                                <h5>Make a Gift</h5>
                            {/if}
                            {*{$shoppingCartChannelUrl = 'https://give.company.org/'}*}
                            {include file='../../../elements/giving_form.tpl'}
                        </div>
                    {/if}
                </div>
            </div>
        </div>
		<div class="clearfix"></div>
    </div>
</div>