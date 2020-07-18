// To parse this JSON data, do
//
//     final foodResponse = foodResponseFromJson(jsonString);

import 'dart:convert';

FoodResponse foodResponseFromJson(String str) => FoodResponse.fromJson(json.decode(str));

String foodResponseToJson(FoodResponse data) => json.encode(data.toJson());

class FoodResponse {
    FoodResponse({
        this.results,
        this.offset,
        this.number,
        this.totalResults,
    });

    final List<Food> results;
    final int offset;
    final int number;
    final int totalResults;

    FoodResponse copyWith({
        List<Food> results,
        int offset,
        int number,
        int totalResults,
    }) => 
        FoodResponse(
            results: results ?? this.results,
            offset: offset ?? this.offset,
            number: number ?? this.number,
            totalResults: totalResults ?? this.totalResults,
        );

    factory FoodResponse.fromJson(Map<String, dynamic> json) => FoodResponse(
        results: List<Food>.from(json["results"].map((x) => Food.fromJson(x))),
        offset: json["offset"],
        number: json["number"],
        totalResults: json["totalResults"],
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "offset": offset,
        "number": number,
        "totalResults": totalResults,
    };
}

class Food {
    Food({
        this.id,
        this.title,
        this.image,
        this.imageType,
        this.nutrition,
    });

    final int id;
    final String title;
    final String image;
    final String imageType;
    final List<Nutrition> nutrition;

    Food copyWith({
        int id,
        String title,
        String image,
        String imageType,
        List<Nutrition> nutrition,
    }) => 
        Food(
            id: id ?? this.id,
            title: title ?? this.title,
            image: image ?? this.image,
            imageType: imageType ?? this.imageType,
            nutrition: nutrition ?? this.nutrition,
        );

    factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        imageType: json["imageType"],
        nutrition: List<Nutrition>.from(json["nutrition"].map((x) => Nutrition.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "imageType": imageType,
        "nutrition": List<dynamic>.from(nutrition.map((x) => x.toJson())),
    };
}

class Nutrition {
    Nutrition({
        this.title,
        this.amount,
        this.unit,
    });

    final String title;
    final double amount;
    final String unit;

    Nutrition copyWith({
        String title,
        double amount,
        String unit,
    }) => 
        Nutrition(
            title: title ?? this.title,
            amount: amount ?? this.amount,
            unit: unit ?? this.unit,
        );

    factory Nutrition.fromJson(Map<String, dynamic> json) => Nutrition(
        title: json["title"],
        amount: json["amount"].toDouble(),
        unit: json["unit"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "amount": amount,
        "unit": unit,
    };
}
