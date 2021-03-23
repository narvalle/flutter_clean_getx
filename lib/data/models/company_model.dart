import '../../domain/entities/company.dart';

class CompanyModel extends Company {
  CompanyModel({
    String name,
    String catchPhrase,
    String bs,
  }) : super(
          name: name,
          catchPhrase: catchPhrase,
          bs: bs,
        );

  factory CompanyModel.fromJsonMap(Map<String, dynamic> map) => CompanyModel(
        name: map['name'],
        catchPhrase: map['catchPhrase'],
        bs: map['bs'],
      );
}
