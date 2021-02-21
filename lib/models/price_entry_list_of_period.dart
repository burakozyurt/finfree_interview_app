import 'package:finfree_interview_app/models/price_entry.dart';

class PriceEntryListOfPeriod {
  List<PriceEntry> l1G;
  List<PriceEntry> l1H;
  List<PriceEntry> l1A;
  List<PriceEntry> l3A;
  List<PriceEntry> l1Y;
  List<PriceEntry> l5Y;

  PriceEntryListOfPeriod({this.l1G, this.l1H, this.l1A, this.l3A, this.l1Y, this.l5Y});

  PriceEntryListOfPeriod.fromJson(Map<String, dynamic> json) {
    if (json['1G'] != null) {
      l1G = new List<PriceEntry>();
      json['1G'].forEach((v) {
        l1G.add(new PriceEntry.fromJson(v));
      });
    }
    if (json['1H'] != null) {
      l1H = new List<PriceEntry>();
      json['1H'].forEach((v) {
        l1H.add(new PriceEntry.fromJson(v));
      });
    }
    if (json['1A'] != null) {
      l1A = new List<PriceEntry>();
      json['1A'].forEach((v) {
        l1A.add(new PriceEntry.fromJson(v));
      });
    }
    if (json['3A'] != null) {
      l3A = new List<PriceEntry>();
      json['3A'].forEach((v) {
        l3A.add(new PriceEntry.fromJson(v));
      });
    }
    if (json['1Y'] != null) {
      l1Y = new List<PriceEntry>();
      json['1Y'].forEach((v) {
        l1Y.add(new PriceEntry.fromJson(v));
      });
    }
    if (json['5Y'] != null) {
      l5Y = new List<PriceEntry>();
      json['5Y'].forEach((v) {
        l5Y.add(new PriceEntry.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.l1G != null) {
      data['1G'] = this.l1G.map((v) => v.toJson()).toList();
    }
    if (this.l1H != null) {
      data['1H'] = this.l1H.map((v) => v.toJson()).toList();
    }
    if (this.l1A != null) {
      data['1A'] = this.l1A.map((v) => v.toJson()).toList();
    }
    if (this.l3A != null) {
      data['3A'] = this.l3A.map((v) => v.toJson()).toList();
    }
    if (this.l1Y != null) {
      data['1Y'] = this.l1Y.map((v) => v.toJson()).toList();
    }
    if (this.l5Y != null) {
      data['5Y'] = this.l5Y.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
