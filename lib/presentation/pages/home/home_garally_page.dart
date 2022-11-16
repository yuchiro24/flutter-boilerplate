import 'package:aufguss_event_app/common/index.dart';
import 'package:aufguss_event_app/presentation/pages/home/home_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeGarallyPage extends ConsumerWidget {
  const HomeGarallyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: .5,
        backgroundColor: karutaAppBarColor,
        title: const Text(
          '今までのふだ',
          style: TextStyle(
            color: karutaTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.count(
            padding: const EdgeInsets.all(8),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            crossAxisCount: 2,
            childAspectRatio: 0.79,
            children: ref.watch(homePageNotifierProvider).cards.map((card) {
              return InkWell(
                onTap: () async {
                  //await ref.read(roomNotifierProvider.notifier).take(card.id);
                },
                child: Stack(
                  children: [
                    SizedBox(
                      height: context.deviceHeight,
                      width: context.deviceWidth,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: kAppBorder, width: 4),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              card.img ?? '',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 8,
                      top: 8,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: karutaAppBarColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            card.title[0],
                            style: const TextStyle(
                              fontSize: 16,
                              color: karutaTextColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
