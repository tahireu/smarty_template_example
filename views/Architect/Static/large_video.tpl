{assign var=uid value='1'|mt_rand:500}

{include file='../../../elements/get_fields.tpl' scope='parent'}

{if $viewClass|strstr:'tpl-play-video-in-shadowbox'}
    {$in_shadowbox = true}
{else}
    {$in_shadowbox = false}
{/if}

{if !empty($summary)}
    {$summary = $summary}
{elseif !empty($summary)}
    {$summary = $body}
{/if}

<div class="tpl-architect-static-large-video {$viewClass}" id="tpl-architect-static-large-video-{$uid}">
    <div class="tpl-content-holder">

        {*If view class "Content Above Video" is chosen.*}
        {if $viewClass|strstr:"tpl-content-above-video"}
            {if !empty($title)}
                <div class="tpl-title">{$title}</div>
            {/if}
            {if !empty($description)}
                <div class="tpl-description">
                    {$description}
                </div>
            {/if}
            {if !empty($summary)}
                <div class="tpl-video-summary tpl-body">{$summary}</div>
            {/if}
        {/if}

        <div class="tpl-video-wrapper">
            {if !$in_shadowbox && !empty($video) && !empty($video.html)}
                {$video.html}
            {/if}
            {if !empty($image)}
                <a href="{if $in_shadowbox}{$video.url}{else}javascript:;{/if}" class="tpl-play-video {if $in_shadowbox}tpl-open-video-in-magnific-popup mfp-iframe{else}tpl-play-in-place{/if}">
                    <span class="tpl-video-cover" style="background-image: url('{$image|resize:960:540}');">
                        <span class="tpl-title">
                        {*If view class "Content Above Video" is NOT chosen.*}
                        {if !$viewClass|strstr:"tpl-content-above-video"}
                            {$title}
                        {/if}
                        </span>
                    </span>
                </a>
            {/if}
        </div>
    </div>

    {if !$in_shadowbox}
        <script type="application/javascript">
            $(document).ready(function () {
                var thisView = $('#tpl-architect-static-large-video-'+{$uid});
                thisView.find('.tpl-play-in-place').on('click', function () {
                    var iframeSrc = thisView.find('iframe').attr('src');
                    thisView.find('iframe').attr('src', iframeSrc + '&autoplay=1');
                    $(this).fadeOut(200);
                });
            });
        </script>
    {/if}
</div>