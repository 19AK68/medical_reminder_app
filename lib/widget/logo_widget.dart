import 'package:flutter/material.dart';
import 'package:medical_reminder/util/ui_helper.dart';

class LogoWidget extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {

      return Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 220,
          child: Stack(
            children: <Widget>[
              Positioned(
                  child: Container(
                    child: Align(
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/tabl5.png'),
                              fit: BoxFit.cover,
                            )), //color: Color(0xFF20536c)
                        width: 150,
                        height: 150,
                      ),
                    ),
                    height: 150,
                  )),
              Positioned(
                child: Container(
                    height: 150,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Medication",
                            style: TextStyle(

                                fontSize: 25 * UI.scaleFactorH,
                                fontWeight: FontWeight.w300,
                                color: Colors.white.withOpacity(1)),
                          ),
                          Text(
                            "remainder",
                            style: TextStyle(

                                fontSize: 25 * UI.scaleFactorH,
                                fontWeight: FontWeight.w700,
                                color: Colors.white.withOpacity(1)),
                          ),
                        ],
                      ),

//                    child: Text(
//                      "GO",
//                      style: TextStyle(
//                        fontSize: 80,
//                        fontWeight: FontWeight.w700,
//                        color: Colors.white.withOpacity(1),
//                      ),
//                    ),
                    )),
              ),

              Positioned(
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.width * 0.15,
                bottom: MediaQuery.of(context).size.height * 0.046,
                right: MediaQuery.of(context).size.width * 0.22,

                child: Container(
                  padding: EdgeInsets.only(top: 16),
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/tabl5.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width * 0.08,
                height: MediaQuery.of(context).size.width * 0.08,
                bottom: 0,
                right: MediaQuery.of(context).size.width * 0.32,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/tabl5.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }


}