import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class KhaltiPaymentScreen extends StatefulWidget {
  const KhaltiPaymentScreen({super.key});

  @override
  State<KhaltiPaymentScreen> createState() => _KhaltiPaymentScreenState();
}

class _KhaltiPaymentScreenState extends State<KhaltiPaymentScreen> {
  final _amountController = TextEditingController();
  getAmt() {
    return int.parse(_amountController.text) * 100; // Converting to paisa
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              const SizedBox(height: 15),
              // For Amount
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Enter Amount to pay",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    )),
              ),
              const SizedBox(
                height: 8,
              ),
              // For Button
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.red)),
                  height: 50,
                  color: const Color(0xFF56328c),
                  child: const Text(
                    'Pay With Khalti',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  onPressed: () {
                    KhaltiScope.of(context).pay(
                      config: PaymentConfig(
                        amount: getAmt(),
                        productIdentity: 'dells-sssssg5-g5510-2021',
                        productName: 'Product Name',
                      ),
                      preferences: [
                        PaymentPreference.khalti,
                      ],
                      onSuccess: (su) {
                        const successsnackBar = SnackBar(
                          content: Text('Payment Successful'),
                        );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(successsnackBar);
                      },
                      onFailure: (fa) {
                        const failedsnackBar = SnackBar(
                          content: Text('Payment Failed'),
                        );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(failedsnackBar);
                      },
                      onCancel: () {
                        const cancelsnackBar = SnackBar(
                          content: Text('Payment Cancelled'),
                        );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(cancelsnackBar);
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
