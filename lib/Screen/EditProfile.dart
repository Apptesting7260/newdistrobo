import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pinput/pinput.dart';

import '../GlobaleVarribale/Globalevarribale.dart';
import '../Widgets/Commponent/Commponent.dart';
import '../Widgets/Commponent/GeneralException.dart';
import '../Widgets/MyButton.dart';
import '../Widgets/PasswordTextFilled.dart';
import '../Widgets/TextFilled.dart';
import '../Widgets/appColor.dart';
import '../controllers/AdressUpdateController/AddressUpdateController.dart';
import '../controllers/ChangePaswordController/ChangePasswordController.dart';
import '../controllers/EmailUpdateController.dart';
import '../controllers/ImageUploadController/ImageUploadController.dart';
import '../controllers/NameUpdateController/NameUpdateController.dart';
import '../controllers/PhoneUpdateController/PhoneUpdateController.dart';
import '../controllers/profileController/ProfileDetailsController.dart';
import '../utils/StatusClass.dart';

class EditeMyProfile extends StatefulWidget {
  const EditeMyProfile({super.key});

  @override
  State<EditeMyProfile> createState() => _EditeMyProfileState();
}

class _EditeMyProfileState extends State<EditeMyProfile> {
  ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  AdressUpdateController adressUpdateController =
      Get.put(AdressUpdateController());
  NameUpdateController nameUpdateController = Get.put(NameUpdateController());
  EmailUpdateController emailUpdateController =
      Get.put(EmailUpdateController());
  PhoneUpdateController phoneUpdateController =
      Get.put(PhoneUpdateController());
  ImageUpdateController imageUpdateController=Get.put(ImageUpdateController());
  PassUpdateController PassupdateController =
      Get.put(PassUpdateController());
  final formkey = GlobalKey<FormState>();

