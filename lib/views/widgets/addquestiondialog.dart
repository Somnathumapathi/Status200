import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../models/question_model.dart';

class AddQuestionDialog extends StatelessWidget {
  AddQuestionDialog({super.key});
  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _desccontroller = TextEditingController();
  List<QCategory> categories = QCategory.values;

  void _showCategorySelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(categories[index]
                  .toString()
                  .split('.')[1]), // Display category name
              onTap: () {},
            );
          },
        );
      },
    );
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
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 200,
              height: 100,
              color: Colors.black,
              child:
                  const Icon(Icons.camera_enhance_rounded, color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: '*Title',
              border: OutlineInputBorder(),
            ),
            controller: _titlecontroller,
          ),
          const SizedBox(height: 16),
          TextFormField(
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: '*Description',
              border: OutlineInputBorder(),
            ),
            controller: _desccontroller,
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
              Text('*Select category:'),
              DropdownButton<String>(
                // value: controller.selectedCategory.value,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    // controller.selectCategory(newValue);
                  }
                },
                items: categories
                    .map<DropdownMenuItem<String>>((QCategory category) {
                  return DropdownMenuItem<String>(
                    value: category.toString(),
                    child: Text(category.toString().split('.')[1]),
                  );
                }).toList(),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
