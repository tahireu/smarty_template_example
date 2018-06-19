{assign var=uid value='1'|mt_rand:500}
<div class="tpl-menus-menu-main-menu" id="tpl-menus-menu-main-menu-{$uid}">
	<div class="tpl-items">
		{foreach name=first_level_items from=$items item=first_level_item}

			{$multi = $first_level_item.children|@count > 0}

			<div class="tpl-item{if $multi} tpl-item-with-sub-menu{/if}{if $smarty.foreach.first_level_items.first} first{/if}{if $smarty.foreach.first_level_items.last} last{/if}">
				<a class="tpl-menu-item tpl-item-first-level" href="{$first_level_item.url}" target="{$first_level_item.target}">
					<span>{$first_level_item.text}</span>
					{if $multi}
						<i class="tpl-expand-arrow tpl-expand-arrow-down fa fa-angle-down"></i>
						<i class="tpl-expand-arrow tpl-expand-arrow-up fa fa-angle-up"></i>
					{/if}
				</a>
				{if $multi}
					<div class="tpl-sub-items-wrapper">
						{foreach name=subitems from=$first_level_item.children item=subitem}
							<div class="tpl-sub-items-item {if $smarty.foreach.subitems.first}first{/if} {if $smarty.foreach.subitems.last}last{/if}">
								<a class="tpl-menu-item tpl-item-second-level" href="{$subitem.url}" target="{$subitem.target}">{$subitem.text}</a>
							</div>
						{/foreach}
					</div>
				{/if}
			</div>
		{/foreach}
	</div>

    <script type="text/javascript">
        $(document).ready(function(){
            // This view but only in Header or Side Fylout
            var thisView = $('.tpl-section-header, .tpl-position-flyout').find('#tpl-menus-menu-main-menu-{$uid}');
            var itemWithSubMenu = thisView.find('.tpl-item-with-sub-menu');

            itemWithSubMenu.on('touchstart click', function (e) {
                // If it's not clicked on sub-item
                if(!$(e.target).hasClass('tpl-item-second-level')){
                    e.preventDefault(); // don't follow link of parent item, it serves as toggle button
                    $(this).toggleClass('expanded');
                }
            });

            /*itemWithSubMenu.hover(function (event) {
                $(this).addClass('expanded');
            }, function (event) {
                $(this).removeClass('expanded');
            });*/

            var subItems = thisView.find('.tpl-sub-items-wrapper');
            
            // Close on outside click
            $(document).mouseup(function (e) {
                if (subItems.is(':visible') && !subItems.is(e.target) && subItems.has(e.target).length === 0
                    && !itemWithSubMenu.is(e.target) && itemWithSubMenu.has(e.target).length === 0) {
                    
                    itemWithSubMenu.removeClass('expanded');
                }
            });
        });
    </script>
</div>