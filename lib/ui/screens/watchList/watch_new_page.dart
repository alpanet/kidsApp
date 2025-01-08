import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kids_app/theme.dart';
import 'package:kids_app/ui/components/button_component.dart';
import 'package:kids_app/ui/components/text_input_component.dart';

@RoutePage()
class WatchNewPage extends StatefulWidget {
  const WatchNewPage({super.key});

  @override
  State<WatchNewPage> createState() => _WatchNewPageState();
}

class _WatchNewPageState extends State<WatchNewPage> {
  final TextEditingController _listeAdiController = TextEditingController();
  final List<TextEditingController> _controllers = [TextEditingController()];
  final List<String?> _selectedVideoIds = [null];
  final List<Map<String, dynamic>> _components = [
    {
      "videoId": "Kategori 1",
      "videoStatus": true,
      "imageUrl": "https://img.youtube.com/vi/Va7gnpMnaQ8/maxresdefault.jpg",
      "text": "VideoVideoVideo 1",
    },
    {
      "videoId": "Kategori 1",
      "videoStatus": true,
      "imageUrl": "https://img.youtube.com/vi/Va7gnpMnaQ8/maxresdefault.jpg",
      "text": "VideoVideo 2",
    },
    {
      "videoId": "Kategori 1",
      "videoStatus": true,
      "imageUrl": "https://img.youtube.com/vi/Va7gnpMnaQ8/maxresdefault.jpg",
      "text": "Video 3",
    },
    {
      "videoId": "Kategori 1",
      "videoStatus": true,
      "imageUrl": "https://img.youtube.com/vi/Va7gnpMnaQ8/maxresdefault.jpg",
      "text": "Video 4",
    },
    {
      "videoId": "Kategori 1",
      "videoStatus": true,
      "imageUrl": "https://img.youtube.com/vi/Va7gnpMnaQ8/maxresdefault.jpg",
      "text": "Video 5",
    },
    {
      "videoId": "Kategori 2",
      "videoStatus": true,
      "imageUrl": "https://img.youtube.com/vi/Va7gnpMnaQ8/maxresdefault.jpg",
      "text": "Video 1",
    },
    {
      "videoId": "Kategori 2",
      "videoStatus": true,
      "imageUrl": "https://img.youtube.com/vi/Va7gnpMnaQ8/maxresdefault.jpg",
      "text": "Video 2",
    },
    {
      "videoId": "Kategori 3",
      "videoStatus": true,
      "imageUrl": "https://img.youtube.com/vi/Va7gnpMnaQ8/maxresdefault.jpg",
      "text": "Video 1",
    },
    {
      "videoId": "Kategori 3",
      "videoStatus": true,
      "imageUrl": "https://img.youtube.com/vi/Va7gnpMnaQ8/maxresdefault.jpg",
      "text": "Video 2",
    },
    {
      "videoId": "Kategori 3",
      "videoStatus": true,
      "imageUrl": "https://img.youtube.com/vi/Va7gnpMnaQ8/maxresdefault.jpg",
      "text": "Video 3",
    },
  ];

