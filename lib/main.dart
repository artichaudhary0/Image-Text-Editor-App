import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'editText/editTextScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () async {
            XFile? image =
                await ImagePicker().pickImage(source: ImageSource.camera);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditTextScreen(
                  selectedImage: image!.path.toString(),
                ),
              ),
            );
          },
          icon: const Icon(Icons.upload_file),
        ),
      ),
    );
  }
}
