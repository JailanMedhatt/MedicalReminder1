
class ApiOfHealth {
  ApiOfHealth({
      this.glossary,});

  ApiOfHealth.fromJson(dynamic json) {
    if (json['glossary'] != null) {
      glossary = [];
      json['glossary'].forEach((v) {
        glossary?.add(Glossary.fromJson(v));
      });
    }
  }
  List<Glossary>? glossary;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (glossary != null) {
      map['glossary'] = glossary?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// date : "2018-10-23 00:00:00 +0000"
/// url : "/glossary/abortion-services"
/// content : "<p>Federal law prohibits federal funds, including Marketplace premium tax credits, from being used for abortion services except in the limited cases of rape, incest, or if a woman suffers from a life-threatening physical injury or illness that would place the woman in danger of death unless an abortion is performed. Marketplace health plans may cover abortion services in different ways:</p>"
/// tags : ["glossary"]
/// title : "Abortion services"
/// categories : ["glossary"]
/// lang : "en"
/// layout : "glossary-word"

class Glossary {
  Glossary({
      this.date, 
      this.url, 
      this.content, 
      this.tags, 
      this.title, 
      this.categories, 
      this.lang, 
      this.layout,});

  Glossary.fromJson(dynamic json) {
    date = json['date'];
    url = json['url'];
    content = json['content'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    title = json['title'];
    categories = json['categories'] != null ? json['categories'].cast<String>() : [];
    lang = json['lang'];
    layout = json['layout'];
  }
  String? date;
  String? url;
  String? content;
  List<String>? tags;
  String? title;
  List<String>? categories;
  String? lang;
  String? layout;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['url'] = url;
    map['content'] = content;
    map['tags'] = tags;
    map['title'] = title;
    map['categories'] = categories;
    map['lang'] = lang;
    map['layout'] = layout;
    return map;
  }

}