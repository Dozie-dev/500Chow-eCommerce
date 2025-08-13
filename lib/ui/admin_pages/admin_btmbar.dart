import 'package:chow_500/ui/admin_pages/analytics.dart';
import 'package:chow_500/ui/admin_pages/reviews.dart';
import 'package:chow_500/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AdminBtmbar extends StatefulWidget {
  const AdminBtmbar({super.key});

  @override
  State<AdminBtmbar> createState() => _AdminBtmbarState();
}

class _AdminBtmbarState extends State<AdminBtmbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [const AnalyticsPage(), const ReviewsPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "Home",
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none),
                label: "Notifications",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
