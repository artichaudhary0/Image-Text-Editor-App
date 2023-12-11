
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:template_edit/editText/editTextModel.dart';
import 'package:template_edit/imageText.dart';

class EditTextScreen extends StatefulWidget {
  const EditTextScreen({super.key, required this.selectedImage});

  final String selectedImage;

  @override
  State<EditTextScreen> createState() => _EditTextScreenState();
}

class _EditTextScreenState extends EditImageviewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              _selectedimage,
              for (int i = 0; i < texts.length; i++)
                Positioned(
                  left: texts[i].left,
                  top: texts[i].top,
                  child: GestureDetector(
                    onTap: () => setCurrentIndex(context, i),
                    onLongPress: () {
                      setState(() {
                        currentIndex = i;
                        removeText(context);
                      });
                    },
                    child: Draggable(
                      child: ImageText(
                        textInfo: texts[i],
                      ),
                      feedback: ImageText(
                        textInfo: texts[i],
                      ),
                      onDragEnd: (drag) {
                        final renderBox =
                        context.findRenderObject() as RenderBox;
                        Offset off = renderBox.globalToLocal(drag.offset);
                        setState(() {
                          texts[i].top = off.dy - 96;
                          texts[i].left = off.dx;
                        });
                      },
                    ),
                  ),
                ),
              creatorText.text.isNotEmpty
                  ? Positioned(
                left: 0,
                bottom: 0,
                child: Text(
                  creatorText.text,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(
                      0.3,
                    ),
                  ),
                ),
              )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
      floatingActionButton: _addNewText,
    );
  }

  Widget get _selectedimage => Center(
    child: Image.file(
      File(widget.selectedImage),
      fit: BoxFit.fill,
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.height,
    ),
  );

  Widget get _addNewText => FloatingActionButton(
    onPressed: () => addNewDialog(context),
    backgroundColor: Colors.white,
    tooltip: "Add new text",
    child: const Icon(
      Icons.edit,
    ),
  );

  AppBar get _appbar => AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    title: SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          IconButton(
            onPressed: increaseTextSize,
            icon: const Icon(Icons.add),
            tooltip: "Increase Font Size ",
          ),
          IconButton(
            onPressed: decreaseTextSize,
            icon: const Icon(Icons.remove),
            tooltip: "Decrease Font Size",
          ),
          IconButton(
            onPressed: alignLeftText,
            icon: const Icon(Icons.format_align_left),
            tooltip: "Align Left Text",
          ),
          IconButton(
            onPressed: alignCentreText,
            icon: const Icon(Icons.format_align_center),
            tooltip: "Align Center Text",
          ),
          IconButton(
            onPressed: alignRightText,
            icon: const Icon(Icons.format_align_right),
            tooltip: "Align Right Text",
          ),
          IconButton(
            onPressed: boldText,
            icon: const Icon(Icons.format_bold),
            tooltip: "Bold Text",
          ),
          IconButton(
            onPressed: italicText,
            icon: const Icon(Icons.format_italic),
            tooltip: "Italic Text",
          ),
          IconButton(
            onPressed: addLinesToText,
            icon: const Icon(Icons.space_bar),
            tooltip: "Add New Line",
          ),
          Tooltip(
            message: "Red",
            child: GestureDetector(
              onTap: () => changeTextColor(Colors.red),
              child: const CircleAvatar(
                backgroundColor: Colors.red,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Tooltip(
            message: "Black",
            child: GestureDetector(
              onTap: () => changeTextColor(Colors.black),
              child: const CircleAvatar(
                backgroundColor: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Tooltip(
            message: "White",
            child: GestureDetector(
              onTap: () => changeTextColor(Colors.white),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Tooltip(
            message: "Blue",
            child: GestureDetector(
              onTap: () => changeTextColor(Colors.blue),
              child: const CircleAvatar(
                backgroundColor: Colors.blue,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Tooltip(
            message: "Green",
            child: GestureDetector(
              onTap: () => changeTextColor(Colors.green),
              child: const CircleAvatar(
                backgroundColor: Colors.green,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Tooltip(
            message: "Yellow",
            child: GestureDetector(
              onTap: () => changeTextColor(Colors.yellow),
              child: const CircleAvatar(
                backgroundColor: Colors.yellow,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Tooltip(
            message: "Orange",
            child: GestureDetector(
              onTap: () => changeTextColor(Colors.orange),
              child: const CircleAvatar(
                backgroundColor: Colors.orange,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Tooltip(
            message: "Pink",
            child: GestureDetector(
              onTap: () => changeTextColor(Colors.pink),
              child: const CircleAvatar(
                backgroundColor: Colors.pink,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}




