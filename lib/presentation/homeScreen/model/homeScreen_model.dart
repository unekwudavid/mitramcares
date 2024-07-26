// To parse this JSON data, do
//
//     final chronicles = chroniclesFromJson(jsonString);

import 'dart:convert';

Chronicles chroniclesFromJson(String str) => Chronicles.fromJson(json.decode(str));

String chroniclesToJson(Chronicles data) => json.encode(data.toJson());

class Chronicles {
    int totalItems;
    int endIndex;
    int startIndex;
    int itemsPerPage;
    List<Item> items;

    Chronicles({
        required this.totalItems,
        required this.endIndex,
        required this.startIndex,
        required this.itemsPerPage,
        required this.items,
    });

    factory Chronicles.fromJson(Map<String, dynamic> json) => Chronicles(
        totalItems: json["totalItems"],
        endIndex: json["endIndex"],
        startIndex: json["startIndex"],
        itemsPerPage: json["itemsPerPage"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "totalItems": totalItems,
        "endIndex": endIndex,
        "startIndex": startIndex,
        "itemsPerPage": itemsPerPage,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    List<dynamic> essay;
    String placeOfPublication;
    int startYear;
    String? publisher;
    List<String> county;
    String? edition;
    String? frequency;
    String url;
    String id;
    List<String> subject;
    List<City> city;
    List<Language> language;
    String title;
    List<HoldingType> holdingType;
    int endYear;
    List<String> altTitle;
    List<String> note;
    String lccn;
    List<String> state;
    List<String> place;
    String country;
    Type type;
    String titleNormal;
    String oclc;

    Item({
        required this.essay,
        required this.placeOfPublication,
        required this.startYear,
        required this.publisher,
        required this.county,
        required this.edition,
        required this.frequency,
        required this.url,
        required this.id,
        required this.subject,
        required this.city,
        required this.language,
        required this.title,
        required this.holdingType,
        required this.endYear,
        required this.altTitle,
        required this.note,
        required this.lccn,
        required this.state,
        required this.place,
        required this.country,
        required this.type,
        required this.titleNormal,
        required this.oclc,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        essay: List<dynamic>.from(json["essay"].map((x) => x)),
        placeOfPublication: json["place_of_publication"],
        startYear: json["start_year"],
        publisher: json["publisher"],
        county: List<String>.from(json["county"].map((x) => x)),
        edition: json["edition"],
        frequency: json["frequency"],
        url: json["url"],
        id: json["id"],
        subject: List<String>.from(json["subject"].map((x) => x)),
        city: List<City>.from(json["city"].map((x) => cityValues.map[x]!)),
        language: List<Language>.from(json["language"].map((x) => languageValues.map[x]!)),
        title: json["title"],
        holdingType: List<HoldingType>.from(json["holding_type"].map((x) => holdingTypeValues.map[x]!)),
        endYear: json["end_year"],
        altTitle: List<String>.from(json["alt_title"].map((x) => x)),
        note: List<String>.from(json["note"].map((x) => x)),
        lccn: json["lccn"],
        state: List<String>.from(json["state"].map((x) => x)),
        place: List<String>.from(json["place"].map((x) => x)),
        country: json["country"],
        type: typeValues.map[json["type"]]!,
        titleNormal: json["title_normal"],
        oclc: json["oclc"],
    );

    Map<String, dynamic> toJson() => {
        "essay": List<dynamic>.from(essay.map((x) => x)),
        "place_of_publication": placeOfPublication,
        "start_year": startYear,
        "publisher": publisher,
        "county": List<dynamic>.from(county.map((x) => x)),
        "edition": edition,
        "frequency": frequency,
        "url": url,
        "id": id,
        "subject": List<dynamic>.from(subject.map((x) => x)),
        "city": List<dynamic>.from(city.map((x) => cityValues.reverse[x])),
        "language": List<dynamic>.from(language.map((x) => languageValues.reverse[x])),
        "title": title,
        "holding_type": List<dynamic>.from(holdingType.map((x) => holdingTypeValues.reverse[x])),
        "end_year": endYear,
        "alt_title": List<dynamic>.from(altTitle.map((x) => x)),
        "note": List<dynamic>.from(note.map((x) => x)),
        "lccn": lccn,
        "state": List<dynamic>.from(state.map((x) => x)),
        "place": List<dynamic>.from(place.map((x) => x)),
        "country": country,
        "type": typeValues.reverse[type],
        "title_normal": titleNormal,
        "oclc": oclc,
    };
}

enum City {
    DETROIT,
    OAKLAND,
    OAKLAND_CITY,
    PITTSBURGH,
    PONTIAC,
    ROCHESTER,
    TOPEKA
}

final cityValues = EnumValues({
    "Detroit": City.DETROIT,
    "Oakland": City.OAKLAND,
    "Oakland City": City.OAKLAND_CITY,
    "Pittsburgh": City.PITTSBURGH,
    "Pontiac": City.PONTIAC,
    "Rochester": City.ROCHESTER,
    "Topeka": City.TOPEKA
});

enum HoldingType {
    MICROFILM_MASTER,
    MICROFILM_PRINT_MASTER,
    MICROFILM_SERVICE_COPY,
    MICROFORM,
    ONLINE_RESOURCE,
    ORIGINAL,
    UNSPECIFIED
}

final holdingTypeValues = EnumValues({
    "Microfilm Master": HoldingType.MICROFILM_MASTER,
    "Microfilm Print Master": HoldingType.MICROFILM_PRINT_MASTER,
    "Microfilm Service Copy": HoldingType.MICROFILM_SERVICE_COPY,
    "Microform": HoldingType.MICROFORM,
    "Online Resource": HoldingType.ONLINE_RESOURCE,
    "Original": HoldingType.ORIGINAL,
    "Unspecified": HoldingType.UNSPECIFIED
});

enum Language {
    CHINESE,
    ENGLISH,
    SPANISH
}

final languageValues = EnumValues({
    "Chinese": Language.CHINESE,
    "English": Language.ENGLISH,
    "Spanish": Language.SPANISH
});

enum Type {
    TITLE
}

final typeValues = EnumValues({
    "title": Type.TITLE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
