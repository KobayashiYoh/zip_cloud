import 'package:flutter/material.dart';
import 'package:zip_cloud/zipcloud_repository.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _zipcodeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _zipcodeController,
                decoration: const InputDecoration(
                  label: Text('郵便番号'),
                ),
                onChanged: (text) async {
                  if (text.length >= 7) {
                    final String address =
                        await ZipcloudRepository.fetchAddress(text);
                    setState(() {
                      _addressController.text = address;
                    });
                  }
                },
              ),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  label: Text('住所'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
