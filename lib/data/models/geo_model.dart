import '../../domain/entities/geo.dart';
import 'package:flutter/material.dart';

class GeoModel extends Geo {
  GeoModel({
    @required String lat,
    @required String lng,
  }) : super(
          lat: lat,
          lng: lng,
        );

  factory GeoModel.fromJsonMap(Map<String, dynamic> map) => GeoModel(
        lat: map['lat'],
        lng: map['lng'],
      );
}
