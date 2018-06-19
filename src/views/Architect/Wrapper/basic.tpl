{assign var=uid value='1'|mt_rand:500}

{if !empty($bg_color)}
    {$background_color = $bg_color}
{/if}

{if !empty($bg_image_position)}
    {$background_image_position = $bg_image_position}
{/if}

{if !empty($bg_image)}
    {$image = $bg_image}
{/if}
{if !empty($image) && is_array($image) && !empty($image[0])}
    {$image = $image[0]}
{/if}

<div class="tpl-architect-wrapper-basic {$viewClass}" id="tpl-architect-wrapper-basic-{$uid}">

    <style scoped type="text/css">
        #tpl-architect-wrapper-basic-{$uid} {
			{if !empty($background_color)}
				background-color: #{$background_color};
			{/if}
			{if !empty($image)}
				background-image: url('{$image}');
			{/if}
			{if isset($background_image_position) && $background_image_position >= 0 && $background_image_position <= 100}
				background-position: 50% {$background_image_position}%;
			{/if}
        }
    </style>

    {$wrapperBody}
    <div class="clearfix"></div>
</div>