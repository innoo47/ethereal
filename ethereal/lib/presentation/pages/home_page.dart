import 'package:ethereal/presentation/widgets/custom_shadow_box.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      // backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.asset('lib/config/assets/title_logo.png', width: 100),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: null,
              icon: Icon(Icons.account_circle),
            ),
          ),
        ],
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          /* 카테고리 버튼 */
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
              bottom: 10,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: OutlinedButton(onPressed: null, child: Text('data')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: OutlinedButton(onPressed: null, child: Text("data")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: OutlinedButton(onPressed: null, child: Text("data")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: OutlinedButton(onPressed: null, child: Text("data")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: OutlinedButton(onPressed: null, child: Text("data")),
                  ),
                ],
              ),
            ),
          ),
          /* 본문 */
          Expanded(
            child: ScrollShadow(
              color: Colors.black12,
              size: 20,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .start,
                      children: [
                        /* 1 */
                        customShadowBox(context),
                        SizedBox(height: 5),
                        /* 1 */
                        customShadowBox(context),
                        SizedBox(height: 5),
                        /* 1 */
                        customShadowBox(context),
                        SizedBox(height: 5),
                        /* 1 */
                        customShadowBox(context),
                        SizedBox(height: 5),
                        /* 1 */
                        customShadowBox(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
