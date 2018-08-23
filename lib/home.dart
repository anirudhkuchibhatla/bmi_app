import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BMI();
  }
}


class BMI extends State<Home> {

  final TextEditingController _age = new TextEditingController();
  final TextEditingController _height = new TextEditingController();
  final TextEditingController _weight = new TextEditingController();
  double bmi = 0.0;
  String classification = "BMI Classification";



  void calculate(){
  setState(() {

    bmi = 703 * int.parse(_weight.text) / (int.parse(_height.text) * int.parse(_height.text));

    if(bmi < 18.5) {
      classification = "Underweight";
    }
    else if (bmi < 24.9) {
      classification = "Normal";
    }
    else if (bmi < 29.9) {
      classification = "Overweight";
    }
    else {
      classification = "Obese";
    }

  });

}




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),

      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(

          children: <Widget>[
            new Container(
              alignment: Alignment.center,
              child: new Image.asset(
                "images/bmilogo.png",
                height: 80.0,
                width: 200.0,

              ),
              
            ),

            new Container(
              margin: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
              color: Colors.grey,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new TextField(
                    controller: _age,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Age",
                      icon: Icon(Icons.person),
                    ) ,

                  ),

                  new TextField(
                    controller: _height,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Height in Inches",
                      icon: Icon(Icons.accessibility),
                    ) ,

                  ),

                  new TextField(
                    controller: _weight,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Weight in lb",
                      icon: Icon(Icons.assessment),
                    ) ,

                  ),


                  new Padding(padding: const EdgeInsets.all(5.0)),


                  new RaisedButton(
                      onPressed: calculate,
                      color: Colors.pink,
                      child: new Text("Calculate"),

                  ),

                  new Padding(padding: const EdgeInsets.all(5.0)),

                ],
              ),



            ),

            new Padding(padding: const EdgeInsets.all(5.0)),

            new Text(
              "Your BMI: $bmi",
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
              ),
            ),

            new Text(
              "$classification",
              textAlign: TextAlign.center,
              style: new TextStyle(
                color: Colors.pink,
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            

            
          ],
          
        ),

      ),


    );
  }
}