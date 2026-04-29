import 'package:famton/services/database/firestore.dart';
import 'package:flutter/material.dart';
import 'package:famton/components/my_button.dart';
import 'package:famton/pages/delivery_progress_page.dart';
import 'package:provider/provider.dart';
import 'package:famton/models/restaurant.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  // get firestore service
  FirestoreService db = FirestoreService();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  // user wants to pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      // only show dialog if form is valid
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Confirm payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
              Text("Card Number: $cardNumber"),
              Text("Expiry Date: $expiryDate"),
              Text("Card Holder: $cardHolderName"),
              Text("CVV: $cvvCode"),
              ],
            ),
          ),
          actions: [
            // cancel button
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),

            // yes button
            TextButton(
              onPressed: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeliveryProgressPage(),
                  ),
                );
              },
              child: const Text("Yes"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Checkout"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // dummy credit card UI
            Container(
              margin: const EdgeInsets.all(25),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CREDIT CARD",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    cardNumber.isEmpty ? "XXXX XXXX XXXX XXXX" : cardNumber,
                    style: const TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("CARD HOLDER", style: TextStyle(fontSize: 10)),
                          Text(cardHolderName.isEmpty ? "FULL NAME" : cardHolderName),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("EXPIRES", style: TextStyle(fontSize: 10)),
                          Text(expiryDate.isEmpty ? "MM/YY" : expiryDate),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // credit card form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    // card number
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Card Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => setState(() => cardNumber = value),
                      validator: (value) => value!.isEmpty ? "Please enter card number" : null,
                    ),

                    const SizedBox(height: 15),

                    // expiry and cvv
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Expiry Date',
                              hintText: 'MM/YY',
                            ),
                            keyboardType: TextInputType.datetime,
                            onChanged: (value) => setState(() => expiryDate = value),
                            validator: (value) => value!.isEmpty ? "Enter expiry" : null,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'CVV',
                              hintText: 'XXX',
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) => setState(() => cvvCode = value),
                            validator: (value) => value!.isEmpty ? "Enter CVV" : null,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    // card holder name
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Card Holder Name',
                      ),
                      onChanged: (value) => setState(() => cardHolderName = value),
                      validator: (value) => value!.isEmpty ? "Please enter holder name" : null,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            MyButton(
              onTap: userTappedPay,
              text: "Pay now",
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
