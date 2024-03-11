// To parse this JSON data, do
//
//     final RegionPage = RegionPageFromJson(jsonString);

import 'dart:convert';

RegionPage RegionPageFromJson(String str) =>
    RegionPage.fromJson(json.decode(str));

String RegionPageToJson(RegionPage data) => json.encode(data.toJson());

class RegionPage {
  List<Content> content;
  Pageable pageable;
  bool last;
  int totalPages;
  int totalElements;
  bool first;
  int size;
  int number;
  List<dynamic> sort;
  int numberOfElements;
  bool empty;

  RegionPage({
    required this.content,
    required this.pageable,
    required this.last,
    required this.totalPages,
    required this.totalElements,
    required this.first,
    required this.size,
    required this.number,
    required this.sort,
    required this.numberOfElements,
    required this.empty,
  });

  factory RegionPage.fromJson(Map<String, dynamic> json) => RegionPage(
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
        last: json["last"],
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        first: json["first"],
        size: json["size"],
        number: json["number"],
        sort: List<dynamic>.from(json["sort"].map((x) => x)),
        numberOfElements: json["numberOfElements"],
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "pageable": pageable.toJson(),
        "last": last,
        "totalPages": totalPages,
        "totalElements": totalElements,
        "first": first,
        "size": size,
        "number": number,
        "sort": List<dynamic>.from(sort.map((x) => x)),
        "numberOfElements": numberOfElements,
        "empty": empty,
      };
}

class Content {
  int id;
  String name;
  String description;
  String area;
  String gdp;
  String population;

  Content({
    required this.id,
    required this.name,
    required this.description,
    required this.area,
    required this.gdp,
    required this.population,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        area: json["area"],
        gdp: json["gdp"],
        population: json["population"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "area": area,
        "gdp": gdp,
        "population": population,
      };
}

class Pageable {
  int pageNumber;
  int pageSize;
  List<dynamic> sort;
  int offset;
  bool paged;
  bool unpaged;

  Pageable({
    required this.pageNumber,
    required this.pageSize,
    required this.sort,
    required this.offset,
    required this.paged,
    required this.unpaged,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        sort: List<dynamic>.from(json["sort"].map((x) => x)),
        offset: json["offset"],
        paged: json["paged"],
        unpaged: json["unpaged"],
      );

  Map<String, dynamic> toJson() => {
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "sort": List<dynamic>.from(sort.map((x) => x)),
        "offset": offset,
        "paged": paged,
        "unpaged": unpaged,
      };
}
