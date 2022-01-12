part of '../kugou.dart';

///新歌推荐
Future<Answer> _musicList(Map params, List<Cookie> cookie) {
  return _get(
    "https://m.kugou.com",
    params: {
      "json": "true",
    },
    cookie: cookie,
  ).then((value) {
    var body = value.data;
    body.remove("banner");
    return Future.value(value.copy(data: body));
  });
}

///歌曲信息
Future<Answer> _musicInfo(Map params, List<Cookie> cookie) {
  //http://trackercdn.kugou.com/i/v2/?cmd=26&pid=4&hash=6E168B3349A4CB833CDD10A9BA1E7327&key=86c8f9eb1ed74ea9684165cca6d31acb&behavior=play&appid=3238&mid=1fbf760909b864a20361065451df36db&version=151&vipType=0&album_id=51227378
  return _get(
    "https://wwwapi.kugou.com/yy/index.php",
    params: {
      "r": "play/getdata",
      "hash": params["hash"],
      "album_audio_id": params["albumAudioId"],
    },
    cookie: cookie,
  );
}

///歌曲信息
Future<Answer> _musicInfo2(Map params, List<Cookie> cookie) {
  //http://trackercdn.kugou.com/i/v2/?cmd=26&pid=4&hash=6E168B3349A4CB833CDD10A9BA1E7327&key=86c8f9eb1ed74ea9684165cca6d31acb&behavior=play&appid=3238&mid=1fbf760909b864a20361065451df36db&version=151&vipType=0&album_id=51227378

  var mid = "0";
  var userid = "0";
  var appid = "1005";
  String hash = params["hash"];

  return _get(
    "http://trackercdn.kugou.com/i/v2/",
    params: {
      "cmd": "26",
      "key": md5.convert(utf8.encode("${hash.toLowerCase()}kgcloudv2$appid$mid$userid")),
      "hash": hash.toLowerCase(),
      "pid": 1,
      "behavior": "play",
      "mid": mid,
      "appid": appid,
      "userid": userid,
      "version": 0,
      "vipType": 0,
      "token": 0,
    },
    cookie: cookie,
  );
}

///歌曲信息
Future<Answer> _musicInfo3(Map params, List<Cookie> cookie) {
  //http://trackercdn.kugou.com/i/v2/?cmd=26&pid=4&hash=6E168B3349A4CB833CDD10A9BA1E7327&key=86c8f9eb1ed74ea9684165cca6d31acb&behavior=play&appid=3238&mid=1fbf760909b864a20361065451df36db&version=151&vipType=0&album_id=51227378

  String hash = params["hash"];

  return _get(
    "http://trackercdn.kugou.com/i/v2/",
    params: {
      "cmd": "25",
      "key": md5.convert(utf8.encode("${hash.toLowerCase()}kgcloudv2")),
      "hash": hash.toLowerCase(),
      "pid": 1,
      "behavior": "download",
    },
    cookie: cookie,
  );
}

//
// ///歌词
// Future<Answer> _musicLrc(Map params, List<Cookie> cookie) {
//   return _get(
//     "http://m.kuwo.cn/newh5/singles/songinfoandlrc",
//     params: {
//       "musicId": params["musicId"],
//     },
//     cookie: cookie,
//   );
// }
