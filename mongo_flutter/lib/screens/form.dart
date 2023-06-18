import 'dart:io';

import 'package:e_trade/screens/home_screen.dart';
import 'package:e_trade/utils/api.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, this.id = "Go Back"});
  final String id;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  File? file;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();
                  if (result!.files.single.name.endsWith(".png") ||
                      result.files.single.name.endsWith(".jpg")) {
                    if (result != null) {
                      setState(() {
                        file = File(result.files.single.path.toString());
                      });
                      print(result.files.single.path);
                    }
                  } else {
                    print("Bad Photo");
                    // User canceled the picker
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    "Upload Image",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                child: Text(widget.id)),
            SizedBox(
              width: size.width * 0.4,
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                    hintText: "Enter Title",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: Colors.red)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: Colors.red))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                width: size.width * 0.4,
                child: TextField(
                  controller: desController,
                  decoration: InputDecoration(
                      hintText: "Enter Description",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(color: Colors.red)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(color: Colors.red))),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.4,
              child: TextField(
                controller: priceController,
                decoration: InputDecoration(
                    hintText: "Enter Price",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: Colors.red)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(color: Colors.red))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  if (titleController.text.isEmpty ||
                      desController.text.isEmpty ||
                      priceController.text.isEmpty ||
                      file == null) {
                    print("ERROR");
                    return;
                  }
                  Api().addProducts(
                      titleController.text.trim(),
                      desController.text.trim(),
                      priceController.text.trim(),
                      file);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
