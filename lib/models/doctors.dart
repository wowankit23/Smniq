class Doctors {
  final String name;
  final String spec;
  final String loc;
  final bool isPinned;

  Doctors({this.name, this.spec, this.loc, this.isPinned});

  factory Doctors.fromJson(Map<String, dynamic> json) {
    return new Doctors(
      name: json['name'] as String,
      spec: json['spec'] as String,
      loc: json['loc'] as String,
      isPinned: json['isPinned'] as bool,
    );
  }
}
