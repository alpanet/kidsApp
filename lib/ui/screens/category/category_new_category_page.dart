import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kids_app/theme.dart';
import 'package:kids_app/ui/components/image_upload_widget.dart';
import 'package:kids_app/ui/components/text_input_component.dart';
import 'package:kids_app/ui/components/text_input_icons_component.dart';

@RoutePage()
class CategoryNewCategoryPage extends StatefulWidget {
  const CategoryNewCategoryPage({super.key});

  @override
  State<CategoryNewCategoryPage> createState() =>
      _CategoryNewCategoryPageState();
}

class _CategoryNewCategoryPageState extends State<CategoryNewCategoryPage> {
  File? _uploadedImage;

  final List<TextEditingController> _controllers = [TextEditingController()];

  final TextEditingController _listeAdiController = TextEditingController();

  void _handleImageSelected(File image) {
    setState(() {
      _uploadedImage = image;
    });
  }

  void _addNewInput() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  void _moveInput(int index) {
    setState(() {
      if (index == _controllers.length - 1) {
        final controller = _controllers.removeAt(index);
        _controllers.insert(0, controller);
      } else {
        final controller = _controllers.removeAt(index);
        _controllers.insert(index + 1, controller);
      }
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    _listeAdiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondBackgoundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        context.router.replaceNamed('mainpage');
                      },
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.13),
                      child: Text(
                        'Yeni Kategori',
                        style: AppTheme.generalMenuTitle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    ImageUploadWidget(onImageSelected: _handleImageSelected),
                    const SizedBox(height: 20),
                    if (_uploadedImage != null)
                      Column(
                        children: [
                          const Text(
                            'Yüklenen Resim:',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Image.file(
                            _uploadedImage!,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ],
                      )
                    else
                      const Text(
                        'Henüz bir resim yüklenmedi.',
                        style: TextStyle(fontSize: 16),
                      ),
                    const SizedBox(height: 40),
                    TextInputComponent(
                      label: 'Liste Adı',
                      placeholder: 'Liste Adı',
                      controller: _listeAdiController,
                      isMultiline: false,
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'İçerikler',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                    const Divider(thickness: 3.0),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _controllers.length +
                            1, // Add 1 for the "+" button at the end
                        itemBuilder: (context, index) {
                          if (index < _controllers.length) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: TextInputIconsComponent(
                                placeholder: 'http://example.com',
                                controller: _controllers[index],
                                initialLeadingIcon: Icons.visibility,
                                alternateLeadingIcon: Icons.visibility_off,
                                trailingIcon: Icons.swap_vert,
                                onTrailingIconPressed: () {
                                  _moveInput(index);
                                },
                              ),
                            );
                          } else {
                            return Align(
                              alignment: Alignment.center,
                              child: IconButton(
                                onPressed: _addNewInput,
                                icon: const Icon(
                                  Icons.add,
                                  size: 40,
                                  color: Colors.green,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        print("Kaydet pressed!");
                        print("Liste Adı: ${_listeAdiController.text}");
                        for (var controller in _controllers) {
                          print("Input Value: ${controller.text}");
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 12.0),
                        child: Text(
                          'Kaydet',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
