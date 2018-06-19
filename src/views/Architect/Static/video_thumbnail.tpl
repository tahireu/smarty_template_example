{include file='../../../elements/get_fields.tpl' scope='parent'}

<div class="tpl-architect-static-video-thumbnail {$viewClass}">
    <div class="tpl-architect-static-video-thumbnail-inner">
        {if !empty($image)}
            <img class="tpl-video-thumbnail" src="{$image|resize:320:180}" alt="{$title}"/>
        {elseif !empty($video.thumbnail_url)}
            <img class="tpl-video-thumbnail" style="background-image: url('{$video.thumbnail_url}')" src="data:image/gif;base64,R0lGODlhAQABAID/AMDAwAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==" alt="{$title}"/>
        {/if}
        <div class="tpl-content">
            {if !empty($title)}
                <h6 class="tpl-title">{$title}</h6>
            {/if}
            
            {if !empty($body)}
                <div class="tpl-body">{$body}</div>
            {/if}
            
            <div class="tpl-button-holder">
                <a class="tpl-watch-now-button tpl-open-video-in-magnific-popup mfp-iframe" href="{$video.url}">{if !empty($button_text)}{$button_text}{else}Watch Now{/if}</a>
            </div>
        </div>
    </div>
</div>