import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

import 'response.dart';

final bool callApi = true;
final String baseDir = '/Users/xen/Pictures';
final DateTime now = DateTime.now();
final String imageName = 'image' +
    now.year.toString() +
    '_' +
    now.month.toString() +
    '_' +
    now.day.toString() +
    '_' +
    now.hour.toString() +
    '.jpg';
final String absoluteImagePath = baseDir + '/' + imageName;

void main(List<String> arguments) {
  print('I WILL FETCH BING WALLPAPER AND SET IT FOR YOU!!!');
  getXmlResponse()
      .then((xml) => getImageId(xml))
      .then((imageId) => getImage(imageId))
      .then((bytes) => save(bytes))
      .then((file) => set());
  print("********    DONE!!!    ********");
}

Future<String> getXmlResponse() async {
  var url = Uri.https('cn.bing.com', '/HPImageArchive.aspx',
      {'format': 'xml', 'idx': '0', 'n': '1', 'mkt': 'en-US'});
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return response.body;
  } else {
    return Future.error("Request failed with status: ${response.statusCode}.");
  }
}

Future<Uint8List> getImage(String imageId) async {
  var url = Uri.https('cn.bing.com', '/th', {'id': imageId});
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return response.bodyBytes;
  } else {
    return Future.error("Request failed with status: ${response.statusCode}.");
  }
}

Future<File> save(Uint8List bytes) {
  return File(absoluteImagePath).writeAsBytes(bytes);
}

void set() {
  //Method 1:
  Process.run('wallpaper', ['set', absoluteImagePath]).then((result) {
    stdout.write(result.stdout);
    stderr.write(result.stderr);
  });
  //Method 2:
  // Shell().run('wallpaper set ' + absoluteImagePath)
  //     .whenComplete(() => print('Completed!'));
}

String getImageId(String goodXmlString) {
  final myTransformer = Xml2Json();
  myTransformer.parse(goodXmlString);
  var json = myTransformer.toParkerWithAttrs();
  Map<String, dynamic> map = jsonDecode(json);
  ResponseObj responseObj = ResponseObj.fromJson(map);
  String urlBase = responseObj.images.image.urlBase;
  String imageId = urlBase.substring(7) + '_UHD.jpg';
  return imageId;
}
