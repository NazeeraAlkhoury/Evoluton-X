import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = const [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Center(child: Icon(Icons.search_sharp)),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Center(child: Icon(Icons.favorite_border)),
        label: '',
      ),
    ];
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(120),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(120),
        child: BottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {},
          // iconSize: 26,
          items: items,
        ),
      ),
    );
  }
}
