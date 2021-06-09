import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About me'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            CircleAvatar(
              backgroundColor: Color(0xffFE4D3B),
              backgroundImage: AssetImage('assets/images/myavatar.png'),
              radius: 100.0,
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(40.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text('Kabir Singh',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                    ),
                    SizedBox(height: 20.0,),
                    Text(
                      'Hey, there Nice to meet you ✌ I am a second-year undergrad student pursuing software engineering from Chennai, India.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                    SizedBox(height: 30,),
                    Icon(Icons.location_on,
                    color: Colors.white,
                      size: 30,
                    ),
                    Text('Pune',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,),
                    ),
                    SizedBox(height: 50,),
                    Text('Find Me Here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 80,
                        width: 80.0,
                          child: RaisedButton(
                            color: Color(0xffFE4D3B),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(FontAwesomeIcons.linkedinIn,
                            size: 40,
                              color: Colors.white,
                            ),
                              onPressed: _launchURL1,
                          ),
                        ),
                        SizedBox(height: 80,
                          width: 80.0,
                          child: RaisedButton(
                            color: Color(0xffFE4D3B),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(FontAwesomeIcons.github,
                              size: 50,
                              color: Colors.white,
                            ),
                              onPressed:_launchURL2,
                          ),
                        ),
                        SizedBox(height: 80,
                          width: 80.0,
                          child: RaisedButton(
                            color: Color(0xffFE4D3B),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(FontAwesomeIcons.instagram,
                              size: 50,
                              color: Colors.white,
                            ),
                              onPressed: _launchURL3,
                          ),
                        ),
                    ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_launchURL1() async {
  const url = 'https://www.linkedin.com/in/kabirsinghtech/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL2() async {
  const url = 'https://github.com/kabirsingh04';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL3() async {
  const url = 'https://www.instagram.com/kabiirraaa/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}