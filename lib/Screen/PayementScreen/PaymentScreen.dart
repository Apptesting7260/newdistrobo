import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:newdistrobo/Widgets/MyButton.dart';
import 'package:newdistrobo/Widgets/appColor.dart';

import '../../controllers/CartDetailsDeleteApi/CartDetailsDeletecontroller.dart';
import '../../controllers/OrderController.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController data = TextEditingController();
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Payment"),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 20, left: 20, top: 20),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              CreditCardWidget(
                enableFloatingCard: true,
                cardNumber: orderController.cardNumber.value,
                expiryDate: orderController.expireDate.value,
                cardHolderName: orderController.holderName.value,
                cvvCode: orderController.cvvNumber.value,
                bankName: 'Card',
                frontCardBorder: Border.all(color: Colors.green),
                backCardBorder: Border.all(color: Colors.grey),
                showBackView: false,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                cardBgColor: Colors.black,
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                customCardTypeIcons: <CustomCardTypeIcon>[
                  CustomCardTypeIcon(
                    cardType: CardType.mastercard,
                    cardImage: Image.asset(
                      'assets/aapIcon/mastercard.png',
                      height: 48,
                      width: 48,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      CreditCardForm(
                        formKey: formKey,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumber: orderController.cardNumber.value,
                        cvvCode: orderController.cvvNumber.value,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        cardHolderName: orderController.holderName.value,
                        expiryDate: orderController.expireDate.value,
                        inputConfiguration: const InputConfiguration(
                          cardNumberDecoration: InputDecoration(
                              labelText: 'Number',
                              hintText: 'XXXX XXXX XXXX XXXX',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(
                                      color: ColorConstants.appColor)),
                              hintStyle: TextStyle(
                                fontSize: 16,
                              ),
                              contentPadding: EdgeInsets.all(18),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA))),
                              errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              filled: true,
                              fillColor: Colors.white),
                          expiryDateDecoration: InputDecoration(
                              labelText: 'Expired Date',
                              hintText: 'XX/XX',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(
                                      color: ColorConstants.appColor)),
                              hintStyle: TextStyle(
                                fontSize: 16,
                              ),
                              contentPadding: EdgeInsets.all(18),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA))),
                              errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              filled: true,
                              fillColor: Colors.white),
                          cvvCodeDecoration: InputDecoration(
                              labelText: 'CVV',
                              hintText: 'XXX',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(
                                      color: ColorConstants.appColor)),
                              hintStyle: TextStyle(
                                fontSize: 16,
                              ),
                              contentPadding: EdgeInsets.all(18),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA))),
                              errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              filled: true,
                              fillColor: Colors.white),
                          cardHolderDecoration: InputDecoration(
                              labelText: 'Card Holder',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(
                                      color: ColorConstants.appColor)),
                              hintStyle: TextStyle(
                                fontSize: 16,
                              ),
                              contentPadding: EdgeInsets.all(18),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA))),
                              errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              filled: true,
                              fillColor: Colors.white),
                        ),
                        onCreditCardModelChange: onCreditCardModelChange,
                        // onCreditCardModelChange: onCreditCardModelChange,
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 20),
                      MyButton(
                        title: "Save",
                        bgColor: ColorConstants.appColor,
                        loading:orderController.loaddin.value ,
                        onTap: () {
                          print("orderController.expireDateController.value.text");
                          _onValidate();
                          print(orderController.expireDate.value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    ));
  }
  void _onValidate() {
    if (formKey.currentState?.validate() ?? false) {
      print('valid!');
      orderController.createStripeToken(context);
    } else {
      print('invalid!');
    }
  }


  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      orderController.cardNumber.value =
          creditCardModel.cardNumber;
      orderController.cvvNumber.value =
          creditCardModel.cvvCode;
      orderController.holderName.value =
          creditCardModel.cardHolderName;
      orderController.expireDate.value =
          creditCardModel.expiryDate;
    });
  }
}
