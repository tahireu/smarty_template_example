{include file='../../../elements/get_fields.tpl' scope='parent'}

{if !empty($name)}
    {$title = $name}
{/if}

<div class="tpl-architect-person-detail tpl-architect-detail tpl-image-{if !empty($image)}yes{else}no{/if}">
    <div class="tpl-top-section">
        <div class="tpl-centered-1000">
            <div class="tpl-top-section-inner">
                <div class="tpl-table">
                    <div class="tpl-title-holder tpl-cell">
                        {if !empty($title)}
                            <h2 class="tpl-title">{$title}</h2>
                        {/if}
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="tpl-main-section">
        <div class="tpl-centered-1000">
            <div class="tpl-image-and-buttons-holder">
                {if !empty($image)}
                    <div class="tpl-image-holder">
                        <img src="{$image|resize:600:600}" alt="" />
                    </div>
                {/if}
            </div>
            <div class="tpl-main-holder">
                <div class="tpl-details">
                    {if !empty($position)}
                        <div class="tpl-info tpl-position">
                            <i></i><span><b>Position:</b> {$position}</span>
                        </div>
                    {/if}
                </div>
                
                <div class="tpl-content">
                    {if !empty($body)}
                        <h6>About Me:</h6>
                        <div class="tpl-body">
                            {$body}
                        </div>
                    {/if}
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>