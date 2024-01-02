import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neopop/neopop.dart';
import 'package:status200/constants.dart';
import 'package:status200/controllers/addqcontroller.dart';

import '../../models/question_model.dart';

class AddQuestionDialog extends StatefulWidget {
  AddQuestionDialog({super.key});

  @override
  State<AddQuestionDialog> createState() => _AddQuestionDialogState();
}

class _AddQuestionDialogState extends State<AddQuestionDialog> {
  final AddQuestionController addqcontroller = Get.put(AddQuestionController());
  // TextEditingController _titlecontroller = TextEditingController();

  // TextEditingController _desccontroller = TextEditingController();
  QCategory? selectedCategory;
  File? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  List<QCategory> categories = QCategory.values;

  void _showCategorySelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(categories[index].toString().split('.')[1]),
              onTap: () {
                setState(() {
                  selectedCategory = categories[index];
                  addqcontroller.qcategory = selectedCategory?.toString() ?? '';
                });
                Get.back();
              },
            );
          },
        );
      },
    );
  }

  Future<void> onAsk(File? file) async {
    if (addqcontroller.titlecontroller != null &&
        addqcontroller.desccontroller != null &&
        addqcontroller.qcategory != null) {
      await addqcontroller.addQuestion(file);
      Navigator.pop(context);
    } else {
      Get.snackbar('Error', 'Fill all the *required fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        title: Text('Ask your doubt'),
        content: Column(children: [
          const Text('Add Image:'),
          const SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: _getImage,
            child: Container(
              width: 200,
              height: 100,
              color: Colors.black,
              child: _image != null
                  ? Image.file(
                      _image!,
                      width: 200,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: 200,
                      height: 100,
                      color: Colors.black,
                      child: const Icon(Icons.camera_enhance_rounded,
                          color: Colors.white),
                    ),
            ),
          ),

          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: '*Title',
              border: OutlineInputBorder(),
            ),
            controller: addqcontroller.titlecontroller,
          ),
          const SizedBox(height: 16),
          TextFormField(
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: '*Description',
              border: OutlineInputBorder(),
            ),
            controller: addqcontroller.desccontroller,
          ),
          SizedBox(
            height: 20,
          ),
          // InkWell(
          //   onTap: () => _showCategorySelection(context),
          //   child: Row(
          //     children: [
          //       Text('*Select category'),
          //       Spacer(),
          //       Icon(Icons.arrow_drop_down),
          //     ],
          //   ),
          // )
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => _showCategorySelection(context),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedCategory?.toString().split('.')[1] ??
                            '*Select Category',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              NeoPopTiltedButton(
                decoration: NeoPopTiltedButtonDecoration(
                  showShimmer: true,
                  color: const Color.fromARGB(255, 225, 205, 23),
                ),
                onTapUp: () {
                  onAsk(_image);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 90.0,
                    vertical: 12,
                  ),
                  child: Text(
                    'Ask',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
