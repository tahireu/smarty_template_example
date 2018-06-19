{*{if empty($get_tag_categories)}*}
    {*{$all_tag_categories = $tag_categories}*}
{*{else}*}
    {$all_tag_categories = []}
    {* Loop through all Tag Categories in the system *}
    {foreach $tag_categories as $tag_category}
        {if !empty($get_tag_categories)}
            {* Loop through all Tag Categories that need to show up *}
            {foreach $get_tag_categories as $get_tag_category}
                {* If Tag Category exist in system and it has tags *}
                {if $get_tag_category == $tag_category.name && !empty($tag_category.tags)}
                    {$all_tag_categories[] = $tag_category}
                {/if}
            {/foreach}
        {else}
            {$all_tag_categories[] = $tag_category}
        {/if}
    {/foreach}
{*{/if}*}

{if empty($show_tag_category)}
    {$show_tag_category = false}
{/if}

{if !empty($all_tag_categories)}
    <div class="tpl-elements-get-tags tpl-tag-categories-{if $show_tag_category}yes{else}no{/if}">
        {if !empty($tags_label)}
            <span class="tpl-label tpl-all-tags-label">{$tags_label}</span>
        {/if}
        
        {foreach $all_tag_categories as $category_key => $tag_category}
            <span class="tpl-tag-category">
                {if $show_tag_category}
                    <span class="tpl-label tpl-tag-category-name">{$tag_category.name}:</span>
                {/if}
                
                {foreach $tag_category.tags as $key => $tags_item}
                    {$sep = ""}
                    {* Add separator after tag category *}
                    {if $category_key+1 < count($all_tag_categories)}
                        {$sep = "<span class=\"tpl-sep tpl-sep-tag-cat\">, </span>"}
                    {/if}
                    {* Add separator after tag *}
                    {if $key+1 < count($tag_category.tags)}
                        {$sep = "<span class=\"tpl-sep tpl-sep-tag\">, </span>"}
                    {/if}

                    {if empty($tags_item.url) || !empty($tags_item.url) && isset($opportunity_full)}
                        <span class="tpl-tag">{$tags_item.name}</span>{$sep}
                    {elseif !empty($tags_item.url)}
                        <a class="tpl-tag" href="{$tags_item.url}">{$tags_item.name}</a>{$sep}
                    {/if}
                {/foreach}
            </span>
        {/foreach}
    </div>
{/if}