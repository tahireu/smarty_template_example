<div class="tpl-menus-menu-copyright-menu">
    {foreach $items AS $index => $item}
        {if !empty($item.url)}
            <a href="{$item.url}" class="{$item.css_class}" target="{$item.target}">
                <span>{$item.text}</span>
            </a>
        {else}
            <span>{$item.text}</span>
        {/if}

        {if $index+1 < $items|@count}
            <b>|</b>
        {/if}

    {/foreach}
</div>