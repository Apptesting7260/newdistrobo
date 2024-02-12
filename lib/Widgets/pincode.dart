import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class OTPDialog extends StatelessWidget {
  final Function(String) onSubmit;

  OTPDialog({required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    String otp = '';

    return AlertDialog(
      title: Text('Enter OTP'),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PinCodeTextField(
              appContext: context,
              length: 6,
              onChanged: (value) {
                otp = value;
              },
              onCompleted: (value) {
                otp = value;
              },
              textStyle: TextStyle(fontSize: 20.0), // Optional: Adjust text size
              backgroundColor: Colors.transparent, // Optional: Make background transparent
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.circle, // Set circular shape for OTP fields
                borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
                fieldHeight: 40,
                fieldWidth: 40,
                inactiveFillColor: Colors.grey[200]!, // Optional: Customize inactive field color
                activeFillColor: Colors.white, // Optional: Customize active field color
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Validate OTP length
                if (otp.length == 6) {
                  onSubmit(otp);
                  Navigator.pop(context);
                } else {
                  // Show error message if OTP length is incorrect
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter a 6-digit OTP.'),
                    ),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}