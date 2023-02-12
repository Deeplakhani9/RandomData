class Randomdata {
  final String gender;
  final String nametitle;
  final dynamic namefirst;
  final String namelast;

  final int locationstreetnumber;
  final String locationstreetname;
  final String locationcity;
  final String locationstate;
  final String locationcountry;
  final int locationpostcode;

  final String email;
  final String dobdata;
  final int age;
  final String registereddate;
  final int registeredage;
  final String phone;
  final String cell;
  final String picture;

  // final int totalConfirmed;
  Randomdata({
    required this.gender,
    required this.nametitle,
    required this.namefirst,
    required this.namelast,
    required this.locationstreetnumber,
    required this.locationstreetname,
    required this.locationcity,
    required this.locationstate,
    required this.locationcountry,
    required this.locationpostcode,
    required this.email,
    required this.dobdata,
    required this.age,
    required this.registereddate,
    required this.registeredage,
    required this.phone,
    required this.cell,
    required this.picture,

    // required this.totalConfirmed,
  });

  factory Randomdata.fromjson({required Map json}) {
    return Randomdata(
      gender: json["results"][0]["gender"],
      nametitle: json['results'][0]['name']['title'],
      namefirst: json['results'][0]['name']['first'],
      namelast: json['results'][0]['name']['last'],
      locationstreetnumber: json['results'][0]['location']['street']['number'],
      locationstreetname: json['results'][0]['location']['street']['name'],
      locationcity: json['results'][0]['location']['city'],
      locationstate: json['results'][0]['location']['state'],
      locationcountry: json['results'][0]['location']['country'],
      locationpostcode: json['results'][0]['location']['postcode'],
      email: json['results'][0]['email'],
      dobdata: json['results'][0]['dob']['date'],
      age: json['results'][0]['dob']['age'],
      registereddate: json['results'][0]['registered']['date'],
      registeredage: json['results'][0]['registered']['age'],
      phone: json['results'][0]['phone'],
      cell: json['results'][0]['cell'],
      picture: json['results'][0]['picture']['large'],
    );
  }
}
