class Info {
  String heading, icon, data;
  int index;

  Info(this.heading, this.icon, this.data, this.index);

  factory Info.fromJson(dynamic json) {
    return Info(json['heading'] as String, json['icon'] as String,
        json['data'] as String, json['index'] as int);
  }

  @override
  String toString() {
    return '{ ${this.heading}, ${this.icon}, ${this.data}, ${this.index} }';
  }
}
