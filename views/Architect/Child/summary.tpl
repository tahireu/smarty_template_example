{include file='./get_fields.tpl' scope='parent'}
    
<div class="tpl-architect-child-summary tpl-image-{if !empty($image)}yes{else}no{/if}">
    <div class="tpl-content-holder">
        
        <a href="{$_link_}?sponsor" class="tpl-image-link tpl-retain-ratio">
            <div class="tpl-image-holder">
                <img src="{$image|resize:500:500}" alt="image">
            </div>
        </a>
        
        <div class="tpl-details">
            
            <div class="tpl-title" title="{if !empty($first_name)}{$first_name}{/if}">
                {if !empty($first_name)}
                    <a href="{$_link_}?sponsor">{$first_name}</a>
                {/if}
            </div>
            
            <div class="tpl-info-holder">
                {if !empty($country)}
                    <div class="tpl-info tpl-country">
                        <i></i><span>{$country}</span>
                    </div>
                {/if}
                {if !empty($birthday)}
                    <div class="tpl-info tpl-birthday">
                        <i></i><span>{$birthday|date_format:'m/d/Y'}</span>
                    </div>
                {/if}
                {if !empty($gender)}
                    <div class="tpl-info tpl-gender tpl-gender-{$gender|lower}">
                        <i></i><span>{if $gender == 'Male'}Boy{elseif $gender == 'Female'}Girl{/if}</span>
                    </div>
                {/if}
                <div class="clearfix"></div>
            </div>
            
            <div class="tpl-buttons">
                <a class="tpl-button tpl-details-button" href="{$_link_}?sponsor">{translate}Sponsor / Learn More{/translate}</a>
                <a class="tpl-button tpl-download-button" href="{$_link_}.pdf" target="_blank" download><i></i></a>
            </div>
        </div>
    </div>
</div>