class BaseModel {
  bool? success;
  String? type;
  String? url;

  BaseModel({this.success, this.type, this.url});

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
        success: json['success']?.toString().contains("true"),
        type: json['type']?.toString(),
        url: json['url']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (success != null) 'success': success,
        if (type != null) 'type': type,
        if (url != null) 'url': url,
      };
}
