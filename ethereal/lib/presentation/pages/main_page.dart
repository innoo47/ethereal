import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bottom_nav/bottom_nav_bloc.dart';
import '../blocs/bottom_nav/bottom_nav_event.dart';
import '../blocs/bottom_nav/bottom_nav_state.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => BottomNavBloc(), child: _MainPageView());
  }
}

class _MainPageView extends StatelessWidget {
  const _MainPageView();

  final List<Widget> _pages = const [
    Center(child: Text("홈화면")),
    Center(child: Text("검색 화면")),
    Center(child: Text("프로필 화면")),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(index: state.index, children: _pages),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.index,
            onTap: (index) {
              context.read<BottomNavBloc>().add(BottomNavPageChanged(index));
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: '검색'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: '프로필'),
            ],
          ),
        );
      },
    );
  }
}
