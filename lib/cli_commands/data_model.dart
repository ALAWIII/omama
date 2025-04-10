class OChat {
  int id;
  String name;
  String summary;

  OChat({required this.id, required this.name, this.summary = ""});

  factory OChat.fromJson(Map<String, dynamic> json) {
    return OChat(id: json['id'], name: json['name'], summary: json['summary']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'summary': summary};
  }

  static List<OChat> fromListJson(List<dynamic> json) {
    return json.map((c) => OChat.fromJson(c as Map<String, dynamic>)).toList();
  }

  @override
  String toString() => "($id , $name , $summary)";
}

class OMessage {
  int id;
  String message;
  String response;
  OMessage({required this.id, this.message = "", this.response = ""});
  factory OMessage.fromJson(Map<String, dynamic> json) {
    return OMessage(
      id: json['id'],
      message: json['message'],
      response: json['response'],
    );
  }
  static List<OMessage> fromListJson(List<dynamic> json) {
    return json
        .map((c) => OMessage.fromJson(c as Map<String, dynamic>))
        .toList();
  }

  @override
  String toString() => "($id , $message , $response)";
}

class Varient {
  String tokenSize;
  String size;
  Varient({required this.tokenSize, required this.size});
  factory Varient.fromJson(Map<String, dynamic> json) {
    return Varient(tokenSize: json["token_size"], size: json["size"]);
  }
  static fromListJson(List<dynamic> json) {
    return json.map((v) => Varient.fromJson(v)).toList();
  }

  @override
  String toString() {
    return "$tokenSize , $size";
  }
}

class Model {
  String name;
  List<Varient> varients;
  String category;
  String summaryContent;
  String readmeContent;
  Model({
    required this.name,
    required this.varients,
    required this.category,
    required this.summaryContent,
    required this.readmeContent,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      name: json["name"],
      category: json["category"],
      varients: Varient.fromListJson(json["varients"]),
      summaryContent: json["summary_content"],
      readmeContent: json["readme_content"],
    );
  }
  static List<Model> fromListJson(List<dynamic> json) {
    return json.map((m) => Model.fromJson(m)).toList();
  }

  @override
  String toString() {
    return '''
Model:
  Name: $name
  Category: $category
  Summary Content: $summaryContent
  Readme Content: $readmeContent
  Variants:
  ${varients.isEmpty ? "  No variants available" : varients.map((v) => "  - $v").join('\n')}
''';
  }
}