  @override
  void dispose() {
    _listeAdiController.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addRow() {
    setState(() {
      _controllers.add(TextEditingController());
      _selectedVideoIds.add(null);
    });
  }

  Widget _buildTotalDuration() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _durationBox('Saat', 00),
        const SizedBox(width: 15),
        _durationBox('Dakika', 00),
        const SizedBox(width: 15),
        _durationBox('Saniye', 00),
      ],
    );
  }

  Widget _durationBox(String label, int value) {
    String valueStr = value.toString().padLeft(2, '0');
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _singleBox(valueStr[0]),
            const SizedBox(width: 5),
            _singleBox(valueStr[1]),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _singleBox(String digit) {
    return Container(
      width: 40,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        digit,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildGroupedRows(String? selectedVideoId) {
    final filteredComponents = _components
        .where((component) => component['videoId'] == selectedVideoId)
        .toList();

    if (filteredComponents.isEmpty) {
      return const Center(
        child: Text(
          'Kategori Seçin',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        alignment: WrapAlignment.start,
        children: List.generate(filteredComponents.length, (index) {
          final component = filteredComponents[index];
      
          bool videoStatus = component["videoStatus"] ?? true;
          String imageUrl = component["imageUrl"] ?? '';
          String text = component["text"] ?? '';
      
          return GestureDetector(
            onTap: () {
              setState(() {
                component["videoStatus"] = !videoStatus;
              });
            },
            child: SizedBox(
              width: (MediaQuery.of(context).size.width - 32) / 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedOpacity(
                        opacity: videoStatus ? 1.0 : 0.5,
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      Icon(
                        videoStatus ? Icons.visibility : Icons.visibility_off,
                        color: AppTheme.primaryTextColor,
                        size: 30,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    text,
                    style: AppTheme.watchPageCardTitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
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
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppTheme.primaryTextColor,
                          width: 3,
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_sharp,
                          color: AppTheme.primaryTextColor,
                          size: 30,
                        ),
                        onPressed: () {
                          context.router.replaceNamed('watchlistPage');
                        },
                      ),
                    ),
                  ),
                  Text('Yeni İzlem', style: AppTheme.generalMenuTitle),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: AppTheme.primaryTextColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Center(
                          child: Tooltip(
                            message: '',
                            padding: const EdgeInsets.all(12),
                            textStyle: const TextStyle(
                              color: AppTheme.primaryTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.secondBackgoundColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            preferBelow: false,
                            child: IconButton(
                              icon: const Icon(
                                Icons.info_outline,
                                color: AppTheme.secondBackgoundColor,
                                size: 30,
                              ),
                              onPressed: () {
                                final snackBar = SnackBar(
                                  content: Row(
                                    children: [
                                      const Icon(
                                        Icons.info_outline,
                                        color: AppTheme.primaryTextColor,
                                        size: 32,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          'İzlem Listesi süresi seçilen kategori veya sizin belirlediğiniz '
                                          'kategori süresine göre hesaplanmaktadır.',
                                          style: AppTheme.snackBarContent,
                                        ),
                                      ),
                                    ],
                                  ),
                                  backgroundColor:
                                      AppTheme.secondBackgoundColor,
                                  behavior: SnackBarBehavior.floating,
                                  margin: const EdgeInsets.all(16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  duration: const Duration(seconds: 3),
                                  action: SnackBarAction(
                                    label: 'Kapat',
                                    textColor: AppTheme.primaryTextColor,
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                    },
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                            ),
                          ),
                        ),
                        _buildTotalDuration(),
                      ],
                    ),
                    TextInputComponent(
                      label: 'Liste Adı',
                      placeholder: 'Liste Adı',
                      controller: _listeAdiController,
                      isMultiline: false,
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Expanded(flex: 2, child: Text('Kategori')),
                        Expanded(flex: 1, child: Text('Süre')),
                      ],
                    ),
                    const Divider(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _controllers.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${index + 1}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      flex: 2,
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.grey[200],
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        value: _selectedVideoIds[
                                            index],
                                        items: [
                                          'Kategori 1',
                                          'Kategori 2',
                                          'Kategori 3'
                                        ]
                                            .map((category) => DropdownMenuItem(
                                                  value: category,
                                                  child: Text(category),
                                                ))
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedVideoIds[index] =
                                                value;
                                          });
                                        },
                                        hint: const Text('Seçim yapın'),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0, left: 22.0),
                                  child: _buildGroupedRows(_selectedVideoIds[
                                      index]),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Center(
                      child: IconButton(
                        onPressed: _addRow,
                        icon: const Icon(
                          Icons.add_circle,
                          size: 36,
                          color: AppTheme.secondBackgoundColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                        child: ButtonComponent(
                            text: "Kaydet",
                            onPressed: () {
                              print("Kaydet Pressed");
                              print("Liste Adı: ${_listeAdiController.text}");
                              for (var controller in _controllers) {
                                print("Süre: ${controller.text}");
                              }
                              print("Kategori Listesi: ${_components}");
                            })),
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
