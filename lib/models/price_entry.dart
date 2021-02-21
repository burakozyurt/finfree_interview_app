class PriceEntry {
  int d;
  double c;

  PriceEntry({this.d, this.c});

  PriceEntry.fromJson(Map<String, dynamic> json) {
    d = json['d'];
    c = json['c'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['d'] = this.d;
    data['c'] = this.c;
    return data;
  }
}