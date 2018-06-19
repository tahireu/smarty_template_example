{if !empty($uid)}
    {if !empty($image_multi)}
        {$image = $image_multi}
    {/if}
    {if (!isset($cover_only) || $cover_only == false) && empty($cover) && !empty($image)}
        {$cover = $image}
    {/if}
    
    {if !empty($cover) && is_array($cover)}
         {*Take second image.*}
        {if !empty($cover[1])}
            {$cover_second = $cover[1]}
        {/if}
        
         {*Take first image.*}
        {if !empty($cover[0])}
            {$cover = $cover[0]}
        {/if}
    {/if}

    {*$use_hero is taken from Story Detail view.*}
    {if !empty($use_hero)}
        {if !empty($hero)}
            {$cover = $hero}
        {/if}
        {if !empty($hero) && is_array($hero)}
            {*Take second image*}
            {if !empty($hero[1])}
                {$cover_second = $hero[1]}
            {/if}

            {*Take first image*}
            {if !empty($hero[0])}
                {$cover = $hero[0]}
            {/if}
        {/if}
    {/if}


    {$overlayColor = false}
    {if !empty($brightness) && $brightness != 0}
        {if $brightness > 0}
            {$overlayColor = "rgba(255,255,255,0.{$brightness})"}
        {/if}
        {if $brightness < 0}
            {$overlayColor = "rgba(0,0,0,0.{$brightness*-1})"}
        {/if}
    {/if}


    <style type="text/css">
        #tpl-background-image-{$uid} {
        {if !empty($cover)}
            {if !empty($fixedSize)}
                background-image: url('{$cover|resize:$fixedSize[0]:$fixedSize[1]}');
            {else}
                background-image: url('{$cover}');
            {/if}
            background-size: cover;
        {/if}
        
        {if isset($background_image_position) && $background_image_position >= 0 && $background_image_position <= 100}
            background-position: 50% {$background_image_position}%;
        {/if}
        {if isset($contrast)}
            -webkit-filter: contrast({$contrast}%);
            filter: contrast({$contrast}%);
        {/if}
        
        }
        
        #tpl-background-image-{$uid} .tpl-hero-overlay {
        {if !empty($overlayColor)}
            background-color: {$overlayColor};
        {else}
            display: none;
        {/if}
        }

        {if !empty($cover_second)}
            @media (max-width: 700px) {
                #tpl-background-image-{$uid} {
                    background-image: url('{$cover_second}');   
                }
            }
        {/if}
    </style>
{/if}