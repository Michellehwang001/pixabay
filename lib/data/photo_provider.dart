import 'package:flutter/material.dart';
import 'package:search_image/data/pixabay_api.dart';

class PhotoProvider extends InheritedWidget {
  final PixabayApi api;

  const PhotoProvider({
    Key? key,
    required this.api,
    required Widget child,
  }) : super(key: key, child: child);

  // of 메소드를 통해 PhotoProvider를 어디서든 얻을 수 있게 한다.
  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result = context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PixabayApi found in context');
    // null이 아님을 리턴
    return result!;
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    // 예전 위젯 api 와 현재 api 가 다름
    return oldWidget.api != api;
  }
}
