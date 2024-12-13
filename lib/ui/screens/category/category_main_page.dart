import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kids_app/theme.dart';
import 'package:kids_app/ui/components/button_component.dart';
import 'package:kids_app/ui/components/movie_card_component.dart';

@RoutePage()
class CategoryMainPage extends StatelessWidget {
  const CategoryMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categorys = [
      {
        "title": "Mystery of the Lost Compass",
        "description":
            "Follow a group of adventurers as they journey through enchanted forests to find a legendary compass said to point towards untold treasures.",
        "duration": "105 dk",
        "imageUrl":
            "https://i.ytimg.com/vi/ZvodMMy43B8/hq720.jpg?sqp=-oaymwEnCNAFEJQDSFryq4qpAxkIARUAAIhCGAHYAQHiAQoIGBACGAY4AUAB&rs=AOn4CLDJ-bW4ncecTMmMeS4Io8VVjxAjyQ",
      },
      {
        "title": "The Galactic Explorers",
        "description":
            "A thrilling space odyssey where a team of astronauts uncover a hidden alien civilization and their secrets to interstellar travel.",
        "duration": "120 dk",
        "imageUrl":
            "https://i.ytimg.com/vi/ZvodMMy43B8/hq720.jpg?sqp=-oaymwEnCNAFEJQDSFryq4qpAxkIARUAAIhCGAHYAQHiAQoIGBACGAY4AUAB&rs=AOn4CLDJ-bW4ncecTMmMeS4Io8VVjxAjyQ",
      },
      {
        "title": "The Chocolate Heist",
        "description":
            "A group of quirky friends plots to steal the world's largest chocolate sculpture before it melts in a summer heatwave.",
        "duration": "95 dk",
        "imageUrl":
            "https://i.ytimg.com/vi/ZvodMMy43B8/hq720.jpg?sqp=-oaymwEnCNAFEJQDSFryq4qpAxkIARUAAIhCGAHYAQHiAQoIGBACGAY4AUAB&rs=AOn4CLDJ-bW4ncecTMmMeS4Io8VVjxAjyQ",
      },
    ];

    return Scaffold(
      backgroundColor: AppTheme.secondBackgoundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                        left: MediaQuery.of(context).size.width * 0.18),
                    child: Text(
                      'Kategori',
                      style: AppTheme.generalMenuTitle,
                    ),
                  ),
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
              padding: const EdgeInsets.all(0.0),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 60),
                      child: ListView.builder(
                        padding: const EdgeInsets.all(18.0),
                        itemCount: categorys.length,
                        itemBuilder: (context, index) {
                          final movie = categorys[index];
                          return Column(
                            children: [
                              MovieCard(
                                title: movie["title"]!,
                                description: movie["description"]!,
                                duration: movie["duration"]!,
                                imageUrl: movie["imageUrl"]!,
                              ),
                              const SizedBox(height: 5),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 80,
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 90.0, vertical: 10.0),
                        child: ButtonComponent(
                          text: "Yeni Kategori",
                          onPressed: () {
                            context.router.replaceNamed('categoryNewCategoryPage');
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
