{if isset($image) && !empty($image) && is_array($image) && !empty($image[0])}
    {$image = $image[0]}
{/if}

{* Get from tags *}
{$country_external_id = false}
{$country = false}
{$gender = false}
{$community = false}
{if !empty($tag_categories)}
    {foreach $tag_categories AS $tag_category}
        {if $tag_category.name == 'Location' && !empty($tag_category.tags) && isset($tag_category.tags[0])}
            {$country = $tag_category.tags[0].name}
        {/if}
        {if $tag_category.name == 'Country' && !empty($tag_category.tags) && isset($tag_category.tags[0])}
            {if !empty($tag_category.tags[0].external_id)}
                {$country_external_id = $tag_category.tags[0].external_id}
            {/if}
            {$country = $tag_category.tags[0].name}
        {/if}
        {if $tag_category.name == 'Community' && !empty($tag_category.tags) && isset($tag_category.tags[0])}
            {$community = $tag_category.tags[0].name}
        {/if}
        {if $tag_category.name == 'Gender' && !empty($tag_category.tags) && isset($tag_category.tags[0])}
            {$gender = $tag_category.tags[0].name}
        {/if}
    {/foreach}
{/if}

{$both_loc = false}
{if !empty($country) && !empty($community)}
    {$both_loc = true}
{/if}


{if isset($first_name) && !empty($first_name)}
    {$title = $first_name}
{else}
    {if isset($name) && !empty($name)}
        {$title = $name}
    {/if}
{/if}
{if isset($last_name) && !empty($last_name)}
    {$title = "`$title` `$last_name`"}
{/if}