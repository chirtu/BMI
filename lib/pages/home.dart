
import 'package:bmicalcutor/constants/colors.dart';
import 'package:bmicalcutor/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiPage extends StatefulWidget {
  String height;
  String weight;
  String BmiResult;
  BmiPage({Key? key,required this.height,required this.weight, required this.BmiResult}) : super(key: key);

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
@override


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.darkblue,
        iconTheme: IconThemeData(
          color: colors.white,
        ),
        centerTitle: false,
        title: Text(keyWord.bmi, style: TextStyle(fontSize: 17,color: colors.white),),
        actions: [
         IconButton( icon:Icon(Icons.bar_chart, color: colors.white),onPressed: null,),
         IconButton( icon:Icon(CupertinoIcons.chat_bubble, color: colors.white),onPressed: null,),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverList(
                  delegate: SliverChildListDelegate(
                      [
                        Container(
                          padding: EdgeInsets.all(20),
                          width: size.width,
                          color: colors.backgroundColor2.withOpacity(.1),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                width: size.width,
                                decoration: BoxDecoration(
                                  color: colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft:Radius.circular(70),
                                      topRight: Radius.circular(70),
                                      bottomLeft:Radius.circular(20),
                                      bottomRight: Radius.circular(20) )
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 150,
                                      child: SfRadialGauge(
                                          axes: <RadialAxis>[
                                            RadialAxis(
                                                minimum: 15,
                                                maximum: 40,
                                                ranges: <GaugeRange>[
                                                  GaugeRange(startValue: 0.0, endValue:15.0 , color:colors.grey),
                                                  GaugeRange(startValue: 16, endValue:18.4 , color:colors.darkblue),
                                                  GaugeRange(startValue: 18.5, endValue:24.9 , color:colors.green),
                                                  GaugeRange(startValue: 25.0,endValue: 29.9,color: colors.yellow),
                                                  GaugeRange(startValue: 30,endValue: 34.9,color: colors.orange),
                                                  GaugeRange(startValue: 35,endValue: 40,color: colors.red)],
                                                pointers: <GaugePointer>[
                                                  NeedlePointer(
                                                      value: double.parse(widget.BmiResult),
                                                    needleLength: 0.7,
                                                    lengthUnit: GaugeSizeUnit.factor,
                                                    needleColor: Colors.black,
                                                    needleStartWidth: 0,
                                                    needleEndWidth: 3,
                                                    knobStyle: KnobStyle(knobRadius: 0),
                                                  )],
                                                annotations: <GaugeAnnotation>[
                                                  GaugeAnnotation(
                                                      widget: Container(
                                                          child: Text(widget.BmiResult,
                                                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold))),
                                                      angle: 90, positionFactor: 0.5
                                                  )]
                                            )]),
                                    ),
                                    if(double.parse(widget.BmiResult)<=18.5) Center(child: Text(keyWord.badShape,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: colors.blue),)),
                                    if(double.parse(widget.BmiResult)>=18.6 && double.parse(widget.BmiResult)<=29.9 ) Center(child: Text(keyWord.goodShape,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: colors.blue),)),
                                    if(double.parse(widget.BmiResult)>=29.9 && double.parse(widget.BmiResult)<=34.9  ) Center(child: Text(keyWord.worseShape,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: colors.blue),)),
                                    if( double.parse(widget.BmiResult)>=35 ) Center(child: Text(keyWord.goodShape,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: colors.blue),)),
                                    SizedBox(height: 10,) ,
                                    Stack(
                                      children: [
                                        Container(
                                            width: double.infinity ,
                                            height: 30,
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: colors.white,
                                              border: Border.all(color: Colors.cyan),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Padding(
                                              padding:  EdgeInsets.only(left: size.width *.6),

                                            )),
                                        Container(
                                            // padding: EdgeInsets.all(10),
                                            height: 30,
                                            width: size.width *.3,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.cyan),
                                              color: colors.blue,
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child:Center(child: Text('Body Mass Index', style: TextStyle( color: colors.white,fontSize: 12),))),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Wrap(
                                         children: [
                                           Container(
                                             padding: EdgeInsets.all(20),
                                             height: 15,
                                             decoration: BoxDecoration(
                                               shape: BoxShape.circle,
                                               color: colors.grey,),
                                           ),
                                           Text(keyWord.excessiceUnderWeight,style: TextStyle(fontSize: 12),),
                                         ],
                                       ),
                                       Text(keyWord.less+keyWord.valueExes+" "+keyWord.kg,style: TextStyle(fontSize: 12),),
                                     ],
                                   ),
                                    SizedBox(height: 10,),
                                    Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Wrap(
                                         children: [
                                           Container(
                                             padding: EdgeInsets.all(20),
                                             height: 15,
                                             decoration: BoxDecoration(
                                               shape: BoxShape.circle,
                                               color: colors.darkblue,),
                                           ),
                                           Text(keyWord.underWeight,style: TextStyle(fontSize: 12),),
                                         ],
                                       ),
                                       Text(keyWord.valueUnder+" "+keyWord.kg,style: TextStyle(fontSize: 12),),
                                     ],
                                   ),
                                    SizedBox(height: 10,),
                                    Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Wrap(
                                         children: [
                                           Container(
                                             padding: EdgeInsets.all(20),
                                             height: 15,
                                             decoration: BoxDecoration(
                                               shape: BoxShape.circle,
                                               color: colors.green,),
                                           ),
                                           Text(keyWord.normaWeight,style: TextStyle(fontSize: 12),),
                                         ],
                                       ),
                                       Text(keyWord.valueNormal+" "+keyWord.kg,style: TextStyle(fontSize: 12),),
                                     ],
                                   ),
                                    SizedBox(height: 10,),
                                    Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Wrap(
                                         children: [
                                           Container(
                                             padding: EdgeInsets.all(20),
                                             height: 15,
                                             decoration: BoxDecoration(
                                               shape: BoxShape.circle,
                                               color: colors.yellow,),
                                           ),
                                           Text(keyWord.overWeight,style: TextStyle(fontSize: 12),),
                                         ],
                                       ),
                                       Text(keyWord.valueOver+" "+keyWord.kg,style: TextStyle(fontSize: 12),),
                                     ],
                                   ),
                                    SizedBox(height: 10,),
                                    Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Wrap(
                                         children: [
                                           Container(
                                             padding: EdgeInsets.all(20),
                                             height: 15,
                                             decoration: BoxDecoration(
                                               shape: BoxShape.circle,
                                               color: colors.orange,),
                                           ),
                                           Text(keyWord.obbess,style: TextStyle(fontSize: 12),),
                                         ],
                                       ),
                                       Text(keyWord.valueObese+" "+keyWord.kg,style: TextStyle(fontSize: 12),),
                                     ],
                                   ),
                                    SizedBox(height: 10,),
                                    Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Wrap(
                                         children: [
                                           Container(
                                             padding: EdgeInsets.all(20),
                                             height: 15,
                                             decoration: BoxDecoration(
                                               shape: BoxShape.circle,
                                               color: colors.red,),
                                           ),
                                           Text(keyWord.verySevereObesse,style: TextStyle(fontSize: 12),),
                                         ],
                                       ),
                                       Text(keyWord.valueVerObese+" "+keyWord.kg,style: TextStyle(fontSize: 12),),
                                     ],
                                   ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                padding: EdgeInsets.all(20),
                                height: size.height*.15,
                                width: size.width,
                                decoration: BoxDecoration(
                                  color: colors.white,
                                  borderRadius: BorderRadius.circular(10) ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Wrap(
                                          direction: Axis.horizontal,
                                          spacing: 20,
                                          children: [
                                            Container(
                                                height: 20,
                                                child: Image.asset("assets/icons/rule.png")),                                            Text(keyWord.height, style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),) ,
                                          ],
                                        ),
                                        Text(widget.height+" "+ keyWord.kg, style: TextStyle(color: Colors.blue),)
                                      ],
                                    ),
                                    Divider(thickness: 2,endIndent: 10,indent: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Wrap(
                                          direction: Axis.horizontal,
                                          spacing: 20,
                                          children: [
                                            Icon(Icons.note_alt,color: colors.grey),
                                            Text(keyWord.weight, style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),) ,
                                          ],
                                        ),
                                        Text(widget.weight +" "+ keyWord.cm, style: TextStyle(color: Colors.blue),)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 80,vertical: 20),

                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: colors.darkblue

                            ),
                            child: Text(keyWord.saveResult,style: TextStyle(color: colors.white),),
                            onPressed: (){},
                          ),
                        )
                      ]
                  )
              )
          )
        ],
      ),
    );
  }
}
