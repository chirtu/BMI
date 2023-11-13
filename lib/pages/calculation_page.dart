
import 'package:bmicalcutor/constants/colors.dart';
import 'package:bmicalcutor/constants/constants.dart';
import 'package:bmicalcutor/widgets/form_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'home.dart';

class CalculationPage extends StatefulWidget {
  const CalculationPage({Key? key}) : super(key: key);

  @override
  State<CalculationPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<CalculationPage> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();

  String? errorHeight, errorWeight;
  double Result = 0.0;

  void _onRefresh() async {
    _refreshController.refreshCompleted();
    height.text = "";
    weight.text = "";
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.darkblue,
        centerTitle: false,
        title: Text(keyWord.bmi, style: TextStyle(fontSize: 17,color: colors.white),),
        actions: [
          IconButton( icon:Icon(Icons.bar_chart, color: colors.white),onPressed: null,),
          IconButton( icon:Icon(CupertinoIcons.chat_bubble, color: colors.white),onPressed: null,),
        ],
      ),
      body: SmartRefresher(
          controller: _refreshController,
          header: WaterDropMaterialHeader(
            backgroundColor: colors.white,
            color: colors.primary,
          ),
          onRefresh:_onRefresh,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
                padding: EdgeInsets.all(30),
                sliver: SliverList(
                    delegate: SliverChildListDelegate(
                        [
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: colors.backgroundColor2,
                                borderRadius: BorderRadius.circular(5) ),
                            child: Column(
                              children: [
                                Text(keyWord.calculateYourBMI, style: TextStyle(fontWeight: FontWeight.bold, color:colors.darkblue, fontSize: 16),),
                                SizedBox(height: 30,),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      color: colors.white,
                                      borderRadius: BorderRadius.circular(10) ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      FormTextField(
                                        controller: height,
                                        keyboardType: TextInputType.number,
                                        title: keyWord.enterHeight,
                                        errorText: errorHeight,
                                        onChanged: (String value) {
                                          setState(() {
                                            if (value.isEmpty) {
                                              errorHeight = keyWord.requiredField;
                                            } else {
                                              errorHeight = null;
                                            }
                                          });

                                        },
                                      ),
                                      FormTextField(
                                        controller: weight,
                                        keyboardType: TextInputType.number,
                                        title: keyWord.enterWidth,
                                        errorText: errorWeight,
                                        onChanged: (String value) {
                                          setState(() {
                                            if (value.isEmpty) {
                                              errorWeight = keyWord.requiredField;
                                            } else {
                                              errorWeight = null;
                                            }
                                          });

                                        },

                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 60,vertical: 20),
                            child: ElevatedButton(
                              onPressed: (){
                                calculate();
                              } ,
                              style: ElevatedButton.styleFrom(
                              fixedSize: Size(30, 30),
                                primary: colors.darkblue
                            ), child: Text(keyWord.calculate,style: TextStyle(color: colors.white),),),
                          )
                        ]
                    )
                )
            )
          ],
        ),
      ),
    );
  }

  calculate(){
    //convert into a doub;e
    double dweight = double.tryParse(weight.text) ?? 0.0;
    double dheight = double.tryParse(height.text) ?? 0.0;

    print(weight.text);
    print(height.text);

    if (dweight > 0 && dheight > 0) {
      //change height from centimeter to meter
      double HinMeter = dheight / 100.0;

      //bmi fomula
      double bmi = dweight / (HinMeter * HinMeter);

      setState(() {
        Result = double.parse(bmi.toStringAsFixed(1));

        Navigator.push(context, MaterialPageRoute(builder: (context)=>BmiPage(weight: weight.text, BmiResult: Result.toString(), height:height.text,)));
      });

    } else {
      setState(() {
        Result = 0.0;
      });
    }
  }
}
