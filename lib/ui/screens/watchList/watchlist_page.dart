import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kids_app/theme.dart';
import 'package:kids_app/ui/components/button_component.dart';
import 'package:kids_app/ui/components/movie_card_component.dart';

@RoutePage()
class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categorys = [];

    return Scaffold(
      backgroundColor: AppTheme.secondBackgoundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                Center(
                  child: Text(
                    'İzlem Listesi',
                    textAlign: TextAlign.center,
                    style: AppTheme.generalMenuTitle,
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
                  categorys.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: const Icon(
                                Icons.add_circle,
                                color: AppTheme.secondBackgoundColor,
                                size: 80,
                              ),
                              onTap: () {
                            context.router.replaceNamed('watchNewPage');
                          },
                            ),
                            const SizedBox(height: 16),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12.0, left: 38.0, right: 38.0),
                                child: Text(
                                  'Henüz bir izlem listeniz yok. Hemen oluşturmaya başla',
                                  textAlign: TextAlign.center,
                                  style: AppTheme.secondaryButtonText,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Positioned.fill(
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
                          text: "Yeni İzlem",
                          onPressed: () {
                            context.router.replaceNamed('watchNewPage');
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
