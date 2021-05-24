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

  Specs.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    memory = json['memory'];
    battery = json['battery'];
    chipset = json['chipset'];
    display = json['display'];
    features = json['features'];
    platform = json['platform'];
    camera = json['camera'] != null ? new Camera.fromJson(json['camera']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['memory'] = this.memory;
    data['battery'] = this.battery;
    data['chipset'] = this.chipset;
    data['display'] = this.display;
    data['features'] = this.features;
    data['platform'] = this.platform;
    if (this.camera != null) {
      data['camera'] = this.camera.toJson();
    }
    return data;
  }
}
