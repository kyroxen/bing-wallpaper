import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseObj {
  final Images images;

  ResponseObj({required this.images});

  factory ResponseObj.fromJson(Map<String, dynamic> json) =>
      _$ResponseObjFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseObjToJson(this);
}

@JsonSerializable()
class Images {
  Images({
    required this.image,
  });

  @JsonKey(name: 'image')
  final ImageObj image;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable()
class ImageObj {
  ImageObj({
    required this.urlBase,
  });

  String urlBase;

  factory ImageObj.fromJson(Map<String, dynamic> json) => _$ImageObjFromJson(json);

  Map<String, dynamic> toJson() => _$ImageObjToJson(this);
}