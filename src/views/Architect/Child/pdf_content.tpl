{include file='./get_fields.tpl' scope='parent'}

{if isset($smarty.server.HTTPS) && $smarty.server.HTTPS == "on"}
    {$protocol = "https"}
{else}
    {$protocol = "http"}
{/if}

{$this_url = "`$protocol`://`$smarty.server.HTTP_HOST`"}


{if isset($image) && !empty($image) && $image}
    {$profile_photo = $image|resize:200:270|escape:'url'}
{else}
    {$profile_photo = '/img/default-placeholder-user.png'|get_asset_url}
{/if}
{$profile_photo_full = "`$this_url``$profile_photo`"}

{* Append Hometown (if not empty) to Country *}
{if !empty($country)}
    {if !empty($hometown)}
        {$country_hometown = "`$country`, `$hometown`"}
    {else}
        {$country_hometown = $country}
    {/if}
{else}
    {$country_hometown = false}
{/if}

{* Append Country (if not empty) to Hometown *}
{if !empty($hometown)}
    {if !empty($country)}
        {$hometown_country = "`$hometown`, `$country`"}
    {else}
        {$hometown_country = $hometown}
    {/if}
{else}
    {$hometown_country = false}
{/if}

{$content_padding = 1}
{$content_padding_sides = 0.6}

{$height_total = 29.7}
{$height_header = 5}
{$height_info_bar_1 = 1.8}
{$height_info_bar_2 = 0.9}
{$height_footer = 0.5}
{$height_content = $height_total - $height_header - $height_info_bar_1 - $height_info_bar_2}
{$height_content_inner = $height_content - $height_footer - $content_padding * 2}

{$width_total = 21}
{$width_sidebar = 6.1}
{$width_content = $width_total - $width_sidebar}


{* Define function for rendering details in sidebar*}
{function detail}
    {if !empty($field)}
        <tr>
            <td style="text-align: left; padding: {if isset($is_first) && $is_first == true}0.4{else}0.2{/if}cm 0.2cm 0 {$content_padding_sides}cm;">
                <div style="font-family: 'myriad-pro', sans-serif; font-size: 12px; color: #323232;">
                    <b>{$label}:</b>
                    <span>{if isset($is_date) && $is_date == true}{$field|date_format:'m/d/Y'}{else}{$field}{/if}</span>
                </div>
            </td>
        </tr>
    {/if}
{/function}


<div style="height: {$height_header}cm; background: #006699;">
    <div style="padding: 1.8cm {$content_padding_sides}cm 0.5cm">
        <table cellspacing="0" cellpadding="0" style="width: 100%;">
            <tr>
                <td>
                    <img src="{'/img/logo-final-150.svg'|get_asset_url}" alt="">
                </td>
            </tr>
        </table>
    </div>
</div>

<div style="height: {$height_info_bar_1}cm; line-height: {$height_info_bar_1}cm; font-family: 'leelawadeeregular', sans-serif; color: #323232; background: #F7F7F2; padding-left: {$width_sidebar + $content_padding_sides - 0.1}cm; font-size: 28px;">
    {$first_name} {$last_name}
</div>
<div style="height: {$height_info_bar_2}cm; line-height: {$height_info_bar_2}cm; font-family: 'myriad-pro', sans-serif; color: #fff; background: #006699; padding-left: {$width_sidebar + $content_padding_sides - 0.1}cm; font-size: 12px;">
    {if !empty($child_id)}
        <span>
            <span>ID# </span><b>{$child_id}</b>
        </span>
    {/if}
    {if !empty($gender)}
        <span>
            <span>Gender: </span><i class="linear-icon-{if $gender == 'Male'}man2{elseif $gender == 'Female'}woman2{/if}"></i><b>{if $gender == 'Male'}Boy{elseif $gender == 'Female'}Girl{/if}</b>
        </span>
    {/if}
    {if !empty($country_hometown)}
        <span>
            <span>Community: </span><i class="linear-icon-map-marker"></i><b>{$country_hometown}</b>
        </span>
    {/if}
    {if !empty($birthday)}
        <span>
            <span>Birth Date: </span><i class="linear-icon-cake"></i><b>{$birthday|date_format:'m/d/Y'}</b>
        </span>
    {/if}
</div>

