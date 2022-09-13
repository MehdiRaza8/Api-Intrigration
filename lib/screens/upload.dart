import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({Key? key}) : super(key: key);

  @override
  State<UploadFile> createState() => _UploadFileState();
}

File? image;
final _picker = ImagePicker();
bool showSpinner = false;
Future getImage() async {
  final pickimage =
      await _picker.pickImage(source: ImageSource.gallery, imageQuality: 88);
  if (pickimage == null) {
    image = File(pickimage!.path);
  } else {
    // ignore: avoid_print
    print('No image selected');
  }
}

Future<void> UploadImage() async {
  setState(() {
    showSpinner = true;
  });
  var stream = new http.ByteStream(image!.openRead());
  stream.cast();

  var length = await image!.length();

  var uri = Uri.parse('https://fakestoreapi.com/products');

  var request = new http.MultipartRequest('POST', uri);

  request.fields['title'] = "Static title";

  var multiport = new http.MultipartFile('image', stream, length);

  request.files.add(multiport);

  var response = await request.send();

  print(response.stream.toString());
  if (response.statusCode == 200) {
    (() {
    setState  showSpinner = false;
    });
    print('image uploaded');
  } else {
    print('failed');
    setState(() {
      showSpinner = false;
    });
  }
}

class _UploadFileState extends State<UploadFile> {
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Upload Image'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: Container(
                child: image == null
                    ? const Center(
                        child: Text('Pick image'),
                      )
                    // ignore: avoid_unnecessary_containers
                    : Container(
                        child: Center(
                          child: Image.file(
                            File(image!.path).absolute,
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            GestureDetector(
              onTap: () {
                UploadImage();
              },
              child: Container(
                height: 50,
                width: 200,
                color: Colors.green,
                child: Center(child: Text('Upload')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
