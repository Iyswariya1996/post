import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  final double imgHeight;
  HeroImage({this.imgHeight});
  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       CircleAvatar(
         radius: 90,
         backgroundImage: AssetImage("assets/image.jpg",),
       ),
     ],
   );
  }
}

class CustomButton extends StatelessWidget {
  final String btnText;
  final Function onBtnPressed;
  CustomButton({this.btnText,this.onBtnPressed});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
             btnText,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(width: 10),
            Icon(Icons.arrow_forward)
          ],
        ),
      ),
      onPressed: onBtnPressed,
      color:Theme.of(context).primaryColor,
    );
  }
}

class SocilaIcon extends StatelessWidget {
  final String iconname;
  SocilaIcon({this.iconname});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(iconname),
      width: 40,
      height: 40,
    );
  }
}
