import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kids_app/theme.dart';
import 'package:kids_app/ui/components/movie_card_component.dart';

@RoutePage()
class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

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
            'https://i.ytimg.com/vi/ZvodMMy43B8/hq720.jpg?sqp=-oaymwEnCNAFEJQDSFryq4qpAxkIARUAAIhCGAHYAQHiAQoIGBACGAY4AUAB&rs=AOn4CLDJ-bW4ncecTMmMeS4Io8VVjxAjyQ',
      },
      {
        'title': 'Treasure Hunt in the Jungle',
        'description':
            'Follow the treasure map to uncover mysteries and find hidden treasures in the jungle.',
        'duration': '110 dk',
        'imageUrl':
            'https://i.ytimg.com/vi/ZvodMMy43B8/hq720.jpg?sqp=-oaymwEnCNAFEJQDSFryq4qpAxkIARUAAIhCGAHYAQHiAQoIGBACGAY4AUAB&rs=AOn4CLDJ-bW4ncecTMmMeS4Io8VVjxAjyQ',
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
                      'Hoş 2222Geldiniz',
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
