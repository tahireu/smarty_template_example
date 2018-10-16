<div class="tpl-menus-menu-social-menu">
    {foreach $items AS $index => $item}
        <a href="{$item.url}" target="{$item.target}">
            {*{if $item.css_class == 'contact'}*}
                {*{$item.text}*}
            {*{else}*}
                <i class="{$item.css_class}"></i>
            {*{/if}*}
        </a>
    {/foreach}
    <div class="clearfix"></div>
</div>