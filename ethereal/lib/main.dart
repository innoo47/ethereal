import 'package:flutter/material.dart';
import 'package:ethereal/presentation/pages/main_page.dart';
import 'package:flutter/services.dart';

void main() {
  // 1. 플러터 엔진과 위젯 바인딩 초기화 (SystemChrome 사용 전 필수)
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // 2. 시스템 UI 스타일 설정
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarContrastEnforced: false,

      // 상단 상태바 (시계, 배터리 등) 설정
      statusBarColor: Colors.transparent,
      // 투명하게
      statusBarIconBrightness: Brightness.light,
      // 아이콘은 검은색 (배경이 밝을 때)

      // ✨ 하단 네비게이션 바 (뒤로가기, 홈 버튼) 설정
      systemNavigationBarColor: Colors.transparent,
      // 배경을 투명하게!
      systemNavigationBarIconBrightness: Brightness.dark,
      // 버튼 아이콘을 검은색으로

      // (Android 10+ 제스처 라인 색상 제어용)
      // systemNavigationBarDividerColor: Colors.transparent,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '에테리얼',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,

        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
        ),
      ),
      home: const MainPage(),
    );
  }
}