<div style="font-family: 'myriad-pro', sans-serif; position: relative; height: {$height_content}cm;">
    <table cellpadding="0" cellspacing="0" style="width: {$width_total}cm; height: {$height_content}cm;">
        <tr>
            <td style="width: {$width_sidebar}cm; height: {$height_content}cm; background: #F0F0F0; color: #323232; vertical-align: top;">
                <table cellpadding="0" cellspacing="0" style="width: {$width_sidebar}cm; height: {$height_content}cm;">
                    <tr>
                        <td style="text-align: center;">
                            <img src="{$profile_photo_full}" width="5cm" height="6.7cm" alt="Image" style="border: solid 0.05cm #fff; margin-top: -3.9cm;">
                        </td>
                    </tr>
                    {if isset($hometown_country)}
                    {detail field=$hometown_country label="Hometown" is_first=true}
                    {/if}
                    {if isset($church)}
                    {detail field=$church label="Church"}
                    {/if}
                    {if isset($date_baptized)}
                    {detail field=$date_baptized label="Date Baptized"}
                    {/if}
                    {if isset($school)}
                    {detail field=$school label="School"}
                    {/if}
                    {if isset($grade)}
                    {detail field=$grade label="Grade"}
                    {/if}
                    {if isset($father)}
                    {detail field=$father label="Father"}
                    {/if}
                    {if isset($fathers_occupation)}
                    {detail field=$fathers_occupation label="Father's Occupation"}
                    {/if}
                    {if isset($mother)}
                    {detail field=$mother label="Mother"}
                    {/if}
                    {if isset($mothers_occupation)}
                    {detail field=$mothers_occupation label="Mother's Occupation"}
                    {/if}
                    {if isset($brother)}
                    {detail field=$brother label="How many brothers"}
                    {/if}
                    {if isset($sister)}
                    {detail field=$sister label="How many sisters"}
                    {/if}
                    {if isset($health_info)}
                    {detail field=$health_info label="Health Info"}
                    {/if}
                    {if isset($entered_into_database)}
                    {detail field=$entered_into_database label="Entered into database" is_date=true}
                    {/if}
                    {if isset($last_update)}
                    {detail field=$last_update label="Last update" is_date=true}
                    {/if}
                    {if isset($sponsorship_drive)}
                    {detail field=$sponsorship_drive label="Sponsorship Drive"}
                    {/if}
                    {if isset($date_in_promo)}
                    {detail field=$date_in_promo label="Date in promo"}
                        
                    {/if}
                    
                </table>
            </td>
            <td style="width: {$width_content}cm; height: {$height_content}cm; vertical-align: top; padding: {$content_padding}cm {$content_padding_sides}cm; color: #323232; font-family: 'myriad-pro', sans-serif;">
                <table cellpadding="0" cellspacing="0" style="height: {$height_content}cm; width: {$width_content - 2 * $content_padding_sides}cm;">
                    <tr>
                        <td style="height: {$height_content_inner}cm; vertical-align: top; text-align: left;">
                            {if !empty($about_me)}
                                <div style="color: #323232; font-family: 'leelawadeeregular', sans-serif; font-size: 20px;">About Me:</div>
                                <br>
                                <div style="color: #323232; font-family: 'myriad-pro', sans-serif; font-size: 12px; font-weight: normal;">{$about_me}</div>
                            {/if}

                            {if !empty($about_my_community)}
                                {if !empty($about_me)}
                                    <br>
                                    <br>
                                {/if}

                                <div style="color: #323232; font-family: 'leelawadeeregular', sans-serif; font-size: 20px;">About My Community:</div>
                                <br>
                                <div style="color: #323232; font-family: 'myriad-pro', sans-serif; font-size: 12px; font-weight: normal;">{$about_my_community}</div>
                            {/if}

                            {if !empty($benefits_of_the_program)}
                                {if !empty($about_me) || !empty($about_my_community)}
                                    <br>
                                    <br>
                                {/if}

                                <div style="color: #323232; font-family: 'leelawadeeregular', sans-serif; font-size: 20px;">Benefits of the Program:</div>
                                <br>
                                <div style="color: #323232; font-family: 'myriad-pro', sans-serif; font-size: 12px; font-weight: normal;">{$benefits_of_the_program}</div>
                            {/if}
                            
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="height: {$height_footer}cm; text-align: right; font-family: 'leelawadeeregular', sans-serif; font-weight: 400; font-size: 16px;">
                            <a href="{"`$protocol`://Company.org"}" style="color: #323232; text-decoration: none;">Learn More @ Company.org</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>