import 'package:flutter/material.dart';
import 'package:intro_app_ui_task/Utils/Strings.dart';
import 'package:intro_app_ui_task/pages/home_page.dart';
class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  static const String id ="intro_page";

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  PageController _pageController = PageController();
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page){
              setState(() {
                _selectedPage = page;
              });
            },
            children: [
              _makePage(
                img: "assets/images/image_1.png",
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent,
              ),
              _makePage(
                img: "assets/images/image_2.png",
                title: Strings.stepTwoTitle,
                content: Strings.stepTwoContent,
              ),
              _makePage(
                img: "assets/images/image_1.png",
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: _forSkip(),
            ),
          )
        ],
      ),
    );
  }

  Widget _makePage({img, title, content}){
    return Container(
      padding: EdgeInsets.only(right: 50, bottom: 50, left: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(color: Colors.red, fontSize: 30),),
          SizedBox(height: 20,),
          Text(content, style: TextStyle(color: Colors.grey, fontSize: 20),textAlign: TextAlign.center,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(img),
          )
        ],
      ),
    );
  }

  _indicator(bool _isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: _isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator(){
    List<Widget> indicators = [];
    for(int i=0; i<3; i++){
      if(_selectedPage == i){
        indicators.add(_indicator(true));
      }else{
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  List<Widget> _forSkip(){
    List<Widget> list = [];
    if(_selectedPage ==2){
      list.add(
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, HomePage.id);
          },
          child: Container(
            margin: EdgeInsets.only(right: 40),
            child: Text("Skip", style: TextStyle(color: Colors.red, fontSize: 18),),
          ),
        )
      );
    }else{
      list.add(SizedBox());
    }
    return list;
  }
}
