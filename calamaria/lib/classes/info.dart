class Info {
  String heading, icon, data;

  Info(this.heading, this.icon, this.data);

  factory Info.fromJson(dynamic json) {
    return Info(json['heading'] as String, json['icon'] as String,
        json['data'] as String);
  }
}
