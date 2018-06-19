<div class="tpl-architect-child-info">
    {if !empty($child_id)}
        <div class="tpl-child-info tpl-id">
            <i></i><span>ID# {$child_id}</span>
        </div>
    {/if}
    {if !empty($gender)}
        <div class="tpl-child-info tpl-gender tpl-gender-{$gender|lower}">
            <i></i><span>{if $gender == 'Male'}Boy{elseif $gender == 'Female'}Girl{/if}</span>
        </div>
    {/if}
    {if !empty($country) || !empty($community)}
        <div class="tpl-child-info tpl-country">
            <i></i><span>{if !empty($community)}{$community}{/if}{if !empty($country)}{if !empty($both_loc)}, {/if}{$country}{/if}</span>
        </div>
    {/if}
    {if !empty($birthday)}
        <div class="tpl-child-info tpl-birthday">
            <i></i><span>{$birthday|date_format:'m/d/Y'}</span>
        </div>
    {/if}
</div>