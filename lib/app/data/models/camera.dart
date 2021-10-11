
class Camera {
  final String main;
  final String selfie;
  final String features;

  Camera({
    required this.main,
    required this.selfie,
    required this.features,
  });

  factory Camera.fromJson(Map<String, dynamic> json) {
    return Camera(
      main: json["main"],
      selfie: json["selfie"],
      features: json["features"],
    );
  }
}
