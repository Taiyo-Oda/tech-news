// ;(function (d, $) {

//   var jQdm_slideMenu;

//   jQdm_slideMenu = function(){

//     // 初期設定
//     var prop = {
//     	pagerContainer: '.next',
//       pagerTargetContainer: '.main',
//       pagerLoadingContents: '.main .top'
//     }

//     function init(){
//       // 特定の要素までスクロールしたら、外部ページを読み込む
//       $(prop.pagerTargetContainer).infinitescroll({
//         itemSelector: prop.pagerLoadingContents,
//          animate: false, // ページ読み込み後に特定の位置までアニメーション移動させるか
//         extraScrollPx: 300, // ページ読み込み後に移動する距離（px）
//         pixelsFromNavToBottom: 50, // スクロール位置が、ページ下端からどれくらい距離で読み込みを開始するか（px）
//         loading: {
//           img: "img/loader.gif",  // ローディング中の画像
//           msgText: "画像を読み込んでいます...",  // ページ読み込み時に表示されるメッセージ
//           finishedMsg: "すべて読み込まれました"  // すべてのページが読み込まれた後のメッセージ
//         },
//       }, function(_t, _opt){  // ページ読み込み後の処理
//         var _len = _t.length;
//         while(_len--){
//           deferredImage_setting($(_t[_len]).find(prop.deferredImage));
//         }
//       });

// 	  }

//     // 画像の遅延読み込み設定
//     function deferredImage_setting(_$t){

//       $( _$t || prop.deferredImage).lazyload({
//         threshold : 10,
//         effect: 'fadeIn',
//         effectspeed: 1000
//       });
//     }

// 		// 文字列置換処理
//     function replaceString(_str, _bf, _af, _flg){
//       var _reg = new RegExp(_bf || '[\\.#]', _flg || '');
//       return _str ? _str.replace(_reg, _af || '') : false;
//     }

//     init();

//   };

//   jQdm_slideMenu();

// })(document, jQuery);


// ここからサンプル１
$(document).on('turbolinks:load', function () {
  $('.main').infiniteScroll({
    path: function() {
      var pageNumber = ( this.loadCount + 1 );
      var url = '/links/page' + pageNumber;
      return url
    },
    append: '.container',
    status: '.scroller-status',
    history: false,
  })
});


