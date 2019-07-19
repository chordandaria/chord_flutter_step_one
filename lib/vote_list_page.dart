import 'package:flutter/material.dart';
import 'api_url.dart';
import 'netfactory.dart';
import 'bean/vote_list_bean.dart';
import 'package:flustars/flustars.dart';

class VoteListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VoteListPage();
  }
}

class _VoteListPage extends State<VoteListPage> {
  List<VoteDataBean> _data = List();
  
  void requestData() async {
    await NetFactory().dio.get(VOTELIST).then((response){
      if(response.data["state"] == 200){
        setState(() {
          _data = VoteListBean.fromJson(response.data).data;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    requestData();
  }

  List<Widget> getListItems(){
    return _data.map((item) => getItem(item)).toList();
  }

  Widget getItem(VoteDataBean item){

    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => VoteInfoPage(item)));
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0),border: Border.all(width: 1.0,color: Colors.black26)),
        margin: EdgeInsets.only(left: 15.0,right: 15.0,top: 10.0,bottom: 10.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 158.8,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(item.cover),fit: BoxFit.fill)
              ),
            ),
//            Image.network(item.cover,height:158.0,fit: BoxFit.fitWidth,),
            Container(margin: EdgeInsets.only(top: 10.0,bottom: 5.0),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15.0,right: 15.0),
            child: Text(item.title),),
            Container(padding: EdgeInsets.only(right: 15.0,left: 15.0,bottom: 10.0),
            alignment: Alignment.centerLeft,
            child: Text("活动时间:${DateUtil.formatDateStr(item.startTime,format: "yyyy-MM-dd")} - ${DateUtil.formatDateStr(item.endTime,format: "yyyy-MM-dd")}"),)
          ],
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
     appBar: AppBar(
       title: Text("相关投票"),
     ), 
      body: _data.length == 0? Container():ListView(
        children: getListItems(),
      ),
    );
  }
}

class VoteInfoPage extends StatefulWidget {
  VoteDataBean data;


  VoteInfoPage(this.data);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VoteInfoPage(data);
  }
}

class _VoteInfoPage extends State<VoteInfoPage> {
  VoteDataBean _data;
  _VoteInfoPage(this._data);

  List<Widget> getListItems(){
    print(SpUtil.getString("user",defValue: "no"));
    List<Widget> temp = List();
    temp.add(Container(
      height: 188.0,
      child: Stack(
        children: <Widget>[
          Container(decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(_data.cover),fit: BoxFit.fill)
          ),),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Color.fromARGB(100, 0, 0, 0),
              height: 30.0,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Padding(padding: EdgeInsets.only(left: 15.0,right: 15.0),child: Text(_data.title,style: TextStyle(color: Colors.white,fontSize: 14.0),),),
            ),
          )
        ],
      ),
    ));
    temp.add(Padding(padding: EdgeInsets.only(bottom: 5.0,),child: Row(children: <Widget>[
      Expanded(child:Container(color: Colors.white, child:Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 11.0,bottom: 11.0),child:Text("参与人数",style: TextStyle(fontSize: 13.0),) ,),
          Padding(padding: EdgeInsets.only(bottom: 11.0),child: Text("${_data.voteValuesCount}"),)
        ],
      ),),flex: 1,),
      Expanded(child:Container(color: Colors.white, child:Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 11.0,bottom: 11.0),child:Text("参与人数",style: TextStyle(fontSize: 13.0),) ,),
          Padding(padding: EdgeInsets.only(bottom: 11.0),child: Text("${_data.voteValuesCount}"),)
        ],
      ),),flex: 1,),
      Expanded(child:Container(color: Colors.white, child:Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 11.0,bottom: 11.0),child:Text("参与人数",style: TextStyle(fontSize: 13.0),) ,),
          Padding(padding: EdgeInsets.only(bottom: 11.0),child: Text("${_data.voteValuesCount}"),)
        ],
      ),),flex: 1,)
    ],)) ,)
       ;
//    _data.voteOptions.map(f)
    if(_data.voteOptions !=null ){
       temp.addAll(_data.voteOptions.map((item) =>getVoteOption(item)).toList());
    }

    return temp;
  }

  Widget getVoteOption(VoteOptions item){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 1.0),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(item.cover),),
        title: Text(item.title),
        subtitle: Text("${item.voteCount} 票"),
        trailing: InkWell(
          child: Container(
            decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(5.0)),
            width: 63.0,
            height: 25.0,
            alignment: Alignment.center,
            child: Text("投票",style: TextStyle(color: Colors.white),),
          ),
        ),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("投票详情"),),
      body: ListView(
        children: getListItems(),
      ),
    );
  }
}