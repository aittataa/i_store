import 'camera.dart';

class Specs {
  String body;
  String memory;
  String battery;
  String chipset;
  String display;
  String features;
  String platform;
  Camera camera;

  Specs({
    this.body,
    this.memory,
    this.battery,
    this.chipset,
    this.display,
    this.features,
    this.platform,
    this.camera,
  });

  factory Specs.fromJson(Map<String, dynamic> json) {
    return Specs(
      body: json["body"],
      memory: json["memory"],
      battery: json["battery"],
      chipset: json["chipset"],
      display: json["display"],
      features: json["features"],
      platform: json["platform"],
      camera: json['camera'] != null ? Camera.fromJson(json['camera']) : null,
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     "body": body,
  //     "camera": camera.toJson(),
  //     "memory": memory,
  //     "battery": battery,
  //     "chipset": chipset,
  //     "display": display,
  //     "features": features,
  //     "platform": platform,
  //   };
  // }
}
