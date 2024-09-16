import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praner_blog/widgets/app_dropdown_menu.dart';
import '../../../style/text_style.dart';
import '../../../style/textfiled_style.dart';
import '../../../style/toast_style.dart';
import '../../../utils/colors.dart';
import '../../../utils/input_validation.dart';
import '../../business logic/controllers/add_controller.dart';

class AddBlogScreen extends StatelessWidget {
  AddBlogScreen({super.key});
  final controller = Get.put(BlogPostController());
  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Obx(() {
        return Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Blog Images...
                    Obx(() {
                      return Stack(
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10),
                              image: controller.selectedImage.value != null
                                  ? DecorationImage(
                                      image: FileImage(
                                          controller.selectedImage.value!),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: controller.selectedImage.value == null
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/icon/gallery.png',
                                          height: 50),
                                      Text('Add blog cover image',
                                          style: AppTextStyle2())
                                    ],
                                  )
                                : null,
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: IconButton(
                              icon: Icon(Icons.edit, color: AppColor.secondary),
                              onPressed: () {
                                controller.pickImage();
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: 20),

                    /// Add blog title...
                    Text('Title',
                        style: AppTextStyle1(
                            textColor: Colors.black.withOpacity(0.6),
                            fontSize: 16.0)),
                    SizedBox(height: 5),
                    TextFormField(
                        controller: titleController,
                        maxLines: 2,
                        decoration: appInputDecoration(hinttext: 'Blog Title'),
                        validator: InputValidator.validateTitle),
                    SizedBox(height: 20),

                    /// Add blog description...
                    Text('Description',
                        style: AppTextStyle1(
                            textColor: Colors.black.withOpacity(0.6),
                            fontSize: 16.0)),
                    SizedBox(height: 5),
                    TextFormField(
                        controller: descriptionController,
                        maxLines: 8,
                        decoration:
                            appInputDecoration(hinttext: 'Blog Description'),
                        validator: InputValidator.validateDescription),
                    SizedBox(height: 20),

                    /// Add blog author...
                    Text('Author',
                        style: AppTextStyle1(
                            textColor: Colors.black.withOpacity(0.6),
                            fontSize: 16.0)),
                    SizedBox(height: 5),
                    TextFormField(
                        controller: authorController,
                        decoration: appInputDecoration(hinttext: 'Author'),
                        validator: InputValidator.validateAuthor),
                    SizedBox(height: 20),

                    /// Add blog topics
                    Text('Blog Topics',
                        style: AppTextStyle1(
                            textColor: Colors.black.withOpacity(0.6),
                            fontSize: 16.0)),
                    SizedBox(height: 5),
                    Obx(() => AppDropdownMenu(
                          value: controller.selectedTopic.value.isEmpty
                              ? null
                              : controller.selectedTopic.value,
                          hintText: "Select Topics",
                          icon: Icon(Icons.arrow_drop_down),
                          items: List.generate(controller.topics.length, (i) {
                            return DropdownMenuItem(
                              value: controller.topics[i],
                              child: Text(controller.topics[i]),
                            );
                          }),
                          onChanged: (value) {
                            controller.setTopic(value!);
                          },
                        )),
                    SizedBox(height: 70)
                  ],
                ),
              ),
            ),
            if (controller.isLoading.value)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.secondary,
        child: Icon(
          Icons.upload,
          color: Colors.white,
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            final title = titleController.text;
            final description = descriptionController.text;
            final author = authorController.text;

            if (controller.selectedImage.value == null) {
              errorToast('Please select an image');
              return;
            }
            if (controller.selectedTopic.value.isEmpty) {
              errorToast('Please select a topic');
              return;
            }

            try {
              controller.saveBlogPost(title, description, author).then((_) {
                successToast('Blog post submitted');
                formKey.currentState
                    ?.reset(); // Reset the form after submission
                titleController.clear();
                descriptionController.clear();
                authorController.clear();
                controller.selectedTopic.value = '';
                controller.selectedImage.value = null;
              }).catchError((e) {
                errorToast('Error saving blog post: $e');
              });
            } catch (e) {
              errorToast('Error: $e');
            }
          }
        },
      ),
    );
  }
}
