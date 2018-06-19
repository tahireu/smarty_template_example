{assign var=uid value='1'|mt_rand:500}

{include file='../../../elements/get_fields.tpl' scope='parent'}
{include file="../../../elements/background_image.tpl" use_hero = true fixedSize = [800,300]}

<div class="tpl-architect-story-detail {$viewClass}">
    <div class="tpl-hero">
        <div class="tpl-background-image" id="tpl-background-image-{$uid}">
            <div class="tpl-hero-content">
                <div class="tpl-table">
                    <div class="tpl-cell">
                        <div class="tpl-hero-content-inner tpl-centered-850">
                            {if !empty($title)}
                                <h1 class="tpl-title"><span>{$title}</span></h1>
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="tpl-content tpl-centered-800">
        <div class="tpl-share-page" id="tpl-share-page-{$uid}">
            <div class="tpl-date-and-social-buttons-holder tpl-table">
                <div class="tpl-date tpl-cell">
                    {$publish_date|date_format:'%A, %B %e, %Y'}
                </div>
                <div class="tpl-social-buttons tpl-cell">
                    <a class="tpl-share-button tpl-share-facebook facebookShare" href="javascript:;"></a>
                    <a class="tpl-share-button tpl-share-twitter twitterShare" href="javascript:;"></a>
                </div>
            </div>
        </div>
        
        {if !empty($body)}
            <div class="tpl-body">
                <div class="tpl-body-inner">
                {$body}
                {if !empty($external_link)}
                    <div class="tpl-button-holder">
                        <a href="{$external_link}" class="tpl-button">{$button_text}</a>
                    </div>
                {/if}
                </div>
            </div>
        {/if}
        {*{if !empty($external_link)}
            <a href="{$external_link}" class="tpl-button">{$button_text}</a>
        {/if}*}
    </div>

    <script type="text/javascript">
        $(document).ready(function(){
            // Share buttons
            if(SS.frontend && SS.frontend.ShareHelper){
                new SS.frontend.ShareHelper({
                    wrapper: 'tpl-share-page#tpl-share-page-' + {$uid},
                    twitterText: " ",
                    facebookText: " ",
                    fbShareMethod:true,
                    url: window.location.href
                });
            } else {
                console.log("SS.frontend.ShareHelper is not included. Note: Add /js/ss/frontend/ShareHelper.js in index.tpl");
            }
        });
    </script>
</div>