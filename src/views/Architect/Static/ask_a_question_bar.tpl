{include file='../../../elements/get_fields.tpl' scope='parent'}

<a href="{if !empty($get_url)}{$get_url}{else}javascript:;{/if}" class="tpl-architect-static-ask-a-question-bar {$viewClass}">
    {if !empty($image)}
        <img src="{$image}" alt="" />
    {/if}
    
    {if !empty($title)}
        <h3 class="tpl-title">{$title}</h3>
    {/if}
</a>