import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gallery_app/models/fact.dart';

import '../../theme.dart';

class ArtExplore extends StatelessWidget {
  final List<FactModel> facts;
  const ArtExplore({super.key, required this.facts});
  @override
  Widget build(BuildContext context) {
    final art = facts[Random().nextInt(facts.length)];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AspectRatio(
              aspectRatio: 70 / 100,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage(art.img),
                    fit: BoxFit.cover,
                  ),
                  //color: Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Text(
                        'Explore Music',
                        // "Editor's Choise",
                        style: ThemeApp.darkTextTheme.bodyLarge,
                      ),
                      Positioned(
                        top: 20,
                        child: Text(
                          'Music Gallery',
                          style: ThemeApp.darkTextTheme.headlineLarge,
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        right: 0,
                        child: Text(
                          art.description,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: Text(
                          art.title,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
