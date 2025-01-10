import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kids_app/theme.dart';
import 'package:kids_app/ui/components/button_component.dart';
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
  String? _thumbnailUrl;

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

  String getThumbnailUrl(String url) {
    final youtubeRegex = RegExp(
        r"(https?://)?(www\.)?(youtube\.com|youtu\.be|youtube-nocookie\.com)/(watch\?v=|embed/|v/|.*?v=|)([a-zA-Z0-9_-]{11})");
    final match = youtubeRegex.firstMatch(url);
    if (match != null) {
      final videoId = match.group(5);
      if (videoId != null) {
        return 'https://img.youtube.com/vi/$videoId/0.jpg';
      }
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        context.router.replaceNamed('categoryMainPage');
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
                    ImageUploadWidget(
                      onImageSelected: _handleImageSelected,
                      thumbnailUrl: _uploadedImage is File
                          ? _uploadedImage?.path
                          : _thumbnailUrl,
                    ),
                    const SizedBox(height: 10),
                    TextInputComponent(
                      label: 'Kategori Adı',
                      placeholder: 'Kategori Adı',
                      controller: _listeAdiController,
                      isMultiline: false,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'İçerikler',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                    const Divider(thickness: 3.0),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _controllers.length + 1,
                        itemBuilder: (context, index) {
                          if (index < _controllers.length) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: TextInputIconsComponent(
                                placeholder: 'http://example.com',
                                controller: _controllers[index],
                                initialLeadingIcon: Icons.visibility,
                                alternateLeadingIcon: Icons.visibility_off,
                                trailingIcon: Icons.vertical_align_bottom,
                                onTrailingIconPressed: () {
                                  _moveInput(index);
                                },
                                onChanged: (value) {
                                  final thumbnailUrl = getThumbnailUrl(value);
                                  if (thumbnailUrl.isNotEmpty) {
                                    setState(() {
                                      _thumbnailUrl = thumbnailUrl;
                                    });
                                  } else {
                                    setState(() {
                                      _thumbnailUrl = null;
                                    });
                                  }
                                },
                              ),
                            );
                          } else {
                            return Column(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    onPressed: _addNewInput,
                                    icon: const Icon(
                                      Icons.add,
                                      size: 40,
                                      color: AppTheme.secondBackgoundColor,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    ButtonComponent(
                      text: "Kaydet",
                      onPressed: () {
                        final listName = _listeAdiController.text;
                        final videoList = _controllers.map((controller) {
                          final videoUrl = controller.text;
                          final thumbnailUrl = getThumbnailUrl(videoUrl);

                          return {
                            "id": UniqueKey().toString(),
                            "videoUrl": videoUrl,
                            "videoThumbnailUrl": thumbnailUrl,
                          };
                        }).toList();

                        final jsonData = {
                          "list_name": listName,
                          "videoList": videoList,
                        };
                        print(jsonData);
                      },
                    )
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
