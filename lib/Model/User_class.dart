// import 'dart:convert';
//
// List<Employee> employeeFromJson(String str) =>
//     List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));
//
// String employeeToJson(List<Employee>data) =>
//     json.encode(List<dynamic>.from(data.map((x)=> x.toJson())));

class Employee {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  String company;

  Employee(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.address,
        this.phone,
        this.website,
        this.company,
      });

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    phone = json['phone'];
    website = json['website'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['phone'] = this.phone;
    data['website'] = this.website;
    return data;
  }
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode
  });

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['suite'] = this.suite;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
    return data;
  }
}
//
// class Company {
//
//
//   String name;
//   String catchPhrase;
//   String bs;
//
//   Company({
//     this.name,
//     this.catchPhrase,
//     this.bs,
//   });
//
//   factory Company.fromJson(Map<String, dynamic> json) =>
//       Company(
//         name: json["name"],
//         catchPhrase: json["catchPhrase"],
//         bs: json["bs"],
//       );
//
//   Map<String, dynamic> toJson() =>
//       {
//         "name": name,
//         "catchPhrase": catchPhrase,
//         "bs": bs,
//       };
// }
//
//
