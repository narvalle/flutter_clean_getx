import 'address_model.dart';
import 'company_model.dart';
import '../../domain/entities/address.dart';
import '../../domain/entities/company.dart';
import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    int id,
    String name,
    String username,
    String email,
    Address address,
    String phone,
    String website,
    Company company,
  }) : super(
          id: id,
          name: name,
          username: username,
          email: email,
          address: address,
          phone: phone,
          website: website,
          company: company,
        );

  factory UserModel.fromJsonMap(Map<String, dynamic> map) => UserModel(
        id: map['id'],
        name: map['name'],
        username: map['username'],
        email: map['email'],
        address: AddressModel.fromJsonMap(
          map['address'],
        ),
        phone: map['phone'],
        website: map['website'],
        company: CompanyModel.fromJsonMap(
          map['company'],
        ),
      );
}
