import 'geo.dart';
import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  @override
  List<Object> get props => [
        street,
        suite,
        city,
        zipcode,
        geo,
      ];
}
