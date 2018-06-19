;( function($) {
    $.fn.responsiveVideo = function(options) {

        options = $.extend(true, {
            videoWrapper: '.tpl-video-player',
            video: 'video',
            videoOverlay: '.video-overlay',
            playButton: '.video-control-play',
            pauseButton: '.video-control-pause',
            autoPlay: false,
            autoPlayWhenInView: false,
            autoShowVideo: false,
            muted: false,
            loop: false,
            // callbacks
            beforePlay: null,
            afterPlay: null,
            beforePause: null,
            afterPause: null
        }, options);

        var timer, isMobile, isTablet, isLandscape, isPortrait, videoIsPlaying = false;
        var $videoWrapper = $(this);
        var $videoPlayerWrapper = $videoWrapper.find(options.videoWrapper);
        var $videoPlayer = $videoPlayerWrapper.find(options.video);
        var $videoOverlay = $videoWrapper.find(options.videoOverlay);
        var $playButton = $videoWrapper.find(options.playButton);
        var $pauseButton = $videoWrapper.find(options.pauseButton);

        this.elements = {
            videoWrapper: $videoWrapper,
            videoPlayerWrapper: $videoPlayerWrapper,
            videoOverlay: $videoOverlay,
            playButton: $playButton,
            pauseButton: $pauseButton
        };

        setMobileAttributes();
        isStopped(0);

        $videoPlayer.on('loadedmetadata.ResponsiveVideo', $.proxy(onLoadedMetaData, this));
        $videoPlayer.on('ended.ResponsiveVideo', $.proxy(onVideoEnded, this));
        $videoPlayer.on('pause.ResponsiveVideo', $.proxy(onVideoPause, this));
        $playButton.on('click.ResponsiveVideo', $.proxy(onPlayClick, this));
        $pauseButton.on('click.ResponsiveVideo', $.proxy(onPauseClick, this));
        $(window).on('resize', $.proxy(onWindowResize, this));
        if(options.autoPlayWhenInView){
            $(window).on('scroll', $.proxy(autoPlayWhenInView, this));
        }

        function onLoadedMetaData(event){
            resizeVideo();
            $videoPlayer.get(0).loop = options.loop;
            $videoPlayer.get(0).muted = options.muted;

            if(options.autoPlay && (!isMobile || (isTablet && !isPortrait))){
                onPlayClick.call(this,false);
            }
            if(options.autoShowVideo){
                autoShow();
            }
        }
        function onVideoEnded(event){
            videoIsPlaying = false;
            isStopped(300);
        }
        function onVideoPause(event){
            isPaused(300);
        }
        function onPlayClick(event){
            if(event){
                event.preventDefault();
            }

            if($.type(options.beforePlay) == 'function'){
                options.beforePlay.call(this);
            }

            $videoPlayer.get(0).play();
            videoIsPlaying = true;

            if($.type(options.afterPlay) == 'function'){
                options.afterPlay.call(this);
            }

            isPlaying(300);
        }
        function onPauseClick(event){
            if(event){
                event.preventDefault();
            }

            if($.type(options.beforePause) == 'function'){
                options.beforePause.call(this);
            }

            $videoPlayer.get(0).pause();
            videoIsPlaying = false;

            if($.type(options.afterPause) == 'function'){
                options.afterPause.call(this);
            }

            isPaused(300);
        }
        function onWindowResize(event){
            clearTimeout(timer);
            timer = setTimeout(function(){
                setMobileAttributes();
                resizeVideo();
            },300);
        }

        function setMobileAttributes()
        {
            isMobile = typeof window.matchMedia !== 'undefined' && $.isFunction(window.matchMedia) && window.matchMedia("(max-width: 700px)").matches;
            isTablet = typeof window.matchMedia !== 'undefined' && $.isFunction(window.matchMedia) && window.matchMedia("(max-width: 1025px)").matches && window.matchMedia("(min-width: 700px)").matches;
            isLandscape = typeof window.matchMedia !== 'undefined' && $.isFunction(window.matchMedia) && window.matchMedia("(orientation: landscape)").matches;
            isPortrait = typeof window.matchMedia !== 'undefined' && $.isFunction(window.matchMedia) && window.matchMedia("(orientation: portrait)").matches;
        }

        function resizeVideo()
        {
            $videoPlayer.removeAttr('width');
            $videoPlayer.removeAttr('height');

            var wrapperW = $videoPlayerWrapper.width();
            var wrapperH = $videoPlayerWrapper.height();

            var videoW = $videoPlayer.width();
            var videoH = $videoPlayer.height();

            var widthRatio = wrapperW / videoW;
            var heightRatio = wrapperH / videoH;

            if(widthRatio < heightRatio){
                $videoPlayer.attr('height', '100%');
                // uncomment the following lines for iOS 6 compatibility
                //if (isTablet) {
                //    $videoPlayer.attr('width', videoW * widthRatio);
                //}
            }else{
                $videoPlayer.attr('width', '100%');
                // uncomment the following lines for iOS 6 compatibility
                //if (isTablet) {
                //    $videoPlayer.attr('height', videoH * heightRatio);
                //}
            }

            repositionVideo();
        }

        function repositionVideo()
        {
            $videoPlayerWrapper.css({
                position: 'relative'
            });
            $videoPlayer.css({
                position: 'absolute',
                top: ($videoPlayerWrapper.height() / 2) - ($videoPlayer.height() / 2),
                left: ($videoPlayerWrapper.width() / 2) - ($videoPlayer.width() / 2)
            });
        }

        function isPlaying(animate)
        {
            if(!animate){ animate = 0; }

            $videoPlayerWrapper.stop(true, true);
            $videoOverlay.stop(true, true);

            $videoPlayerWrapper.css('visibility','visible');
            $videoPlayerWrapper.animate({
                opacity: 1
            },{
                duration: animate
            });

            $videoOverlay.animate({
                opacity: 0
            },{
                duration: animate,
                complete: function(){
                    $videoOverlay.css('visibility','hidden');
                }
            });

            $playButton.removeClass('play');
        }

        function isPaused(animate)
        {
            if(!animate){ animate = 0; }

            $videoOverlay.stop(true, true);

            $videoOverlay.css('visibility','visible');

            $videoOverlay.animate({
                opacity: 1
            },{
                duration: animate
            });
        }

        function isStopped(animate)
        {
            if(!animate){ animate = 0; }

            $videoPlayerWrapper.stop(true, true);

            $videoPlayerWrapper.animate({
                opacity: 0
            },{
                duration: animate,
                complete: function(){
                    $videoPlayerWrapper.css('visibility','hidden');
                    if(options.autoShowVideo){
                        autoShow();
                    }
                }
            });

            $videoOverlay.css('visibility','visible');

            $playButton.addClass('play');
        }

        function autoShow()
        {
            $videoPlayerWrapper.css({
                visibility: 'visible',
                opacity: 1
            });
        }

        function autoPlayWhenInView()
        {
            var topVideoOffset = $videoWrapper.offset().top;
            var bottomVideoOffset = topVideoOffset + $videoWrapper.height();
            var triggerPosition = $(window).scrollTop() + ($(window).height() / 2);

            if(!videoIsPlaying && triggerPosition > topVideoOffset && triggerPosition < bottomVideoOffset){
                onPlayClick.call(this,false);
            }else if(videoIsPlaying && triggerPosition > bottomVideoOffset){
                onPauseClick.call(this,false);
            }else if(videoIsPlaying && triggerPosition < topVideoOffset){
                onPauseClick.call(this,false);
            }
        }
    };
} )(jQuery);