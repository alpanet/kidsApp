import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kids_app/theme.dart';
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
  int _rowCount = 1;

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
      _rowCount++;
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

  Widget _buildCategoryRow(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              hint: const Text('Seçim yapın'),
              items: const [
                DropdownMenuItem(
                  value: 'Kategori 1',
                  child: Text('Kategori 1'),
                ),
                DropdownMenuItem(
                  value: 'Kategori 2',
                  child: Text('Kategori 2'),
                ),
              ],
              onChanged: (value) {
                // Handle dropdown value change
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: TextFormField(
              controller: _controllers[index],
              decoration: InputDecoration(
                hintText: 'Süre',
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
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
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextInputComponent(
                      label: 'Liste Adı',
                      placeholder: 'Liste Adı',
                      controller: _listeAdiController,
                      isMultiline: false,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'İzlem Listesi süresi seçilen kategori veya sizin belirlediğiniz '
                      'kategori süresine göre hesaplanmaktadır.',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    const SizedBox(height: 20),
                    _buildTotalDuration(),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Expanded(flex: 2, child: Text('Kategori')),
                        Expanded(flex: 1, child: Text('Süre')),
                      ],
                    ),
                    const Divider(),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: _controllers.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
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
                                          value: null,
                                          items: [
                                            'Kategori 1',
                                            'Kategori 2',
                                            'Kategori 3'
                                          ]
                                              .map((category) =>
                                                  DropdownMenuItem(
                                                    value: category,
                                                    child: Text(category),
                                                  ))
                                              .toList(),
                                          onChanged: (value) {
                                            print("Selected Category: $value");
                                          },
                                          hint: const Text('Seçim yapın'),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: TextFormField(
                                          controller: _controllers[index],
                                          decoration: InputDecoration(
                                            hintText: 'Süre',
                                            filled: true,
                                            fillColor: Colors.grey[200],
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 12),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          keyboardType: TextInputType.number,
                                        ),
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
                                color: Colors.green,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Divider(),
                        ],
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[700],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 12),
                        ),
                        onPressed: () {
                          print("Kaydet Pressed");
                          print("Liste Adı: ${_listeAdiController.text}");
                          for (var controller in _controllers) {
                            print("Süre: ${controller.text}");
                          }
                        },
                        child: const Text(
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
