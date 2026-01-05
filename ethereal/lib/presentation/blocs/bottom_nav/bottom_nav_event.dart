abstract class BottomNavEvent {}

// 사용자가 탭을 클릭했다는 이벤트
class BottomNavPageChanged extends BottomNavEvent {
  final int index;  // 사용자가 누른 탭 번호
  BottomNavPageChanged(this.index);
}