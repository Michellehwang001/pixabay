import 'dart:convert';
import 'package:search_image/data/photo_api_repository.dart';
import 'package:search_image/model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi implements PhotoApiRepository{
  final _base_url = 'https://pixabay.com/api/';
  final _key = '25306995-e91ba18f0224c46cd5e3ee74b';

  // query로 pixabay이미지 주소의 값을 get 방식으로 가져온다.
  @override
  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(Uri.parse(
        '$_base_url?key=$_key&q=$query&image_type=photo&pretty=true'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}