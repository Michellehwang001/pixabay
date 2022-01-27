import 'dart:async';
import 'package:search_image/data/pixabay_api.dart';
import 'package:search_image/model/photo.dart';

class HomeViewModel {
  final PixabayApi api;

  // Controller 생성
  final _photoScreamController = StreamController<List<Photo>>()..add([]);

  // Stream getter
  Stream<List<Photo>> get photoStream => _photoScreamController.stream;

  HomeViewModel(this.api);

  // api호출하는 fetch method
  Future<void> fetch(String query) async {
    // List<Photo>
    final result = await api.fetch(query);
    _photoScreamController.add(result);
  }
}