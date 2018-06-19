<script type="text/javascript">
	if(typeof jQuery == 'undefined'){
		document.write('<script type="text/javascript" src="/lib/jQuery/jquery.min.js"></' + 'script>');
	}

	if(typeof jQuery !='undefined' && typeof jQuery.ui == 'undefined'){
		document.write('<script type="text/javascript" src="/lib/jQuery/ui/jquery.ui.min.js"></' + 'script>');
        document.write('<link rel="stylesheet" href="/tpl/Company/css/lib/jquery-ui-1.11.4.custom/jquery-ui.theme.min.css" type="text/css" media="screen" />');
	}

    if(typeof jQuery.namespace == 'undefined'){
        document.write('<script type="text/javascript" src="/lib/jQuery/jquery.cms.js"></' + 'script>');
    }

	if(SS != null && SS.customAlert == null){
		document.write('<script type="text/javascript" src="/lib/jQuery/customAlert/jquery.customAlert.js"></' + 'script>');
	}

</script>