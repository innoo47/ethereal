import 'package:flutter/material.dart';

Widget bottomNavBar({required BottomNavigationBar child, required BuildContext context}) {
  // SafeArea를 사용하여 안드로이드 네비게이션 바의 형태에 대응
  return SafeArea(
    maintainBottomViewPadding: true,  // 뷰가 가려져도 패딩 공간 유지 (레이아웃이 튀는 현상을 방지)
    child: Container(
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            // spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      // 모서리를 둥글게 깎기
      child: ClipRRect(
        borderRadius: .circular(20),
        child: MediaQuery.removePadding(
            context: context,
            removeBottom: true, // 내부 아이콘 정렬을 위한 패딩 제거
            child: child
        ),
      ),
    ),
  );
}