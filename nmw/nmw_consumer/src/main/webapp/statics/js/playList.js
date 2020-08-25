/**
 *点击播放并添加进播放列表
 */
(function() {
    var $mainRight = $('.main-right'),
        $listDetail = $('.list-detail'),//播放列表
        $songPlay = $('.song-play'),//底部左侧播放器
        $songList = $('.song-list'),//最新音乐推荐
        audio = $('#audio')[0];

    $songList.on('click', 'li', function() {
        var src = $(this).find('.song-detail').data('src'),
            img = $(this).find('img').attr('src'),
            name = $(this).find('.song-name').text(),
            singer = $(this).find('.song-singer').text();
        audio.src = src;
        player.play();
        render.renderInfo(img, name, singer);
    });
    $listDetail.on('click', 'tr', function() {
        var src = $(this).data('src'),
            img = $(this).data('img'),
            name = $(this).find('.song-name').text(),
            singer = $(this).find('.song-singer').text();
        audio.src = src;
        player.play();
        render.renderInfo(img, name, singer);
    });
    $mainRight.on('dblclick',' tr', function() {
        if (!$(this).data('src')) {
            return;
        }
        var played = {};
        played.src = $(this).data('src');
        played.img = $(this).data('img');
        played.name = $(this).find('.song-name').text();
        played.singer = $(this).find('.song-singer').text();

        var flag = playedSongs.some(function(item) {
            return item.src === played.src;
        });
        if (!flag) {
            playedSongs.unshift(played);
        }

        render.renderAudio();
        audio.src = played.src;
        player.play();
        render.renderInfo(played.img,played.name,played.singer);
    });
})();
/**
 *播放列表
 */
(function(){
    var $playedListBt = $('.play-right').find('.playedList-Bt'),
        $playedList = $('#played-list'),
        $closeBt = $playedList.find('.close'),
        $clear = $playedList.find('.clear');

    $playedListBt.click(function() {
        $playedList.toggle();
    });
    $closeBt.click(function() {
        $playedList.hide();
    });
    $clear.click(function() {
        playedSongs = [];
        render.renderAudio();
    });
})();
