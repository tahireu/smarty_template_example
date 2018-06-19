{if is_array($image) && !empty($image[0])}
    {$image = $image[0]}
{/if}
{if !empty($cover)}
    {$image = $cover}
{/if}

<div class="tpl-architect-project-advocacy-details tpl-advocacy-details">
    <div class="tpl-content-holder">
        {if !empty($image)}
            <div class="tpl-image-holder">
                <img src="{$image|resize:600:600}" alt="image" />
            </div>
        {/if}

        {if !empty($content)}
            <div class="tpl-body">
                {$content}
            </div>
        {elseif !empty($body)}
            <div class="tpl-body">
                {$body}
            </div>
        {/if}
        <div class="clearfix"></div>
    </div>
</div>