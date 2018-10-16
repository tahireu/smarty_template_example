<div class="tpl-header-trigger tpl-user-menu-trigger tpl-cell">
    <span class="tpl-user-menu-trigger-inner">
        <i class="fa fa-user"></i>
        <span>{if $loggedIn}{$Person.firstname}'s Account{else}Login/Sign Up{/if}</span>
    </span>
    <div class="tpl-section-user-drop-content">
        {if !empty($user_drop_content)}
            <div class="tpl-position-user-drop-content">
                {$user_drop_content}
                <div class="clearfix"></div>
            </div>
        {/if}
        <div class="clearfix"></div>
    </div>
</div>