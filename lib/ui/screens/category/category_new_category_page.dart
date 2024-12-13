import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kids_app/theme.dart';
import 'package:kids_app/ui/components/image_upload_widget.dart';

@RoutePage()
class CategoryNewCategoryPage extends StatefulWidget {
  const CategoryNewCategoryPage({super.key});

  @override
  State<CategoryNewCategoryPage> createState() =>
      _CategoryNewCategoryPageState();
}

class _CategoryNewCategoryPageState extends State<CategoryNewCategoryPage> {
  File? _uploadedImage;

  void _handleImageSelected(File image) {
    setState(() {
      _uploadedImage = image;
    });
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
                width: double
                    .infinity, // Ensures the container spans the full width
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
