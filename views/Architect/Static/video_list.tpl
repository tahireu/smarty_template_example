{if isset($video) && !empty($video) && is_array($video) && !empty($video[0])}
    {$video = $video[0]}
{/if}

<div class="tpl-architect-static-video-list {$viewClass}">
    <div class="tpl-architect-static-video-list-inner">
        {if !empty($title) && !empty($video) && !empty($video.url)}
            <a href="{$video.url}" class="tpl-title tpl-open-video-in-magnific-popup mfp-iframe">{$title}</a>
        {/if}
        {if !empty($body)}
            <div class="tpl-body">{$body}</div>
        {/if}
    </div>
</div>