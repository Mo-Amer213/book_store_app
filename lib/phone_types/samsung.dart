import 'package:flutter/material.dart';

class Samsung extends StatefulWidget {
  @override
  _SamsungState createState() => _SamsungState();
}

class _SamsungState extends State<Samsung> {
  String cameraSize = "5 ميغابيكسل";
  String cpuSize = "ثماني النواة";
  String battery = "1,715 mAh";
  String price = '1200\u0024 ';
  String memory = '4GB';
  String network = '4G';

  TextStyle propertiesStyle =
  TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "samsung",
            style: TextStyle(color: Colors.black87),
          ), centerTitle:true,
        ),
        body: ListView.builder(
          itemBuilder: (context,index){
            return  _buildSinglePhoneCard(
                'images/phone1.png',
                cameraSize,
                cpuSize,
                battery,
                price,
                network,
                memory);
          },itemCount: 10,
        ),
      ),
    );
  }

  Widget _buildSinglePhoneCard(
      String image, String cameraSize,
      String cpuSize, String battery,
      String price, String memory,
      String network) {
    return  InkWell(
      onTap:(){
        Navigator.of(context).pushNamed('samsung_details');
      } ,
      child: Card(
        color: Color(0xff3E3A63),
        //color: Colors.white60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
        ),
        elevation: 5,
        shadowColor: Colors.deepOrange,
        child: Row(children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 8),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepOrange),
                  image: DecorationImage(
                      image: ExactAssetImage(
                        image,
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _buildCameraRow(
                    cameraSize: cameraSize,
                    cpuSize: cpuSize,
                  ),
                  _buildBatteryRow(
                    battery: battery,
                    memory: memory,
                  ),
                  _buildPriceRow(
                    price: price,
                    networkStructure: network,
                  ),
                ]),
          ),
        ]),
      ),
    ) ;
  }

  Row _buildCameraRow({
    String cameraSize = '  ',
    String cpuSize = '   ',
  }) {
    return Row(
      children: <Widget>[
        Text(
          "الكاميرا:  $cameraSize",
          style: propertiesStyle,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          "المعالج:$cpuSize",
          style: propertiesStyle,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }

  Row _buildBatteryRow({
    String battery = '   ',
    String memory = '    ',
  }) {
    return Row(
      children: <Widget>[
        Text(
          "البطارية:  $battery",
          style: propertiesStyle,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          "الذاكرة:$cpuSize",
          style: propertiesStyle,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }

  Row _buildPriceRow({
    String price = '    ',
    String networkStructure = '  ',
  }) {
    return Row(
      children: <Widget>[
        Text(
          "السعر:  $price",
          style: propertiesStyle,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          "الشبكة:$networkStructure",
          style: propertiesStyle,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
