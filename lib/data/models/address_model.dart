import 'geo_model.dart';
import '../../domain/entities/address.dart';
import '../../domain/entities/geo.dart';

class AddressModel extends Address {
  AddressModel({
    String street,
    String suite,
    String city,
    String zipcode,
    Geo geo,
  }) : super(
          street: street,
          suite: suite,
          city: city,
          zipcode: zipcode,
          geo: geo,
        );

  factory AddressModel.fromJsonMap(Map<String, dynamic> map) => AddressModel(
        street: map['street'],
        suite: map['suite'],
        city: map['city'],
        zipcode: map['zipcode'],
        geo: GeoModel.fromJsonMap(
          map['geo'],
        ),
      );
}
