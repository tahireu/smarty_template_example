{include file='./get_fields.tpl' scope='parent'}

<div class="tpl-architect-detail tpl-image-{if !empty($image)}yes{else}no{/if}">
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
                {include file='./giving_form.tpl'}
                <div class="tpl-buttons">
                    {if !empty($advocacy.review_url)}
                        <a class="tpl-button" href="{$advocacy.review_url}">{translate}Start a Fundraising Campaign{/translate}</a>
                    {/if}
                </div>
            </div>
            <div class="tpl-main-holder">
                <div class="tpl-details">
                    <b>In: </b>{include file='./get_tags.tpl'}
                </div>

                {if !empty($body)}
                    <div class="tpl-body">
                        {$body}
                    </div>
                {/if}

                {if !empty($video) && !empty($video.html)}
                    <div class="tpl-video-holder">
                        {$video.html}
                    </div>
                {/if}
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>