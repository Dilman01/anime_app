import 'dart:ui';

import 'package:anime_app/views/seasons/seasons_view.dart';
import 'package:flutter/material.dart';

import 'package:anime_app/views/home/home_view.dart';
import 'package:anime_app/views/saved/saved_view.dart';
import 'package:anime_app/views/search/search_view.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int selectedItem = 0;

  final List<Widget> screens = [
    HomeView(),
    SearchView(),
    SeasonsView(),
    SavedView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[selectedItem],
      bottomNavigationBar: Container(
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.white.withOpacity(0.1),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
          color: Color.fromRGBO(17, 45, 67, 0.7),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
          child: ClipPath(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 8, sigmaX: 8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedItem = 0;
                        });
                      },
                      child: Icon(
                        Icons.home_filled,
                        size: selectedItem == 0 ? 36 : 32,
                        color: selectedItem == 0
                            ? Color.fromRGBO(35, 137, 242, 1)
                            : Colors.grey,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedItem = 1;
                        });
                      },
                      child: Icon(
                        Icons.search,
                        size: selectedItem == 1 ? 36 : 32,
                        color: selectedItem == 1
                            ? Color.fromRGBO(35, 137, 242, 1)
                            : Colors.grey,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedItem = 2;
                        });
                      },
                      child: Icon(
                        Icons.auto_awesome,
                        size: selectedItem == 2 ? 36 : 32,
                        color: selectedItem == 2
                            ? Color.fromRGBO(35, 137, 242, 1)
                            : Colors.grey,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedItem = 3;
                        });
                      },
                      child: Icon(
                        Icons.bookmark_rounded,
                        size: selectedItem == 3 ? 36 : 32,
                        color: selectedItem == 3
                            ? Color.fromRGBO(35, 137, 242, 1)
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
