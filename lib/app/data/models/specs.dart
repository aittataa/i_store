import 'camera.dart';

class Specs {
  final String? body;
  final String? memory;
  final String? battery;
  final String? chipset;
  final String? display;
  final String? features;
  final String? platform;
  final Camera? camera;

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
      camera: json["camera"] == null ? Camera() : Camera.fromJson(json["camera"]),
    );
  }
}
