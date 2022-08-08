class Kurs {
  String? ccy;
  String? ccyNmUZ;
  String? rate;
  String? diff;

  Kurs(
      {
        this.ccy,
        this.ccyNmUZ,
        this.rate,
        this.diff,
        });

  Kurs.fromJson(Map<String, dynamic> json) {
    ccy = json['Ccy'];
    ccyNmUZ = json['CcyNm_UZ'];
    rate = json['Rate'];
    diff = json['Diff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Ccy'] = ccy;
    data['CcyNm_UZ'] = ccyNmUZ;
    data['Rate'] = rate;
    data['Diff'] = diff;
    return data;
  }
}


// class Kurs{
//   final String name;
//   final String fullName;
//   final String rate;
//   final String diff;
//
//   Kurs({required this.fullName, required this.diff, required this.name,required this.rate});
//
//   factory Kurs.fromJson(Map<String, dynamic> json){
//     return Kurs(
//         name: json["Ccy"],
//         fullName: json["CcyNm_UZ"],
//         rate: json["Rate"],
//         diff: json["Diff"]);
//   }
// }