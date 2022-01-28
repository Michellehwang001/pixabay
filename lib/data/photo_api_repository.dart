import 'package:search_image/model/photo.dart';

// 의존되는 객체를 의존하지 않게끔 interface
abstract class PhotoApiRepository {
  Future<List<Photo>> fetch(String query);
}