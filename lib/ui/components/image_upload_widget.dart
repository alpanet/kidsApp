import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageUploadWidget extends StatefulWidget {
  final Function(File) onImageSelected;

  const ImageUploadWidget({super.key, required this.onImageSelected});

  @override
  _ImageUploadWidgetState createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
      widget.onImageSelected(_selectedImage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double containerWidth = screenWidth * 0.6;
    final double containerHeight = screenHeight * 0.12;

    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: _selectedImage == null
            ? const Icon(Icons.add_a_photo, color: Colors.black, size: 40)
            : ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.file(
                  _selectedImage!,
                  fit: BoxFit.cover,
                  width: containerWidth,
                  height: containerHeight,
                ),
              ),
      ),
    );
  }
}
