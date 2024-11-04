import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hello_world/pages/home_page.dart';
import 'package:hello_world/pages/search_page.dart';
import 'package:hello_world/resources/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPageIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final List<Widget> _pages = [
    //const HomePage(),
    const SearchPage(),
    const Center(
      child: Text("Add"),
    ),
    const Center(
      child: Text("Favorite"),
    ),
    const Center(
      child: Text("Profile"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Image(
          image: AssetImage("assets/images/moments_text.png"),
          height: 32,
        ),
        centerTitle: true,
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/fi-br-home.svg"),
              activeIcon: SvgPicture.asset("assets/icons/fi-sr-home.svg"),
              label: "Home"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/fi-br-search.svg"),
              activeIcon: SvgPicture.asset("assets/icons/fi-sr-search.svg"),
              label: "Search"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/fi-br-add.svg"),
              activeIcon: SvgPicture.asset("assets/icons/fi-sr-add.svg"),
              label: "Create"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/fi-br-heart.svg"),
              activeIcon: SvgPicture.asset("assets/icons/fi-sr-heart.svg"),
              label: "Activity"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/fi-br-portrait.svg"),
              activeIcon: SvgPicture.asset("assets/icons/fi-sr-portrait.svg"),
              label: "Profile")
        ],
        selectedItemColor: primaryColor,
        unselectedItemColor: secondaryColor,
        onTap: _onPageChanged,
        currentIndex: _selectedPageIndex,
      ),
    );
  }
}
