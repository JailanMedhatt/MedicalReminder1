
class HealthApi {
  HealthApi({
      this.result,});

  HealthApi.fromJson(dynamic json) {
    result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
  }
  Result? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['Result'] = result?.toJson();
    }
    return map;
  }

}
class Result {
  Result({
      this.error, 
      this.total, 
      this.query, 
      this.language, 
      this.resources,});

  Result.fromJson(dynamic json) {
    error = json['Error'];
    total = json['Total'];
    query = json['Query'] != null ? Query.fromJson(json['Query']) : null;
    language = json['Language'];
    resources = json['Resources'] != null ? Resources.fromJson(json['Resources']) : null;
  }
  String? error;
  num? total;
  Query? query;
  String? language;
  Resources? resources;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Error'] = error;
    map['Total'] = total;
    if (query != null) {
      map['Query'] = query?.toJson();
    }
    map['Language'] = language;
    if (resources != null) {
      map['Resources'] = resources?.toJson();
    }
    return map;
  }

}
class Resources {
  Resources({
      this.resource,});

  Resources.fromJson(dynamic json) {
    if (json['Resource'] != null) {
      resource = [];
      json['Resource'].forEach((v) {
        resource?.add(Resource.fromJson(v));
      });
    }
  }
  List<Resource>? resource;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (resource != null) {
      map['Resource'] = resource?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
class Resource {
  Resource({
      this.type, 
      this.id, 
      this.title, 
      this.translationId, 
      this.translationTitle, 
      this.categories, 
      this.populations, 
      this.myHFTitle, 
      this.myHFDescription, 
      this.myHFCategory, 
      this.myHFCategoryHeading, 
      this.lastUpdate, 
      this.imageUrl, 
      this.imageAlt, 
      this.accessibleVersion, 
      this.relatedItems, 
      this.sections, 
      this.moreInfoItems, 
      this.healthfinderLogo, 
      this.healthfinderUrl,});

  Resource.fromJson(dynamic json) {
    type = json['Type'];
    id = json['Id'];
    title = json['Title'];
    translationId = json['TranslationId'];
    translationTitle = json['TranslationTitle'];
    categories = json['Categories'];
    populations = json['Populations'];
    myHFTitle = json['MyHFTitle'];
    myHFDescription = json['MyHFDescription'];
    myHFCategory = json['MyHFCategory'];
    myHFCategoryHeading = json['MyHFCategoryHeading'];
    lastUpdate = json['LastUpdate'];
    imageUrl = json['ImageUrl'];
    imageAlt = json['ImageAlt'];
    accessibleVersion = json['AccessibleVersion'];
    relatedItems = json['RelatedItems'] != null ? RelatedItems.fromJson(json['RelatedItems']) : null;
    sections = json['Sections'] != null ? Sections.fromJson(json['Sections']) : null;
    moreInfoItems = json['MoreInfoItems'];
    healthfinderLogo = json['HealthfinderLogo'];
    healthfinderUrl = json['HealthfinderUrl'];
  }
  String? type;
  String? id;
  String? title;
  String? translationId;
  String? translationTitle;
  String? categories;
  String? populations;
  String? myHFTitle;
  String? myHFDescription;
  String? myHFCategory;
  String? myHFCategoryHeading;
  String? lastUpdate;
  String? imageUrl;
  String? imageAlt;
  String? accessibleVersion;
  RelatedItems? relatedItems;
  Sections? sections;
  dynamic moreInfoItems;
  String? healthfinderLogo;
  String? healthfinderUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Type'] = type;
    map['Id'] = id;
    map['Title'] = title;
    map['TranslationId'] = translationId;
    map['TranslationTitle'] = translationTitle;
    map['Categories'] = categories;
    map['Populations'] = populations;
    map['MyHFTitle'] = myHFTitle;
    map['MyHFDescription'] = myHFDescription;
    map['MyHFCategory'] = myHFCategory;
    map['MyHFCategoryHeading'] = myHFCategoryHeading;
    map['LastUpdate'] = lastUpdate;
    map['ImageUrl'] = imageUrl;
    map['ImageAlt'] = imageAlt;
    map['AccessibleVersion'] = accessibleVersion;
    if (relatedItems != null) {
      map['RelatedItems'] = relatedItems?.toJson();
    }
    if (sections != null) {
      map['Sections'] = sections?.toJson();
    }
    map['MoreInfoItems'] = moreInfoItems;
    map['HealthfinderLogo'] = healthfinderLogo;
    map['HealthfinderUrl'] = healthfinderUrl;
    return map;
  }

}
class Sections {
  Sections({
      this.section,});

