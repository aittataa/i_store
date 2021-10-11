
import 'camera.dart';

class Specs {
  final String body;
  final String memory;
  final String battery;
  final String chipset;
  final String display;
  final String features;
  final String platform;
  final Camera camera;

  Specs({
    required this.body,
    required this.memory,
    required this.battery,
    required this.chipset,
    required this.display,
    required this.features,
    required this.platform,
    required this.camera,
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
      camera: Camera.fromJson(json["camera"]),
    );
  }
}
