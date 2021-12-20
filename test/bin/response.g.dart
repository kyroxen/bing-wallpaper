// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseObj _$ResponseObjFromJson(Map<String, dynamic> json) => ResponseObj(
      images: Images.fromJson(json['images'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseObjToJson(ResponseObj instance) =>
    <String, dynamic>{
      'images': instance.images.toJson(),
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      image: ImageObj.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'image': instance.image,
    };

ImageObj _$ImageObjFromJson(Map<String, dynamic> json) => ImageObj(
      urlBase: json['urlBase'] as String,
    );

Map<String, dynamic> _$ImageObjToJson(ImageObj instance) => <String, dynamic>{
      'urlBase': instance.urlBase,
    };
