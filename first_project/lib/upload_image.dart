import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class upload_image extends StatefulWidget {
  const upload_image({super.key});

  @override
  State<upload_image> createState() => _upload_imageState();
}

// ignore: camel_case_types
class _upload_imageState extends State<upload_image> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future Imagepick() async {
    final pickfile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 60,
    );
    if (pickfile != null) {
      image = File(pickfile.path);
      setState(() {});
    } else {
      print("No Image Selected");
    }
  }

  Future<void> Upload() async {
    setState(() {
      showSpinner = true;
    });

    var stream = http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image!.length();
    var url = Uri.parse("http://fakestoreapi.com/products");
    var request = http.MultipartRequest("POST", url);
    request.fields['title'] = 'Static Title';
    var multiport = http.MultipartFile("image", stream, length);

    request.files.add(multiport);
    var response = await request.send();

    setState(() {
      showSpinner = false;
    });

    if (response.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print("Failed to upload image Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Upload Image Here"),
          backgroundColor: Colors.purple,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            // ✅ This gives bounded height to Column
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Imagepick();
                  },
                  child: Container(
                    child:
                        image == null
                            ? Center(child: Text("Pick Image"))
                            : SizedBox(
                              height: 150,
                              width: 150,
                              child: Image.file(File(image!.path).absolute),
                            ),
                  ),
                ),
                SizedBox(height: 150),
                GestureDetector(
                  onTap: () {
                    Upload();
                  },
                  child: Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.purple,
                    ),
                    child: Center(
                      child: Text(
                        "Click here",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
