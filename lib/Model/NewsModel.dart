// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  String version;
  String encoding;
  Dashboard dashboard;

  NewsModel({
    required this.version,
    required this.encoding,
    required this.dashboard,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        version: json["version"],
        encoding: json["encoding"],
        dashboard: Dashboard.fromJson(json["dashboard"]),
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "encoding": encoding,
        "dashboard": dashboard.toJson(),
      };
}

class Dashboard {
  List<Category> categories;
  List<Bannerdata> banners;
  List<Bannerdata> trendingNews;
  List<Bannerdata> breakingNews;

  Dashboard({
    required this.categories,
    required this.banners,
    required this.trendingNews,
    required this.breakingNews,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        banners:
            List<Bannerdata>.from(json["banners"].map((x) => Bannerdata.fromJson(x))),
        trendingNews: List<Bannerdata>.from(
            json["trending_news"].map((x) => Bannerdata.fromJson(x))),
        breakingNews: List<Bannerdata>.from(
            json["breaking_news"].map((x) => Bannerdata.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "trending_news":
            List<dynamic>.from(trendingNews.map((x) => x.toJson())),
        "breaking_news":
            List<dynamic>.from(breakingNews.map((x) => x.toJson())),
      };
}

class Bannerdata {
  String id;
  String title;
  String coverImage;
  String related;
  DateTime published;
  String newsViews;
  String category;
  String summary;

  Bannerdata({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.related,
    required this.published,
    required this.newsViews,
    required this.category,
    required this.summary,
  });

  factory Bannerdata.fromJson(Map<String, dynamic> json) => Bannerdata(
        id: json["id"],
        title: json["title"],
        coverImage: json["coverImage"],
        related: json["related"],
        published: DateTime.parse(json["published"]),
        newsViews: json["newsViews"],
        category: json["category"],
        summary: json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "coverImage": coverImage,
        "related": related,
        "published":
            "${published.year.toString().padLeft(4, '0')}-${published.month.toString().padLeft(2, '0')}-${published.day.toString().padLeft(2, '0')}",
        "newsViews": newsViews,
        "category": category,
        "summary": summary,
      };
}

class Category {
  String catId;
  String title;
  String image;
  String count;

  Category({
    required this.catId,
    required this.title,
    required this.image,
    required this.count,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        catId: json["catId"],
        title: json["title"],
        image: json["image"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "catId": catId,
        "title": title,
        "image": image,
        "count": count,
      };
}
