class ProfileModel {
  ProfileModel({
     this.userDetails,
  });
 List<UserDetails> ?userDetails;

  ProfileModel.fromJson(Map<String, dynamic> json){
    userDetails = List.from(json['user_details']).map((e)=>UserDetails.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_details'] = userDetails!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class UserDetails {
  UserDetails({
     this.userId,
    this.profilePicture,
     this.userName,
     this.userEmail,
     this.userPassword,
     this.userPhonenumber,
     this.userAddress,
  });
  var userId;
  var profilePicture;
  var userName;
  var userEmail;
  var userPassword;
  var userPhonenumber;
  UserAddress? userAddress;

  UserDetails.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    profilePicture = null;
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPassword = json['user_password'];
    userPhonenumber = json['user_phonenumber'];
    userAddress = UserAddress.fromJson(json['user_address']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['profile_picture'] = profilePicture;
    _data['user_name'] = userName;
    _data['user_email'] = userEmail;
    _data['user_password'] = userPassword;
    _data['user_phonenumber'] = userPhonenumber;
    _data['user_address'] = userAddress!.toJson();
    return _data;
  }
}

class UserAddress {
  UserAddress({
     this.address_1,
     this.city,
     this.state,
     this.postcode,
     this.country,
  });
 var address_1;
 var city;
 var state;
 var postcode;
 var country;

  UserAddress.fromJson(Map<String, dynamic> json){
    address_1 = json['address_1'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address_1'] = address_1;
    _data['city'] = city;
    _data['state'] = state;
    _data['postcode'] = postcode;
    _data['country'] = country;
    return _data;
  }
}