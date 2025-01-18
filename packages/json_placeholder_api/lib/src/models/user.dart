import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

/**
 * User response example
 * {
 *  "id": 1,
 *  "name": "Leanne Graham",
 *  "username": "Bret",
 *  "email": "Sincere@april.biz",
 *  "address": {
 *    "street": "Kulas Light",
 *    "suite": "Apt. 556",
 *    "city": "Gwenborough",
 *    "zipcode": "92998-3874",
 *    "geo": {
 *      "lat": "-37.3159",
 *      "lng": "81.1496"
 *    }
 *  },
 *  "phone": "1-770-736-8031 x56442",
 *  "website": "hildegard.org",
 *  "company": {
 *    "name": "Romaguera-Crona",
 *    "catchPhrase": "Multi-layered client-server neural-net",
 *    "bs": "harness real-time e-markets"
 *  }
 * }
 */
@JsonSerializable()
class User {
  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

class Address {
  const Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json['street'],
        suite: json['suite'],
        city: json['city'],
        zipcode: json['zipcode'],
        geo: Geo.fromJson(json['geo']),
      );
}

class Geo {
  const Geo({
    required this.lat,
    required this.lng,
  });

  final String lat;
  final String lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json['lat'],
        lng: json['lng'],
      );
}

class Company {
  const Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  final String name;
  final String catchPhrase;
  final String bs;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json['name'],
        catchPhrase: json['catchPhrase'],
        bs: json['bs'],
      );
}
