import 'package:flutter/material.dart';
import 'package:chord_flutter_step_one/bean/reserve_list_bean.dart';
import 'netfactory.dart';
import 'api_url.dart';


class ReserveListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ReserveListPage();
  }
}

class _ReserveListPage extends State<ReserveListPage> {
  ReserveListBean _data ;
  
  void requestData() async {
    await NetFactory().dio.get(RESERVES).then((response){
      if(response.data["state"] == 200){
        setState(() {
          _data = ReserveListBean.fromJson(response.data);
        });
      }
    });
  }

  List<Widget> getLists(){
    if(_data == null){
      return List<Widget> ();
    }else{
      return _data.data.map((item) => getItemList(item)).toList();
    }

  }

  Widget getItemList(ReserveDataBean item){
    return Column(
      children: <Widget>[
        Text(item.date),
        Card(
          margin: EdgeInsets.all(10),
          child: ListView(
            children: getListItems(item),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        )
      ],
    );
  }

  List<Widget> getListItems(ReserveDataBean item){
    return item.event.map((item) => getItem(item)).toList();
  }

  Widget getItem(ReserveEventBean item){
    return ListTile(title: Text(item.title),);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestData();
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("活动行程"),),
      body: ListView(
        children: getLists(),
      ),
    );
  }
}