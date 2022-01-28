import 'package:flutter_test/flutter_test.dart';
import 'package:search_image/data/photo_api_repository.dart';
import 'package:search_image/model/photo.dart';
import 'package:search_image/ui/home_view_model.dart';

void main() {
  test('Is it works fetch method?', () async {
    final viewModel = HomeViewModel(FakePhotoApiRepository());

    await viewModel.fetch('apple');
    await viewModel.fetch('apple');

    final result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(
      viewModel.photoStream,
      emitsInOrder([
        equals([]),
        equals(result),
        equals(result),
        // isA<List<Photo>>(),
        // isA<List<Photo>>(),
      ]),
    );
  });
}

// Make fake data
class FakePhotoApiRepository extends PhotoApiRepository{
  @override
  Future<List<Photo>> fetch(String query) async {
    //0.5초 딜레이
    Future.delayed(const Duration(microseconds: 500));

    return fakeJson.map((e) => Photo.fromJson(e)).toList();
  }

}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 887443,
    "pageURL":
        "https://pixabay.com/photos/flower-life-yellow-flower-crack-887443/",
    "type": "photo",
    "tags": "flower, life, yellow flower",
    "previewURL":
        "https://cdn.pixabay.com/photo/2015/08/13/20/06/flower-887443_150.jpg",
    "previewWidth": 150,
    "previewHeight": 116,
    "webformatURL":
        "https://pixabay.com/get/g07803b7b8020eaed8d5a492eb3b828cee4987f1738f506670fd41de4e068f9a7820d8198e38fe41b68d239055ef6f4ae_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 497,
    "largeImageURL":
        "https://pixabay.com/get/gb67fbb4abf1e4cc6c9aa68bc9504abe93d5ce758dd4cdb96ff5e5e5230245411dd4ccc541ea128f18afe239bb11d039d843586c0f6227829e94387be8f2e33d5_1280.jpg",
    "imageWidth": 3867,
    "imageHeight": 3005,
    "imageSize": 2611531,
    "views": 262977,
    "downloads": 156295,
    "collections": 3544,
    "likes": 1020,
    "comments": 164,
    "user_id": 1298145,
    "user": "klimkin",
    "userImageURL":
        "https://cdn.pixabay.com/user/2017/07/18/13-46-18-393_250x250.jpg"
  },
  {
    "id": 3063284,
    "pageURL":
        "https://pixabay.com/photos/rose-flower-petal-floral-noble-3063284/",
    "type": "photo",
    "tags": "rose, flower, petal",
    "previewURL":
        "https://cdn.pixabay.com/photo/2018/01/05/16/24/rose-3063284_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g12276804c154c87d4e053bc3aa30a508ff944b2c46464da1dda6306c7484050de77da90957496a75c52015e886950e453b141c0584216b1351bf9d80677fed26_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/g68d5ad4be204aa69324ccad3262f86761ad678fa30774144b1e4e61fef5dd1c6714b5d62cc8b9875cb8a9acfc25277209a892f2d0c9045d09dce9c8c1c467ee6_1280.jpg",
    "imageWidth": 6000,
    "imageHeight": 4000,
    "imageSize": 3574625,
    "views": 934587,
    "downloads": 602632,
    "collections": 2889,
    "likes": 1427,
    "comments": 307,
    "user_id": 1564471,
    "user": "anncapictures",
    "userImageURL":
        "https://cdn.pixabay.com/user/2015/11/27/06-58-54-609_250x250.jpg"
  },
];
