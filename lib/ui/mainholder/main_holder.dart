// holder를 보면 이렇게 생각할 수 있어야 한다! 여기 화면에 여러 페이지를 둘 수 있겠구나!!

import 'package:flutter/material.dart';

import 'first/first_page.dart';
import 'third/third_page.dart';

class MainHolder extends StatefulWidget {
  const MainHolder({super.key});

  @override
  State<MainHolder> createState() => _MainHolderState();
}

class _MainHolderState extends State<MainHolder> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    // 여기에 통신 코드가 필요해. 이 통신에서 받은 데이터를 토대로 그림을 그림.
    return Scaffold(
      body: IndexedStack(
        // 번호로 화면을 바꿔치기 할 수 있다. 그냥 Stack을 쓰면 그냥 쌓아둔 것이라 바꿔치기 하기가 불편하다.
        index: _index,
        children: [
          FirstPage(),
          SecondPage(),
          ThirdPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        // 선택된 아이콘에 label 안 보이게 하기
        showUnselectedLabels: false,
        // 선택되지 않은 아이콘에 label 안 보이게 하기
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.black,
        currentIndex: _index,
        // 선택된 아이콘에 색상 보여주기
        items: [
          // 아이템 개수는 5개가 최댓값
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
          BottomNavigationBarItem(icon: Icon(Icons.face), label: "사진"),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "개인정보"),
        ],
        onTap: (i) {
          print("클릭됨 ${i}");
          _index = i;
          setState(() {});
        },
      ),
    );
  }
}
