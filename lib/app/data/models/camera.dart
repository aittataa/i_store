class Camera {
  final String? main;
  final String? selfie;
  final String? features;

  Camera({
    this.main,
    this.selfie,
    this.features,
  });

  factory Camera.fromJson(Map<String, dynamic> json) {
    return Camera(
      main: json["main"],
      selfie: json["selfie"],
      features: json["features"],
    );
  }
}
