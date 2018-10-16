{*Get URL for button*}
{$new_tab = false}
{$get_url = false}
{if !empty($button_link) && is_array($button_link) && !empty($button_link[0])}
    {$button_link = $button_link[0]}
{/if}
{if isset($button_link) && !empty($button_link)}
    {$get_url = $button_link}

    {if !empty($button_link.url)}
        {$get_url = $button_link.url}
    {/if}
{/if}
{if !empty($site_page) && is_array($site_page) && !empty($site_page[0])}
    {$site_page = $site_page[0]}
{/if}
{if isset($site_page) && !empty($site_page) && !empty($site_page.url)}
    {$get_url = $site_page.url}
{/if}
{if !empty($external_link) && is_array($external_link) && !empty($external_link[0])}
    {$external_link = $external_link[0]}
{/if}
{if !empty($external_link)}
    {$get_url = $external_link}
    {$new_tab = true}
{/if}

{if !empty($button_text) && is_array($button_text) && !empty($button_text[0])}
    {$button_text = $button_text[0]}
{/if}


{*Get image*}
{if isset($images) && !empty($images)}
    {$image = $images}
{/if}
{if isset($image) && !empty($image) && is_array($image) && !empty($image[0])}
    {$image = $image[0]}
{/if}

{if isset($video) && !empty($video) && is_array($video) && !empty($video[0])}
    {$video = $video[0]}
{/if}

{if !empty($audio_file)}
    {$audio = $audio_file}
{/if}
{if !empty($audio) && is_array($audio) && !empty($audio[0])}
    {$audio = $audio[0]}
{/if}


{*Get body*}
{if !empty($body) && is_array($body) && !empty($body[0])}
    {$body = $body[0]}
{/if}