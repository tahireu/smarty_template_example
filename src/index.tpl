<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">

<head>
    <title>
        {if !empty($fullViewItemTitle)}
            {$fullViewItemTitle} -
        {elseif !empty($SitePage.title)}
            {$SitePage.title} -
        {/if}
        {$SiteChannel.title}
    </title>

    {* Favicon *}
    <link rel="apple-touch-icon" sizes="57x57" href="{'/img/favicon/apple-touch-icon-57x57.png'|get_asset_url}">
    <link rel="icon" type="image/png" href="{'/img/favicon/favicon-32x32.png'|get_asset_url}" sizes="32x32">
    <link rel="icon" type="image/png" href="{'/img/favicon/favicon-16x16.png'|get_asset_url}" sizes="16x16">
    <link rel="shortcut icon" href="{'/img/favicon/favicon.ico'|get_asset_url}">

    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    {$meta}

    {$css}
    <link rel="stylesheet" type="text/css" href="{'/fonts/CompanyLeelawadee/stylesheet.css'|get_asset_url}" media="all" />
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="{'/fonts/Linearicons/style.css'|get_asset_url}" />
    <link rel="stylesheet" href="{'/lib/Magnific-Popup-1.0.1/magnific-popup.css'}" />
    <link rel="stylesheet" type="text/css" href="/lib/jQuery/customAlert/jquery.customAlert.css" />
    <link rel="stylesheet" type="text/css" href="{'/css/ext-js-theme.css'|get_asset_url}" />
    <link rel="stylesheet" type="text/css" href="{$templateCss}" />

    {* JS *}
    <script type="text/javascript" src="/js/ss/vars.js"></script>
    <script type="text/javascript" src="/js/ss/utils/Router.js"></script>
    <script type="text/javascript">
        Ext = { buildSettings: { "scopeResetCSS": true}};
    </script>

    {*INCLUDE JS FILES FROM ALL COMPONENTS*}
    {$script}

    {*INCLUDE ALL JQUERY PLUGINS IF THEY ARE NOT ALREADY LOADED*}
    {include file='elements/jQuery.tpl'}

    {literal}
        <script type="text/javascript" src="//use.typekit.com/{placeholder}.js"></script>
        <script type="text/javascript">
            $.holdReady(true);
            try {
                Typekit.load({
                    active: function() {
                        $.holdReady(false);
                    },
                    inactive: function(){
                        $.holdReady(false);
                    }
                })
            } catch(e) {
                $.holdReady(false);
            }
        </script>
    {/literal}

    {* JS from various SS places *}
    <script type="text/javascript" src="/js/ss/frontend/ShareHelper.js"></script>

    {* JS from this template *}
    <script type="text/javascript" src="{'/lib/Magnific-Popup-1.0.1/jquery.magnific-popup.min.js'}"></script>
    <script type="text/javascript" src="{'/js/lib/jquery.responsiveVideo.js'|get_asset_url}"></script>
    <script type="text/javascript" src="{'/js/template.js'|get_asset_url}"></script>
    <script type="text/javascript" src="{'/js/contributions.js'|get_asset_url}"></script>

    {if !empty($load_scripts)}
        {$load_scripts}
    {/if}

</head>

<body>
<div class="tpl-section-main-container tpl-user-logged-in-{if $loggedIn}yes{else}no{/if}">
    {* Flyout *}
    {if !empty($flyout)}
        <div class="tpl-position-flyout">
            <div class="tpl-position-flyout-inner">
                {$flyout}
                <div class="clearfix"></div>
                <i class="tpl-mobile-menu-close-trigger"></i>
            </div>
        </div>
    {/if}

    <div class="tpl-section-main-content">

        {* Header *}
        {capture name="body"}
            {$body}
        {/capture}
        <div class="tpl-position-header {if $smarty.capture.body|strstr:"tpl-hero tpl-video-yes"}tpl-header-absolute{/if}">
            <div class="tpl-position-header-inner tpl-centered">
                <div class="tpl-position-header-left tpl-table">
                    {* User menu - hidden on big screens *}
                    {*{include file='./elements/user_menu_trigger.tpl'}*}

                    <div class="tpl-position-header-left-inner tpl-cell">
                        <a href="/" title="Home Page">
                            <img class="tpl-header-logo" src="{'/img/logo.png'|get_asset_url}" alt=""/>
                            <img class="tpl-header-logo-white" src="{'/img/logo-white.png'|get_asset_url}" alt=""/>
                        </a>
                    </div>
                </div>
                <div class="tpl-position-header-right tpl-table">
                    <div class="tpl-position-header-right-inner tpl-cell">
                        {if !empty($header_right)}{$header_right}{/if}
                        <div class="clearfix"></div>
                    </div>
                    {* User menu - hidden on small screens *}
                    {include file='./elements/user_menu_trigger.tpl'}

                    <div class="tpl-header-trigger tpl-side-menu-trigger tpl-cell">
                        <span>Menu</span>
                    </div>
                </div>
                {if !empty($shopping_cart)}
                    <div class="tpl-position-shopping-cart tpl-table">
                        <div class="tpl-position-shopping-cart-inner tpl-cell">
                            {$shopping_cart}
                        </div>
                    </div>
                {/if}
                <div class="clearfix"></div>
            </div>
        </div>

        {* Header logo on mobile devices and smaller screens *}
        <div class="tpl-position-mobile-logo-holder">
            <a href="/" title="Home Page">
                <img class="tpl-header-logo" src="{'/img/logo.png'|get_asset_url}" alt=""/>
            </a>
        </div>

        {* Body *}
        <div class="tpl-position-body-wrapper">
            {if !empty($body)}
                <div class="tpl-position-body">
                    {$body}
                    <div class="clearfix"></div>
                </div>
            {/if}
        </div>

        {*Footer*}
        {if !empty($footer)}
            <div class="tpl-position-footer-wrapper">
                <div class="tpl-position-footer tpl-centered-960">
                    {$footer}
                    <div class="clearfix"></div>
                </div>
            </div>
        {/if}

        {*Footer Bottom *}
        {if !empty($footer_bottom)}
            <div class="tpl-position-footer-bottom-wrapper">
                <div class="tpl-position-footer-bottom tpl-centered-960">
                    {$footer_bottom}
                    <div class="clearfix"></div>
                </div>
            </div>
        {/if}
    </div>
    <div class="clearfix"></div>
</div>
</body>
</html>