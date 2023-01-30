import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

class WearOsScreen extends StatefulWidget {
  const WearOsScreen({super.key});

  @override
  State<WearOsScreen> createState() => _WearOsScreenState();
}

class _WearOsScreenState extends State<WearOsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNumberController = TextEditingController();
  final _secondNumberController = TextEditingController();
  int result = 0;

  void _sum() {
    setState(() {
      result = int.parse(_firstNumberController.text) +
          int.parse(_secondNumberController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WatchShape(
        builder: (BuildContext context, WearShape shape, Widget? child) {
      // var result;
      return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('Addition'),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _firstNumberController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'Enter First Number',
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          controller: _secondNumberController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: 'Enter Second Number',
                              border: OutlineInputBorder())),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            // style: ElevatedButton.styleFrom(
                            //   padding: const EdgeInsets.symmetric(
                            //       horizontal: double.infinity, vertical: 10),
                            // ),
                            onPressed: () {
                              _sum();
                            },
                            child: const Text(
                              'Add',
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('The Total is  $result')
                    ],
                  ),
                )),
          ));
    });
  }
}
