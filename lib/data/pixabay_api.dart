import 'dart:convert';
import 'package:search_image/data/photo_api_repository.dart';
import 'package:search_image/model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi implements PhotoApiRepository{
  // pixabay_api_test에서도 사용하기 위해 변수를 static const로 변경
  // ignore: constant_identifier_names
  static const base_url = 'https://pixabay.com/api/';
  static const key = '25306995-e91ba18f0224c46cd5e3ee74b';

  // query로 pixabay이미지 주소의 값을 get 방식으로 가져온다.
  // Mockito 테스트를 위해 fetch에 client 인자 추가
  @override
  Future<List<Photo>> fetch(String query, {http.Client? client}) async {
    client ??= http.Client();

    final response = await client.get(Uri.parse(
        '$base_url?key=$key&q=$query&image_type=photo&pretty=true'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}