  Sections.fromJson(dynamic json) {
    if (json['section'] != null) {
      section = [];
      json['section'].forEach((v) {
        section?.add(Section.fromJson(v));
      });
    }
  }
  List<Section>? section;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (section != null) {
      map['section'] = section?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Title : "The Basics: Overview"
/// Description : ""
/// Content : "<p>Children ages 5 to 10 years need to go to the doctor or nurse for a “well-child visit” once a year.</p>\r\n\r\n<p>A well-child visit is when you take your child to the doctor to make sure they’re healthy and developing normally. This is different from other visits for sickness or injury.</p>\r\n\r\n<p>At a well-child visit, the doctor or nurse can help catch any problems early, when they may be easier to treat. You’ll also have a chance to ask any questions you may have about your child’s behavior or development.</p>\r\n\r\n<p>Learn what to expect so you can make the most of each visit.</p>\r\n"

class Section {
  Section({
      this.title, 
      this.description, 
      this.content,});

  Section.fromJson(dynamic json) {
    title = json['Title'];
    description = json['Description'];
    content = json['Content'];
  }
  String? title;
  String? description;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Title'] = title;
    map['Description'] = description;
    map['Content'] = content;
    return map;
  }

}
class RelatedItems {
  RelatedItems({
      this.relatedItem,});

  RelatedItems.fromJson(dynamic json) {
    if (json['RelatedItem'] != null) {
      relatedItem = [];
      json['RelatedItem'].forEach((v) {
        relatedItem?.add(RelatedItem.fromJson(v));
      });
    }
  }
  List<RelatedItem>? relatedItem;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (relatedItem != null) {
      map['RelatedItem'] = relatedItem?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Type : "Topic"
/// Id : "30542"
/// Title : "Talk to Your Kids About Sex and Healthy Relationships"
/// Url : "https://health.gov/myhealthfinder/healthy-living/sexual-health/talk-your-kids-about-sex-and-healthy-relationships"

class RelatedItem {
  RelatedItem({
      this.type, 
      this.id, 
      this.title, 
      this.url,});

  RelatedItem.fromJson(dynamic json) {
    type = json['Type'];
    id = json['Id'];
    title = json['Title'];
    url = json['Url'];
  }
  String? type;
  String? id;
  String? title;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Type'] = type;
    map['Id'] = id;
    map['Title'] = title;
    map['Url'] = url;
    return map;
  }

}

class Query {
  Query({
      this.apiVersion, 
      this.apiType, 
      this.topicId, 
      this.toolId, 
      this.categoryId, 
      this.populationId, 
      this.keyword, 
      this.who, 
      this.age, 
      this.sex, 
      this.pregnant, 
      this.tobaccoUse, 
      this.sexuallyActive, 
      this.category, 
      this.lang, 
      this.type, 
      this.returnType, 
      this.callback, 
      this.healthfinderPage, 
      this.aPiType,});

  Query.fromJson(dynamic json) {
    apiVersion = json['ApiVersion'];
    apiType = json['ApiType'];
    topicId = json['TopicId'];
    toolId = json['ToolId'];
    categoryId = json['CategoryId'];
    populationId = json['PopulationId'];
    keyword = json['Keyword'];
    who = json['Who'];
    age = json['Age'];
    sex = json['Sex'];
    pregnant = json['Pregnant'];
    tobaccoUse = json['TobaccoUse'];
    sexuallyActive = json['SexuallyActive'];
    category = json['Category'];
    lang = json['Lang'];
    type = json['Type'];
    returnType = json['ReturnType'];
    callback = json['Callback'];
    healthfinderPage = json['HealthfinderPage'];
    aPiType = json['APiType'];
  }
  String? apiVersion;
  String? apiType;
  String? topicId;
  dynamic toolId;
  dynamic categoryId;
  dynamic populationId;
  dynamic keyword;
  dynamic who;
  dynamic age;
  dynamic sex;
  dynamic pregnant;
  dynamic tobaccoUse;
  dynamic sexuallyActive;
  dynamic category;
  String? lang;
  dynamic type;
  String? returnType;
  dynamic callback;
  dynamic healthfinderPage;
  String? aPiType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ApiVersion'] = apiVersion;
    map['ApiType'] = apiType;
    map['TopicId'] = topicId;
    map['ToolId'] = toolId;
    map['CategoryId'] = categoryId;
    map['PopulationId'] = populationId;
    map['Keyword'] = keyword;
    map['Who'] = who;
    map['Age'] = age;
    map['Sex'] = sex;
    map['Pregnant'] = pregnant;
    map['TobaccoUse'] = tobaccoUse;
    map['SexuallyActive'] = sexuallyActive;
    map['Category'] = category;
    map['Lang'] = lang;
    map['Type'] = type;
    map['ReturnType'] = returnType;
    map['Callback'] = callback;
    map['HealthfinderPage'] = healthfinderPage;
    map['APiType'] = aPiType;
    return map;
  }

}