import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo extends Equatable{
  final int id;
  final String tags;
  @JsonKey(name: 'previewURL')
  final String previewUrl;
  @JsonKey(name: 'webformatURL')
  final String webformatUrl;

  const Photo({
    required this.id,
    required this.tags,
    required this.previewUrl,
    required this.webformatUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}