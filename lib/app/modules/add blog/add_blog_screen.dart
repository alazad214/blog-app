import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praner_blog/app/modules/main/main_screen.dart';
import 'package:praner_blog/widgets/app_button.dart';
import 'package:praner_blog/widgets/app_dropdown_menu.dart';
import '../../../style/text_style.dart';
import '../../../style/textfiled_style.dart';
import '../../../style/toast_style.dart';
import '../../../utils/colors.dart';
import '../../../utils/input_validation.dart';
import '../../logic/controllers/add_controller.dart';

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
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.offAll(() => MainScreen());
            },
            icon: Icon(Icons.arrow_back_rounded)),
        title: Text(
          "Add blog",
          style: AppTextStyle2(),
        ),
      ),
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
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10),
                              image: controller.selectedImage.value != null
                                  ? DecorationImage(
                                      image: FileImage(
                                          controller.selectedImage.value!),
                                      fit: BoxFit.contain,
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
                        maxLines: 5,
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
                    Obx(() {
                      if (controller.topics.isEmpty) {
                        return Text("Loading categories...");
                      }
                      return AppDropdownMenu(
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
                      );
                    }),
                    SizedBox(height: 30),
                    AppButton(
                      text: 'Post Now',
                      onTap: () {
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
                            controller
                                .saveBlogPost(title, description, author)
                                .then((_) {
                              successToast('Blog post submitted');
                              formKey.currentState?.reset();
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
                    )
                  ],
                ),
              ),
            ),
            if (controller.isLoading.value)
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black54,
                child: Center(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Uploading...',
                              style: AppTextStyle2(textColor: Colors.white)),
                          SizedBox(height: 15),
                          CircularProgressIndicator(color: AppColor.secondary)
                        ],
                      )),
                ),
              )
          ],
        );
      }),
    );
  }
}
