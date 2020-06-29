import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final TextEditingController _ageController=new TextEditingController();
  final TextEditingController _heightController=new TextEditingController();
  final TextEditingController _weightController=new TextEditingController();
  double result=0.0;
  double inches=0.0;
  String _resultReading="";
  String _finalResult="";
  void _calculateBMI(){
    setState(() {
      int age=int.parse(_ageController.text);
      double height=double.parse(_heightController.text);
      inches=height*12;
      double weight=double.parse(_weightController.text);

      if((_ageController.text.isNotEmpty|| age>0)&&(_heightController.text.isNotEmpty||height>0)
      &&(_weightController.text.isNotEmpty|| weight>0)){
              result=weight/(inches*inches)*703;
              if(double.parse(result.toStringAsFixed(1))<18.5){
                _resultReading="UnderWeight";
              }else if(double.parse(result.toStringAsFixed(1))>=18.5 &&result<25){
                _resultReading="Great Shape";
              }else if(double.parse(result.toStringAsFixed(1))>=25.0 &&result<30){
                _resultReading="OverWeight";
              }else if(double.parse(result.toStringAsFixed(1))>=30.0){
                _resultReading="Obese";
              }
      }else
        result=0.0;
    });
    _finalResult="Your BMI:${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(2.0),
        children: <Widget>[
          Text(
            "BMI",
            textAlign: TextAlign.center,
            textScaleFactor: 8.0,
            style: TextStyle(
              wordSpacing: 1.0,
              fontStyle: FontStyle.italic,
              color: Colors.pink[300],
            ),
          ),
          Container(
            margin: EdgeInsets.all(3.0),
            height:245.0,
            decoration:BoxDecoration(
              border:Border.all(width:1.0,color:Colors.black),
              borderRadius:BorderRadius.all(Radius.circular(5.0)),

            ),
            child:Column(
              children: <Widget>[
                TextField(
                  controller:_ageController,
                  keyboardType:TextInputType.number,
                  decoration:InputDecoration(
                    labelText:"Age",
                    hintText:"eg:34",
                    icon:Icon(Icons.person_outline)
                  ),
                ),
                TextField(
                  controller:_heightController,
                  keyboardType:TextInputType.number,
                  decoration:InputDecoration(
                      labelText:"Hight in feet",
                      hintText:"eg:6.5",
                      icon:Icon(Icons.insert_chart)
                  ),
                ),
                TextField(
                  controller:_weightController,
                  keyboardType:TextInputType.number,
                  decoration:InputDecoration(
                      labelText:"Weight in lbs",
                      hintText:"eg:180",
                      icon:Icon(Icons.line_weight)
                  ),
                ),
                Padding(padding:const EdgeInsets.all(10.0),),
                Container(
                  alignment:Alignment.center,
                  child:RaisedButton(
                      onPressed:()=>_calculateBMI(),
                      color:Colors.pink,
                      textColor:Colors.white,
                      child:Text("Calculate"),
                  ),
                )
              ],
            ),
          ),
             Column(
               mainAxisAlignment:MainAxisAlignment.center,
               children: <Widget>[
                 Text(_finalResult,
                 style:TextStyle(
                   color:Colors.blueAccent,
                   fontWeight:FontWeight.w500,
                   fontStyle:FontStyle.italic,
                   fontSize:20.0
                 ),
                 ),
                 Text(_resultReading,
                   style:TextStyle(
                       color:Colors.pinkAccent,
                       fontWeight:FontWeight.w500,
                       fontStyle:FontStyle.italic,
                       fontSize:20.0
                   ),
                 ),
               ],
             )
        ],
      ),
    );
  }
}
