class Camera {
  String main;
  String selfie;
  String features;

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

  Map<String, dynamic> toJson() {
    return {
      "main": main,
      "selfie": selfie,
      "features": features,
    };
  }
}
