class Camera {
  String main;
  String selfie;
  String features;

  Camera({
    this.main,
    this.selfie,
    this.features,
  });

  Camera.fromJson(Map<String, dynamic> json) {
    main = json['main'];
    selfie = json['selfie'];
    features = json['features'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['main'] = this.main;
    data['selfie'] = this.selfie;
    data['features'] = this.features;
    return data;
  }
}
