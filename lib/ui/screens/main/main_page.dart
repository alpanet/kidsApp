import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kids_app/theme.dart';
import 'package:kids_app/ui/components/movie_card_component.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> movies = [
      {
        'title': 'The Mystery of the Missing Marshmallows',
        'description':
            'A deliciously puzzling adventure where young sleuths must track down the trail of missing marshmallows from the campfire, unraveling clues and discovering tasty secrets along the way.',
        'duration': '90 dk',
        'imageUrl':
            'https://i.ytimg.com/vi/ZvodMMy43B8/hq720.jpg?sqp=-oaymwEnCNAFEJQDSFryq4qpAxkIARUAAIhCGAHYAQHiAQoIGBACGAY4AUAB&rs=AOn4CLDJ-bW4ncecTMmMeS4Io8VVjxAjyQ',
      },
      {
        'title': 'Adventures in the Candyland',
        'description':
            'Join the magical journey through Candyland where surprises await at every corner!',
        'duration': '120 dk',
        'imageUrl':
            'https://i.ytimg.com/vi/Va7gnpMnaQ8/hq720.jpg?sqp=-oaymwEnCNAFEJQDSFryq4qpAxkIARUAAIhCGAHYAQHiAQoIGBACGAY4AUAB&rs=AOn4CLCy89ra0SlrHpKm4TBD52OybHNaUQ',
      },
      {
        'title': 'Treasure Hunt in the Jungle',
        'description':
            'Follow the treasure map to uncover mysteries and find hidden treasures in the jungle.',
        'duration': '110 dk',
        'imageUrl':
            'https://i.ytimg.com/vi/jfKfPfyJRdk/hq720.jpg?v=665dffb9&sqp=CITx37oG-oaymwEnCNAFEJQDSFryq4qpAxkIARUAAIhCGAHYAQHiAQoIGBACGAY4AUAB&rs=AOn4CLAqJJG_LFaTNapIQB_Hbrv0IHNZaA',
      },
    ];

    return Scaffold(
      backgroundColor: AppTheme.secondBackgoundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hoş Geldiniz',
                      style: AppTheme.onboardingSubTitle,
                    ),
                    Text(
                      'Profile182',
                      style: AppTheme.generalTitle.copyWith(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    print("Ayarlar tıklandı");
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFCDD7B6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Uygulamayı Özelleştir',
                              style: AppTheme.mainpageTitle,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Çocuğunuz için en iyisini siz seçin ve izlemeye başlayın.',
                              style: AppTheme.mainpageSubTitle,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    context.router.replaceNamed('categoryMainPage');
                                  },
                                  icon: const Icon(Icons.layers, size: 20),
                                  label: const Text('Yeni Kategori'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF6D8F5E),
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 20,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    print("Yeni İzlem tıklandı");
                                  },
                                  icon: const Icon(Icons.tv, size: 20),
                                  label: const Text('Yeni İzlem'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: const Color(0xFF4A4A4A),
                                    side: const BorderSide(
                                      color: Color(0xFF4A4A4A),
                                      width: 1,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 20,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Önerilenler',
                          style: AppTheme.mainpageCategoryTitle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    MovieCardList(movies: movies),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
