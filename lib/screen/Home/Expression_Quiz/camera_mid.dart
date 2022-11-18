import 'dart:io';
import 'dart:math';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import './ml/classifier_emotion.dart';
import 'package:logger/logger.dart';
import '../../../constants.dart';
import '../../../theme.dart';
import './quiz_mid.dart';

class camera2 extends StatefulWidget {
  camera2({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _camera2 createState() => _camera2();
}

class _camera2 extends State<camera2> {
  MLService _mlService = MLService();
  //FilePickerService _filePickerService = FilePickerService();
  var logger = Logger();

  File? _image;
  final picker = ImagePicker();

  Image? _imageWidget;
  PickedFile? pickedFile;
  img.Image? fox;
  Uint8List? imageData;
  String? imgsrc;
  var category;
  PickedFile? imagePath;

  var emo_list = ['행복한', '슬픈','무서운','화난'];
  var emo_list2 = ['happy', 'sad','fear','angry'];
  var random = Random().nextInt(4);

  var point = 0;

  @override
  void initState() {
    super.initState();
    // _classifier = ClassifierEmotion();
  }

  Future getImage() async {
    pickedFile = await picker.getImage(source: ImageSource.camera,
      imageQuality: 55,);

    setState(() {
      _image = File(pickedFile!.path);
      _imageWidget = Image.file(_image!);
      imagePath = pickedFile!;
      imageData = _image!.readAsBytesSync();
      _predict();
      _fake();
      // print(this.category);
    });
  }
  Future getImage_v() async {
    pickedFile = await picker.getImage(source: ImageSource.gallery,
      imageQuality: 55,);

    setState(() {
      _image = File(pickedFile!.path);
      _imageWidget = Image.file(_image!);
      imagePath = pickedFile!;
      imageData = _image!.readAsBytesSync();
      _predict();
      _fake();
      // print(this.category);
    });
  }

  void _predict() async {

    var pred = await _mlService.convertEmotionImage(pickedFile!.path);

    setState(() {
      this.category = pred;
    });
  }
  void _fake() async {
    var pred2 = await _mlService.convertdeepfake(pickedFile!.path);
    setState(() {
      this.imgsrc = pred2;
    });
  }

  @override
  Widget build(BuildContext context) {
    String Question = 'Q '+emo_list[random]+' 표정을 지어주세요!';
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 36,
              ),
              Text.rich(
                TextSpan(
                  text: Question,
                  style: textTheme().headline1?.copyWith(
                      color: kSecondaryColor,
                      fontSize: 25,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 36,
              ),
              LoadingImage(imageData),
              SizedBox(
                height: 36,
              ),
              Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width:20),
                    FloatingActionButton(
                      backgroundColor: Colors.blueGrey,
                      onPressed: getImage,
                      tooltip: 'Pick Image',
                      child: Icon(Icons.add_a_photo),
                    ),
                    SizedBox(width:60),
                    FloatingActionButton(
                      backgroundColor: Colors.blueGrey,
                      onPressed: getImage_v,
                      tooltip: 'Pick Image',
                      child: Icon(Icons.photo_library_sharp),
                    ),

                  ]
              )),
              SizedBox(
                height: 25,
              ),
              Answer(category,emo_list2[random])
              ,SizedBox(
                height: 25,
              ),
              ElevatedButton.icon(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 30,
                ),
                onPressed: (){Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => expressLearn2(imgsrc: imgsrc, point: point, answer: random,)),
                );},
                label: Text('다음'),
                style: ElevatedButton.styleFrom(primary: Colors.blueAccent),

              )
            ],
          ),
        )
    );
  }

  Widget LoadingImage(Uint8List? imageData) {
    if (imageData == null) {
      return Center(
        child: Container(
          child: Text(
            '',
            style: TextStyle(
              fontSize: 18,
              color: kSecondaryColor,
            ),
          ),
        ),
      );
    }
    else if (imageData.length == 0) {
      return Center(
        child: Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 5,
            ),
            Text('Loading'),
          ],
        ),
      );
    }
    else {
      return Image.memory(
        imageData,
        fit: BoxFit.fitWidth,
        height: 300,
        width: 300,
      );
    }
  }
  Widget Answer(String? category,String emotion) {
    if (category== null) {
      return Center(
        child: Container(
          child: Text(
            '',
          ),
        ),
      );
    }
    else if (category == emotion) {
      setState(() {
        this.point = 10;
      });
      return Center(
          child: Text.rich(
            TextSpan(
              text: '정답입니다!',
              style: textTheme().headline1?.copyWith(
                  color: kTextColor,fontSize: 30,fontWeight: FontWeight.bold),
            ),
          )
      );
    }
    else {
      return Center(
          child: Text.rich(
            TextSpan(
              text: '오답입니다!',
              style: textTheme().headline1?.copyWith(
                  color: kTextColor,fontSize: 30,fontWeight: FontWeight.bold),
            ),
          )
      );
    }
  }
}