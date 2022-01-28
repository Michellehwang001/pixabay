import 'dart:async';
import 'package:search_image/data/photo_api_repository.dart';
import 'package:search_image/model/photo.dart';

class HomeViewModel {
  final PhotoApiRepository _repository;

  // Controller 생성
  final _photoScreamController = StreamController<List<Photo>>()..add([]);

  // Stream getter
  Stream<List<Photo>> get photoStream => _photoScreamController.stream;

  HomeViewModel(this._repository);

  // api호출하는 fetch method
  Future<void> fetch(String query) async {
    // List<Photo>
    final result = await _repository.fetch(query);
    _photoScreamController.add(result);
  }
}