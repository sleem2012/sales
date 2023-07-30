class SocialLinksModel {
  String? youTube;
  String? twitter;
  String? website;
  String? whatsApp;
  String? facebook;
  String? linkedin;
  String? snapchat;
  String? instagram;
  String? companyMobile;

  SocialLinksModel(
      {this.youTube, this.twitter, this.website, this.whatsApp, this.facebook, this.linkedin, this.snapchat, this.instagram, this.companyMobile,});

  SocialLinksModel.fromJson(Map<String, dynamic> json) {
    youTube = json['YouTube'];
    twitter = json['twitter'];
    website = json['website'];
    whatsApp = json['WhatsApp'];
    facebook = json['facebook'];
    linkedin = json['linkedin'];
    snapchat = json['snapchat'];
    instagram = json['instagram'];
    companyMobile = json['company_mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['YouTube'] = youTube;
    data['twitter'] = twitter;
    data['website'] = website;
    data['WhatsApp'] = whatsApp;
    data['facebook'] = facebook;
    data['linkedin'] = linkedin;
    data['snapchat'] = snapchat;
    data['instagram'] = instagram;
    data['company_mobile'] = companyMobile;
    return data;
  }
}
