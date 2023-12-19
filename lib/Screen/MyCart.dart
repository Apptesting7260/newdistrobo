import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/Widgets/MyButton.dart';
import 'package:newdistrobo/Widgets/appColor.dart';

import 'ScheduleDelivery.dart';

class MyCart extends StatefulWidget {
  const MyCart({
    super.key,
  });

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.02,
          ),
          Row(
            children: [
              SizedBox(
                width: Get.width * 0.02,
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  size: 22,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.26,
                  ),
                  Text(
                    "MY Cart",
                    style: TextStyle(
                        color: Color.fromRGBO(16, 24, 17, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Gilroy-sb'),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.25,
                  ),
                  IconButton(
                    onPressed: () {
                      // Show the alert dialog when the IconButton is pressed
                      // deleteShowAlert();
                    },
                    icon: Image.asset(
                      "assets/images/delete.png",
                      height: Get.height * 0.06,
                      width: Get.width * 0.06,
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Subtotal: \$456.8",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Gilroy'),
                    ),
                    Text(
                      "2 items",
                      style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Gilroy-sb'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          MyButton(
            title: "Schedule Delivery",
            bgColor: ColorConstants.appColor,
            width: Get.width * 0.9,
            onTap: () {
              Get.to(ScheduleDelivery());
            },
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  // Parse price as double

                  // counter3=myCartController.myCartData.value.items![index].quantity!.value!;
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 165,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        border: Border.all(color: Colors.grey, width: 0.5),
                      ),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius:
                                            BorderRadius.circular(23)),
                                    height: 130,
                                    width: 120,
                                    child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              "https://freepngimg.com/thumb/grocery/53982-2-grocery-png-image-high-quality-thumb.png",
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons
                                                  .error), // Customize the error widget as needed.
                                        ))),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 18),
                                  Row(
                                    children: [
                                      Container(
                                        width: Get.width * 0.39,
                                        child: Text(
                                          "Alien Jerky Weed killer hot beff ",
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              //overflow: TextOverflow.ellipsis,
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Gilroy-sb'),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Image.asset(
                                            'assets/images/delete.png',
                                            width: Get.width * 0.05,
                                            height: Get.height * 0.05,
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "\$45",
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Gilroy-sb'),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.10,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: Get.height * 0.05,
                                          width: Get.width * 0.1,
                                          decoration: BoxDecoration(
                                              color: ColorConstants.appColor,
                                              border: Border.all(
                                                  color:
                                                      ColorConstants.appColor,
                                                  width: 0.2,
                                                  style: BorderStyle.solid),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Center(
                                              child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          )),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Center(
                                          child: Text(
                                        "2",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Gilroy'),
                                      )),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: Get.height * 0.05,
                                          width: Get.width * 0.1,
                                          decoration: BoxDecoration(
                                              color: ColorConstants.appColor,
                                              border: Border.all(
                                                  color:
                                                      ColorConstants.appColor,
                                                  width: 0.2,
                                                  style: BorderStyle.solid),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Center(
                                              child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          )),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      )),
    );
  }

  deleteShowAlert() {
    showDialog(
      context: context,
      // You can access the BuildContext if you're inside a widget that has access to it
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            ElevatedButton(
              child: Text('Delete'),
              onPressed: () async {
                // myCartController.rxRequestStatus.value = Status.LOADING;
              },
            ),
          ],
        );
      },
    );
  }
}
