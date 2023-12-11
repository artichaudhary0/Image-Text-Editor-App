import 'package:flutter/material.dart';
import 'package:template_edit/textInfoModel.dart';
import 'package:template_edit/widgets/default_button.dart';

import 'editTextScreen.dart';

abstract class EditImageviewModel extends State<EditTextScreen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController creatorText = TextEditingController();
  int currentIndex = 0;
  List<TextInfo> texts = [];
  removeText(BuildContext context) {
    setState(() {
      texts.removeAt(currentIndex);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Deleted",
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  setCurrentIndex(BuildContext context, index) {
    setState(() {
      currentIndex = index;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Selected for styling",
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  changeTextColor(Color color) {
    setState(() {
      texts[currentIndex].color = color;
    });
  }

  increaseTextSize() {
    setState(() {
      texts[currentIndex].fontSize += 2;
    });
  }

  decreaseTextSize() {
    setState(() {
      texts[currentIndex].fontSize -= 2;
    });
  }

  alignLeftText() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.left;
    });
  }

  alignRightText() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.right;
    });
  }

  alignCentreText() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.center;
    });
  }

  boldText() {
    setState(() {
      if (texts[currentIndex].fontWeight == FontWeight.bold) {
        texts[currentIndex].fontWeight = FontWeight.normal;
      } else {
        texts[currentIndex].fontWeight = FontWeight.bold;
      }
    });
  }

  italicText() {
    setState(() {
      if (texts[currentIndex].fontStyle == FontStyle.italic) {
        texts[currentIndex].fontStyle = FontStyle.normal;
      } else {
        texts[currentIndex].fontStyle = FontStyle.italic;
      }
    });
  }

  addLinesToText() {
    setState(() {
      if (texts[currentIndex].text.contains("\n")) {
        texts[currentIndex].text =
            texts[currentIndex].text.replaceAll("\n", " ");
      } else {
        texts[currentIndex].text =
            texts[currentIndex].text.replaceAll(" ", "\n");
      }
    });
  }

  addNewText(BuildContext context) {
    setState(() {
      texts.add(
        TextInfo(
          text: textEditingController.text,
          left: 0,
          top: 0,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          fontSize: 20,
          textAlign: TextAlign.left,
        ),
      );
      Navigator.of(context).pop();
    });
  }

  addNewDialog(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add New Text"),
        content: TextField(
          controller: textEditingController,
          maxLines: 5,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.edit),
            filled: true,
            hintText: "Enter your text Here",
          ),
        ),
        actions: <Widget>[
          DefaultButton(
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.white10,
            textColor: Colors.black,
            child: const Text("Back"),
          ),
          DefaultButton(
            onPressed: () => addNewText(context),
            color: Colors.red,
            textColor: Colors.white,
            child: const Text("Add Text"),
          ),
        ],
      ),
    );
  }
}
