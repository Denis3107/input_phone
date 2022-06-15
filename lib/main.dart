import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Форма'),
          centerTitle:  true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 30),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Імя',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                ///
                IntlPhoneField(
                  initialCountryCode: 'UA',
                  decoration: const InputDecoration(
                    labelText: 'Номер телефона',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  onChanged: (phone) {
                    log(phone.completeNumber);
                  },
                  onCountryChanged: (country) {
                    log('країна: ' + country.name);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  child: const Text('Submit'),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    _formKey.currentState?.validate();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
