class AboutUsModel {
  AboutUsModel({
     this.aboutBannerTitle,
     this.aboutBannerImage,
     this.aboutBannerBackgroundImage,
     this.aboutTitle,
     this.aboutContent,
     this.aboutUsContactDetails,
     this.aboutBelowContent,
  });
  var aboutBannerTitle;
  var aboutBannerImage;
  var aboutBannerBackgroundImage;
  var aboutTitle;
  var aboutContent;
   List<AboutUsContactDetails>? aboutUsContactDetails;
  var aboutBelowContent;

  AboutUsModel.fromJson(Map<String, dynamic> json){
    aboutBannerTitle = json['about_banner_title'];
    aboutBannerImage = json['about_banner_image'];
    aboutBannerBackgroundImage = json['about_banner_background_image'];
    aboutTitle = json['about_title'];
    aboutContent = json['about_content'];
    aboutUsContactDetails = List.from(json['about_us_contact_details']).map((e)=>AboutUsContactDetails.fromJson(e)).toList();
    aboutBelowContent = json['about_below_content'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['about_banner_title'] = aboutBannerTitle;
    _data['about_banner_image'] = aboutBannerImage;
    _data['about_banner_background_image'] = aboutBannerBackgroundImage;
    _data['about_title'] = aboutTitle;
    _data['about_content'] = aboutContent;
    _data['about_us_contact_details'] = aboutUsContactDetails!.map((e)=>e.toJson()).toList();
    _data['about_below_content'] = aboutBelowContent;
    return _data;
  }
}

class AboutUsContactDetails {
  AboutUsContactDetails({
     this.icon,
     this.title,
  });
  var icon;
  var title;

  AboutUsContactDetails.fromJson(Map<String, dynamic> json){
    icon = json['icon'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['icon'] = icon;
    _data['title'] = title;
    return _data;
  }
}