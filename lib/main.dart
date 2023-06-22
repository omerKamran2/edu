import 'package:flutter/material.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(home: Scaffold(body: TweenAnimation(),),);
  }
}
class TweenAnimation extends StatefulWidget
{
  @override
  TweenAnimationState createState() => TweenAnimationState();
}
class TweenAnimationState extends State<TweenAnimation> with SingleTickerProviderStateMixin
{
  AnimationController controller;
  Animation sizeAnimation;
  Animation<Color> colorAnimation;
  Animation<Rect> rectAnimation;
  @override
  void initState()
  {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 5), vsync: this,)..repeat();
    sizeAnimation = Tween(begin: 100.0, end: 10.0,).animate(controller);
    colorAnimation = ColorTween(begin: Colors.red, end: Colors.purple,).animate(controller);
    rectAnimation = RectTween(begin: Rect.fromLTWH(0, 0, 100, 100), end: Rect.fromLTWH(450, 200, 10, 10),).animate(controller);
  }
  @override
  Widget build(BuildContext context)
  {
    return Stack(
      children:
      [
        AnimatedBuilder(animation: controller,builder: (context, child)
        {
          return Positioned.fromRect(rect: rectAnimation.value, child: Container(width: sizeAnimation.value, height: sizeAnimation.value, color: colorAnimation.value,),);
        },),
      ],);
  }
  @override
  void dispose()
  {
    controller.dispose();
    super.dispose();
  }
}