  final imgPicker = ImagePicker();
  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Center(
            child: Column(
              children: [

                Text(
                  'Upload Photo',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600,fontSize: 18,color:Colors.black),
                ),
                SizedBox(height: Get.height*0.01,),
                Text(
                  'Please choose image',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12,color: Colors.black),
                ),
              ],
            ),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // GestureDetector(
                  //   child: const Icon(
                  //     Icons.camera_alt_outlined,
                  //     color: Colors.white,
                  //   ),
                  //   onTap: () {
                  //     _pickImage(ImageSource.camera);
                  //   },
                  // ),
                  MyButton(
                    width: Get.width*.3,
                    height: Get.height*.05,
                    bgColor: ColorConstants.appColor,
                    title: "Camera", onTap: () {
                    openCamera(ImageSource.camera);
                    },)
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // GestureDetector(
                  //   child: const Icon(
                  //     Icons.photo_library,
                  //     color: Colors.white,
                  //   ),
                  //   onTap: () {
                  //     _pickImage(ImageSource.gallery);
                  //   },
                  // ),
                  MyButton(
                    width: Get.width*.3,
                    height: Get.height*.05,
                    bgColor: ColorConstants.appColor,
                    title: "Gallery", onTap: () {
                    openCamera(ImageSource.gallery);
                  },)
                ],
              ),
            ],
          ),
        );
      },
    );



  }

  File? compressedFile;
  final imageCropper = ImageCropper();

  Future<void> openCamera(ImageSource source) async {
    var pickedImage = await imgPicker.pickImage(source: source);

    if (pickedImage != null) {
      final croppedImage = await imageCropper.cropImage(
        sourcePath: pickedImage.path,
        aspectRatio: const CropAspectRatio(
            ratioX: 1.5, ratioY: 2), // Adjust aspect ratio as needed
        compressQuality: 50,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
            const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],// Adjust compression quality as needed
      );

      setState(() {
        imgFile = File(croppedImage!.path);
        ImagetoUpload = File(croppedImage!.path);
        print(imgFile);
        imageUpdateController.ImageUpdate(context);
        Get.back();

      });


    }

  }


  @override
  void initState() {
    // TODO: implement initState

    adressUpdateController.setControllerData(context);

    nameUpdateController.setControllerData();
    phoneUpdateController.setControllerData();
    emailUpdateController.setControllerData();
    super.initState();
  }

   final defaultPinTheme = PinTheme(
    width: 50,
    height: 50,
    textStyle: const TextStyle(
        fontSize: 28, fontWeight: FontWeight.w800, color: Colors.green),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.green),
      borderRadius: BorderRadius.circular(50),
    ),
  );
  late final focusedPinTheme= defaultPinTheme.copyDecorationWith(
    border: Border.all(color: Colors.green),
    borderRadius: BorderRadius.circular(50),
  );
  late final submittedPinTheme= defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.white, borderRadius: BorderRadius.circular(50)),
  );

  Widget build(BuildContext context) {





    return SafeArea(
      child: RefreshIndicator(child: Scaffold(
        appBar: AppBar(
            centerTitle: true, // Set this property to true

            title: Text(
              "Profile",
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 20,
                  fontFamily: 'Gilroy-sb',
                  fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  size: 22,
                ))),
        body: Obx(() {
          switch (profileDetailsController.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(
                  child: CircularProgressIndicator(
                    color: ColorConstants.appColor,
                  ));
            case Status.ERROR:
              if (profileDetailsController.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {
                    profileDetailsController.refreshApi();
                  },
                );
              } else {
                return GeneralExceptionWidget(
                  onPress: () {
                    profileDetailsController.refreshApi();
                  },
                );
              }
            case Status.COMPLETED:
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    Container(
                      width: Get.width,
                      height: Get.height * 0.16,
                      decoration: BoxDecoration(color: Color(0xFF53B175)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width * 0.05,
                          ),
                          Stack(
                            children: [
                              Container(
                                width: Get.width * 0.2,
                                height: Get.width * 0.2,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFF2F3F2),
                                  shape: OvalBorder(),
                                ),
                                child: ClipRRect(

                                  borderRadius: BorderRadius.circular(70),
                                  child: profileDetailsController
                                      .profiledetails.value.userDetails![0].profilePicture!="null"?
                                  CachedNetworkImage(

                                    imageUrl:profileDetailsController
                                        .profiledetails.value.userDetails![0].profilePicture,

                                    fit: BoxFit.cover,

                                    placeholder: (context,
                                        url) =>
                                    const Center(
                                        child:
                                        CircularProgressIndicator(
                                          color: ColorConstants
                                              .appColor,
                                        )),
                                    // Optional: Show a loading indicator
                                    errorWidget: (context,
                                        url, error) =>
                                    const Icon(Icons
                                        .error), // Optional: Show an error icon
                                  ): Image.asset(
                                    "assets/images/demoPic.jpg",
                                    fit: BoxFit.cover,

                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 50,
                                  left: 50,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      showOptionsDialog( context);
                                    },
                                    child: Container(
                                      width: Get.width*0.5,
                                      height: Get.height*0.03,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: OvalBorder(),
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 30,
                                        child: Image.asset("assets/images/camera 1.png",height: 15,width: 15,)
                                        ,

                                      ),
                                    ),
                                  ))
                            ],

                          ),

                          SizedBox(
                            width: Get.width * 0.05,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${
                                    profileDetailsController
                                        .profiledetails.value.userDetails![0].userName.toString()
                                } ${
                                    profileDetailsController
                                        .profiledetails.value.userDetails![0].lastName.toString()
                                }",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Gilroy-Bold',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/locationW.png",
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.005,
                                  ),
                                  Text(
                                    profileDetailsController.profiledetails.value
                                        .userDetails![0].userAddress!.address_1==""?
                                    "Update Address":
                                    profileDetailsController.profiledetails.value
                                        .userDetails![0].userAddress!.address_1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Gilroy-Regular',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                      "assets/images/profu.png",
                                    ),
                                    radius: 24,
                                    backgroundColor: Color(0xFFF2F3F2),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.03,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name',
                                        style: TextStyle(
                                          color: Color(0xFF323643),
                                          fontSize: 16,
                                          fontFamily: 'Gilroy-SemiBold',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        "${
                                            profileDetailsController
                                                .profiledetails.value.userDetails![0].userName.toString()
                                        } ${
                                            profileDetailsController
                                                .profiledetails.value.userDetails![0].lastName.toString()
                                        }",
                                        style: TextStyle(
                                          color: Color(0xFF8C8D8C),
                                          fontSize: 14,
                                          fontFamily: 'Gilroy-Regular',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  ShowNamebuttonShett();
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/editeicon.png",
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.03,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.025,
                          ),
                          InkWell(
                            onTap: () {
                              // Get.to(MyOrder());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      child: Image.asset(
                                        'assets/images/contact.png',
                                        height: Get.height * 0.025,
                                        color: ColorConstants.appColor,
                                      ),
                                      radius: 24,
                                      backgroundColor: Color(0xFFF2F3F2),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.03,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Phone Number',
                                          style: TextStyle(
                                            color: Color(0xFF323643),
                                            fontSize: 16,
                                            fontFamily: 'Gilroy-SemiBold',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          profileDetailsController
                                              .profiledetails
                                              .value
                                              .userDetails![0]
                                              .userPhonenumber,
                                          style: TextStyle(
                                            color: Color(0xFF8C8D8C),
                                            fontSize: 14,
                                            fontFamily: 'Gilroy-Regular',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: Get.width * 0.3,
                                ),
                                InkWell(
                                  onTap: () {
                                    ShowNumberbuttonShett();
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/editeicon.png",
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.03,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.025,
                          ),
                          InkWell(
                            onTap: () {
                              // ShowbuttonShett();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                        child: Image.asset(
                                          "assets/images/mail.png",
                                        ),
                                        radius: 24,
                                        backgroundColor: Color(0xFFF2F3F2)),
                                    SizedBox(
                                      width: Get.width * 0.03,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Email ID',
                                          style: TextStyle(
                                            color: Color(0xFF323643),
                                            fontSize: 16,
                                            fontFamily: 'Gilroy-SemiBold',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          profileDetailsController.profiledetails
                                              .value.userDetails![0].userEmail,
                                          style: TextStyle(
                                            color: Color(0xFF8C8D8C),
                                            fontSize: 14,
                                            fontFamily: 'Gilroy-Regular',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    emailUpdateController.OtpSendsucces.value =
                                    false;
                                    ShowEmailbuttonShett();
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/editeicon.png",
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.03,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.025,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    child: Image.asset(
                                      "assets/images/lock.png",
                                      height: Get.height * 0.06,
                                      width: Get.width * 0.06,
                                    ),
                                    radius: 24,
                                    backgroundColor: Color(0xFFF2F3F2),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.025,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Password',
                                        style: TextStyle(
                                          color: Color(0xFF323643),
                                          fontSize: 16,
                                          fontFamily: 'Gilroy-SemiBold',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        'Change Password',
                                        style: TextStyle(
                                          color: Color(0xFF8C8D8C),
                                          fontSize: 14,
                                          fontFamily: 'Gilroy-Regular',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  ShowPasslbuttonShett();
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/editeicon.png",
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.03,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.025,
                          ),
                          InkWell(
                            onTap: () {
                              // ShowbuttonShett();
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                    child: Image.asset(
                                      "assets/images/livelocate.png",
                                    ),
                                    radius: 24,
                                    backgroundColor: Color(0xFFF2F3F2)),
                                SizedBox(
                                  width: Get.width * 0.03,
                                ),
                                Container(
                                  width: Get.width * 0.6,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Address',
                                        style: TextStyle(
                                          color: Color(0xFF323643),
                                          fontSize: 16,
                                          fontFamily: 'Gilroy-SemiBold',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        profileDetailsController.profiledetails.value
                                            .userDetails![0].userAddress!.address_1==""?
                                        "Update Address": profileDetailsController
                                            .profiledetails
                                            .value
                                            .userDetails![0]
                                            .userAddress!
                                            .address_1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        style: TextStyle(
                                          color: Color(0xFF8C8D8C),
                                          fontSize: 14,
                                          fontFamily: 'Gilroy-Regular',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.03,
                                ),
                                InkWell(
                                  onTap: () {
                                    adressUpdateController.setControllerData(context);
                                    ShowbuttonShett();
                                  },
                                  child: Image.asset(
                                    "assets/images/editeicon.png",
                                    height: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.03,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.025,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
          }
        }),
      ), onRefresh: () async{
        profileDetailsController.refreshApi();
      },color: ColorConstants.appColor,),
    );
  }

  ShowbuttonShett() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            height: Get.height * .8,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Obx(() => Form(
                        key: formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Text(
                              'Address',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF181725),
                                fontSize: 26,
                                fontFamily: 'Gilroy-Bold',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Text(
                              'House/Building No',
                              style: TextStyle(
                                color: Color(0xFF181725),
                                fontSize: 18,
                                fontFamily: 'Gilroy-SemiBold',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            TextFilled(
                              controller: adressUpdateController
                                  .HouseNumberController.value,
                              textColor: null,
                              borderColor: ColorConstants.appColor,
                              hintText: 'Enter House/Building No',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your House/Building No';
                                }
                                return null;
                              },
                            ),

                            SizedBox(
                              height: Get.height * 0.03,
                            ),

                            Text(
                              'Street Name',
                              style: TextStyle(
                                color: Color(0xFF181725),
                                fontSize: 18,
                                fontFamily: 'Gilroy-SemiBold',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            TextFilled(
                              controller:
                                  adressUpdateController.streetController.value,
                              textColor: null,
                              borderColor: ColorConstants.appColor,
                              hintText: 'Enter street name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your Street Name';
                                }
                                return null;
                              },
                            ),

                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Text(
                              'Area',
                              style: TextStyle(
                                color: Color(0xFF181725),
                                fontSize: 18,
                                fontFamily: 'Gilroy-SemiBold',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            TextFilled(
                              controller:
                                  adressUpdateController.areaController.value,
                              textColor: null,
                              borderColor: ColorConstants.appColor,
                              hintText: 'Enter your Area',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your Area';
                                }
                                return null;
                              },
                            ),

                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Text(
                              'County',
                              style: TextStyle(
                                color: Color(0xFF181725),
                                fontSize: 18,
                                fontFamily: 'Gilroy-SemiBold',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            TextFilled(
                              controller: adressUpdateController
                                  .countryController.value,
                              textColor: null,
                              borderColor: ColorConstants.appColor,
                              hintText: 'Enter  Country',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your Country';
                                }
                                return null;
                              },
                            ),

                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Text(
                              'State',
                              style: TextStyle(
                                color: Color(0xFF181725),
                                fontSize: 18,
                                fontFamily: 'Gilroy-SemiBold',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            TextFilled(
                              controller:
                                  adressUpdateController.stateController.value,
                              textColor: null,
                              borderColor: ColorConstants.appColor,
                              hintText: 'Enter  State',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your State';
                                }
                                return null;
                              },
                            ),

                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Text(
                              'City',
                              style: TextStyle(
                                color: Color(0xFF181725),
                                fontSize: 18,
                                fontFamily: 'Gilroy-SemiBold',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            TextFilled(
                              controller:
                                  adressUpdateController.cityController.value,
                              textColor: null,
                              borderColor: ColorConstants.appColor,
                              hintText: 'Enter  City',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your City';
                                }
                                return null;
                              },
                            ),

                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Text(
                              'Post Code',
                              style: TextStyle(
                                color: Color(0xFF181725),
                                fontSize: 18,
                                fontFamily: 'Gilroy-SemiBold',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            TextFilled(
                              controller: adressUpdateController
                                  .postcodeController.value,
                              textColor: null,
                              borderColor: ColorConstants.appColor,
                              hintText: 'Enter post code',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your Post Code';
                                }
                                return null;
                              },
                            ),

                            SizedBox(
                              height: Get.height * 0.03,
                            ),

                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyButton(
                                    title: "Submit",
                                    bgColor: ColorConstants.appColor,
                                    width: Get.width * 0.5,
                                    loading: adressUpdateController
                                        .resendVisible.value,
                                    onTap: () {
                                      if (formkey.currentState!.validate()) {
                                        adressUpdateController
                                            .AdresssUpdateHitApi(context);
                                      }

                                      // Get.back();
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ShowNamebuttonShett() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Obx(() => Form(
                        key: formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Text(
                              'Name Update',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF181725),
                                fontSize: 26,
                                fontFamily: 'Gilroy-Bold',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Text(
                              'First Name',
                              style: TextStyle(
                                color: Color(0xFF181725),
                                fontSize: 18,
                                fontFamily: 'Gilroy-SemiBold',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            TextFilled(
                              controller:
                                  nameUpdateController.nameController.value,
                              textColor: null,
                              borderColor: ColorConstants.appColor,
                              hintText: 'Enter First Name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your First Name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Text(
                              'Last Name',
                              style: TextStyle(
                                color: Color(0xFF181725),
                                fontSize: 18,
                                fontFamily: 'Gilroy-SemiBold',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            TextFilled(
                              controller:
                                  nameUpdateController.lastnameController.value,
                              textColor: null,
                              borderColor: ColorConstants.appColor,
                              hintText: 'Enter First Last Name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your Last Name ';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyButton(
                                    title: "Submit",
                                    bgColor: ColorConstants.appColor,
                                    width: Get.width * 0.5,
                                    loading: nameUpdateController
                                        .resendVisible.value,
                                    onTap: () {
                                      if (formkey.currentState!.validate()) {
                                        nameUpdateController.NameUpdate(
                                            context);
                                      }

                                      // Get.back();
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ShowNumberbuttonShett() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Obx(() => Form(
                        key: formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Text(
                              'Phone Number',
                              style: TextStyle(
                                color: Color(0xFF181725),
                                fontSize: 18,
                                fontFamily: 'Gilroy-SemiBold',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            TextFormField(
                              cursorColor: ColorConstants.appColor,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller:
                                  phoneUpdateController.phoneController.value,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10)
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Phone Number";
                                } else if (!_isValidPhoneNumber(value)) {
                                  return "Invalid phone number. Please use a valid phone number format.";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "Enter your Phone Number",
                                  prefixIcon: CountryCodePicker(
                                    padding: EdgeInsets.only(bottom: 1),
                                    onChanged: (element) =>
                                        debugPrint(element.toLongString()),
                                    initialSelection: 'IN',
                                    showCountryOnly: false,
                                    showOnlyCountryWhenClosed: false,
                                    favorite: const [
                                      '+91',
                                      'IN',
                                    ],
                                    showDropDownButton: true,
                                    showFlag: false,
                                  ),
                                  hintStyle: TextStyle(fontFamily: 'Gilroy-rg'),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: BorderSide(
                                          color: ColorConstants.appColor)),
                                  contentPadding: EdgeInsets.all(18),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffBABABA))),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffBABABA))),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA)),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyButton(
                                    title: "Submit",
                                    bgColor: ColorConstants.appColor,
                                    width: Get.width * 0.5,
                                    loading: phoneUpdateController
                                        .resendVisible.value,
                                    onTap: () {
                                      if (formkey.currentState!.validate()) {
                                        phoneUpdateController.PhoneNumberUpdate(
                                            context);
                                      }

                                      // Get.back();
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _isValidPhoneNumber(String value) {
    return RegExp(r'^\d{10}$').hasMatch(value);
  }

  ShowEmailbuttonShett() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Obx(() => Form(
                        key: formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            if (!emailUpdateController.OtpSendsucces.value)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email ',
                                    style: TextStyle(
                                      color: Color(0xFF181725),
                                      fontSize: 18,
                                      fontFamily: 'Gilroy-SemiBold',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                  TextFilled(
                                    controller: emailUpdateController
                                        .emailComtroller.value,
                                    borderColor: ColorConstants.appColor,
                                    textColor: null,
                                    hintText: "Enter Email",
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Enter your email';
                                      } else if (!RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value)) {
                                        return "Please Enter Valid Gmail";
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            if (emailUpdateController.OtpSendsucces.value)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  Text(
                                    'Otp ',
                                    style: TextStyle(
                                      color: Color(0xFF181725),
                                      fontSize: 18,
                                      fontFamily: 'Gilroy-SemiBold',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                  Center(
                                    child: Pinput(
                                      controller: emailUpdateController
                                          .otpController.value,
                                      keyboardType: TextInputType.phone,
                                      validator: (pin) {
                                        if (pin!.isEmpty) {
                                          return 'Enter OTP';
                                        } else if (pin.length < 4) {
                                          return "Please Fill All Input";
                                        } else {
                                          return null;
                                        }
                                      },
                                      length: 4,
                                      defaultPinTheme: defaultPinTheme,
                                      focusedPinTheme: focusedPinTheme,
                                      submittedPinTheme: submittedPinTheme,
                                      pinputAutovalidateMode:
                                          PinputAutovalidateMode.onSubmit,
                                      showCursor: true,
                                      onCompleted: (pin) => print(pin),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      emailUpdateController.ResendEmailSendOtp(context);
                                    },
                                    child: Center(
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "I don't received OTP!",
                                                style: TextStyle(
                                                    color: Color(0xff030303),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14)),
                                            TextSpan(
                                                text: " Resend again",
                                                style: TextStyle(
                                                  color: ColorConstants.appColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ))
                                          ])),
                                    ),
                                  )
                                ],
                              ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyButton(
                                    title: "Submit",
                                    bgColor: ColorConstants.appColor,
                                    width: Get.width * 0.5,
                                    loading:
                                        emailUpdateController.sendOtp.value,
                                    onTap: () {
                                      if (formkey.currentState!.validate()) {
                                        otpverfication();
                                      }

                                      // Get.back();
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  otpverfication() {
    if (emailUpdateController.OtpSendsucces.value) {
      emailUpdateController.VerifyOtp(context);
    } else {
      emailUpdateController.EmailSendOtp(context);
    }
  }

  ShowPasslbuttonShett() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Obx(() => Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Get.height * 0.03,
                        ),

                              Text(
                                'Current Password ',
                                style: TextStyle(
                                  color: Color(0xFF181725),
                                  fontSize: 18,
                                  fontFamily: 'Gilroy-SemiBold',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              PasswordTextFilled(
                                controller: PassupdateController.current_password.value,
                                borderColor: ColorConstants.appColor,
                                textColor: null,
                                hintText: "Enter Current Password",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter your Current Password';
                                  }

                                  return null;
                                },
                              ),


                        SizedBox(
                          height: Get.height * 0.03,
                        ),

                        Text(
                          'New Password ',
                          style: TextStyle(
                            color: Color(0xFF181725),
                            fontSize: 18,
                            fontFamily: 'Gilroy-SemiBold',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        PasswordTextFilled(
                          controller: PassupdateController.new_password.value,
                          borderColor: ColorConstants.appColor,
                          textColor: null,
                          hintText: "Enter new Password",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your Password';
                            }
                            else if (value.length < 8) {
                              return "Password must be at least 8 characters long";
                            }
                            else if (!value.contains(RegExp(r'[A-Z]'))) {
                              return "Password must contain at least one uppercase letter";
                            } else if (!value.contains(RegExp(r'[a-z]'))) {
                              return "Password must contain at least one lowercase letter";
                            } else if (!value.contains(RegExp(r'[0-9]'))) {
                              return "Password must contain at least one digit";
                            } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                              return "Password must contain at least one special character";
                            }
                            return null;
                          },
                        ),


                        SizedBox(
                          height: Get.height * 0.03,
                        ),

                        Text(
                          'Confirm Password ',
                          style: TextStyle(
                            color: Color(0xFF181725),
                            fontSize: 18,
                            fontFamily: 'Gilroy-SemiBold',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        PasswordTextFilled(
                          controller: PassupdateController.confirm_password.value,
                          borderColor: ColorConstants.appColor,
                          textColor: null,
                          hintText: "Enter Confirm Password",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your Confirm Password';
                            }
                            else if ( PassupdateController.new_password.value.text !=
                                PassupdateController.confirm_password.value.text) {
                              // Passwords do not match

                              return "Passwords do not match";
                            }
                            return null;
                          },
                        ),


                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyButton(
                                title: "Submit",
                                bgColor: ColorConstants.appColor,
                                width: Get.width * 0.5,
                                loading:
                                PassupdateController.resendVisible.value,
                                onTap: () {
                                  if (formkey.currentState!.validate()) {
                                    PassupdateController.PassUpdate(context);
                                  }

                                  // Get.back();
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
