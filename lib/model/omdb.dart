import 'package:flutteflix/model/search.dart';

class OMDB {
  List<Search> search;
  String totalResults;
  String response;

  OMDB({this.search, this.totalResults, this.response});

  OMDB.fromJson(Map<String, dynamic> json) {
    if (json['Search'] != null) {
      search = new List<Search>();
      json['Search'].forEach((v) {
        search.add(new Search.fromJson(v));
      });
    }
    totalResults = json['totalResults'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.search != null) {
      data['Search'] = this.search.map((v) => v.toJson()).toList();
    }
    data['totalResults'] = this.totalResults;
    data['Response'] = this.response;
    return data;
  }

  OMDB.withError(String errorValue)
      : search = List(),
        response = errorValue,
        totalResults = "0";
}
