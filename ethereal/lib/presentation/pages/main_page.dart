import 'dart:io';

import 'package:ethereal/presentation/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bottom_nav/bottom_nav_bloc.dart';
import '../blocs/bottom_nav/bottom_nav_event.dart';
import '../blocs/bottom_nav/bottom_nav_state.dart';
import 'home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => BottomNavBloc(), child: _MainPageView());
  }
}

class _MainPageView extends StatelessWidget {
  _MainPageView();

  final List<Widget> _pages = [
    HomePage(),
    const Center(child: Text("검색 화면")),
    const Center(child: Text("프로필 화면")),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          // Body가 네비게이션 바 뒤까지 그려지게 함
          extendBody: true,

          // IndexedStack (탭 전환 시 상태 유지)
          body: IndexedStack(index: state.index, children: _pages),
          bottomNavigationBar: bottomNavBar(
            context: context,
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,  // 배경 투명
              elevation: 0, // 그림자 제거
              type: BottomNavigationBarType.fixed,  // 아이콘 움직임 고정
              selectedItemColor: Colors.purpleAccent,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedFontSize: 0,
              unselectedFontSize: 0,
              iconSize: 26,
              currentIndex: state.index,
              onTap: (index) {
                context.read<BottomNavBloc>().add(BottomNavPageChanged(index));
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
              ],
            ),
          ),
        );
      },
    );
  }
}
