import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class  Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
//save the result of gallery file
  File galleryFile;

//save the result of camera file
  File cameraFile;

  @override
  Widget build(BuildContext context) {
    //display image selected from gallery
    imageSelectorGallery() async {
      galleryFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      );
      setState(() {});
    }

    //display image selected from camera
    imageSelectorCamera() async {
      cameraFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
        //maxHeight: 50.0,
        //maxWidth: 50.0,
      );
      setState(() {});
    }

    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
        title: Text('Galeria', textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )
        ],
      ),
      body: SingleChildScrollView(
        child:
           Builder(
            builder: (BuildContext context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Divider(),
                  Text('Nova foto', style: TextStyle(fontSize: 18),),
                  Container(
                    margin: EdgeInsets.all(20),
                    height: 80,
                    width: double.infinity,
                    decoration:
                      BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: const BorderRadius.all(const Radius.circular(10)),
                      ),  
                    child:
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: Icon(Icons.photo),
                          iconSize: 50,
                          onPressed: imageSelectorGallery,
                        ),
                        IconButton(
                          icon: Icon(Icons.camera_alt),
                          iconSize: 50,
                          onPressed: imageSelectorCamera,
                        ),
                      ],
                    )
                  ),
                  Divider(),
                  Text('Galeria', style: TextStyle(fontSize: 18),),
                  Container(
                    margin: EdgeInsets.all(15),
                    width: double.infinity,
                    decoration:
                      BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: const BorderRadius.all(const Radius.circular(10)),
                      ),  
                      child:         
                        Column(
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              margin: EdgeInsets.all(10),  
                              child:  
                                displaySelectedFile(cameraFile)                         
                            ),
                        ],
                      )             
                  ),
                ] 
              );
            },
      )
      ),
    )
    );
  }

  Widget displaySelectedFile(File file) {
    return new SizedBox(
      height: 200.0,
      width: 300.0,
      child: file == null
          ? new Text('Você ainda não publicou nenhuma foto', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.orange))
          : new Image.file(file),
    );
  }
}
