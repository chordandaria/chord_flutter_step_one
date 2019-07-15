import 'package:flutter/material.dart';
import 'api_url.dart';
import 'bean/userinfo_bean.dart';
import 'netfactory.dart';
import 'package:chord_flutter_step_one/bean/index_bean.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:chord_flutter_step_one/bean/member_list_bean.dart';
import 'reserve_list_activity.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nogizaka46',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'IndexHomePage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List pageList = [
    IndexPage(),
    MessageParkPage()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("首页")),
            BottomNavigationBarItem(icon: Icon(Icons.message),title: Text("消息"))
          ]),
    );
  }
}

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IndexPage();
  }
}

class _IndexPage extends State<IndexPage> {
  UserInfoBean userInfo ;
  List<SlidersBean> _sliders = List<SlidersBean>();
  List<SectionsBean> _sections = List<SectionsBean>();
  bool _isSelect = false;

  void requestData(){
    getUserInfo();
    getIndexInfo();
  }

  void getUserInfo() async {
    await NetFactory().dio.get(USERINFO).then((response){
      if(response.data["state"] == 200){
        setState(() {
          userInfo = UserInfoBean.fromJson(response.data);
        });
      }
    });
  }

  Future<void> getIndexInfo() async {
    await NetFactory().dio.get(INDEXINFO).then((response){
      if(response.data["state"] == 200){
          IndexBean temp = IndexBean.fromJson(response.data["data"]);
          setState(() {
            _sliders = temp.sliders;
            _sections = temp.sections;
          });
      }
    });
  }

  List<Widget> getIndexList(){
    List<Widget> temp = new List();
    if(_sections !=null){
      _sections.forEach((item){
        if(item.type == "grid"){
          temp.add(getGridView(item));
        }else if(item.type == "image"){
          temp.add(Container(height: 120,child: Image.network(item.image,fit: BoxFit.fill,),));
        }
      });
    }

    return temp;
  }

  Widget getGridView(SectionsBean bean){
    return GridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
      padding: EdgeInsets.all(1.0),
      childAspectRatio: 1.0,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: getGridItems(bean.icons),
    );
  }

  List<Widget> getGridItems(List<IconsBean> items){
    return items.map((item) => getGridChild(item)).toList();
  }

  Widget getGridChild(IconsBean item){
    return GestureDetector(
      child: Card(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(image: NetworkImage(item.image),width: 23.0,height: 23.0,),
              Container(
                margin: EdgeInsets.only(top: 3.0),
                child: Text(item.title),
              )
            ],
          ),
        ),
      ),
      onTap: (){
        switch(item.type){
          case "reserve":
//            Navigator.push(context, MaterialPageRoute(builder: (context) => GroupEventPage()));
//            Scaffold.of(context).showSnackBar(SnackBar(content: Text(item.toString()),duration: Duration(seconds: 2),));
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReserveListPage()));
            break;
        }
      },
    );
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(userInfo == null? "null":userInfo.data.name),
              accountEmail: Text(userInfo == null? "null":userInfo.data.mail),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(userInfo == null? "http://caunion.cdn.gongjiayun.cn/FtDeZYV5PFVJaSeat2mYyhPZPcIM":userInfo.data.avater)),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("首页"),
        centerTitle: true,),
      body: RefreshIndicator(child:  ListView(
        children: <Widget>[
          Container(height: 200,
            child: Swiper(
              itemCount: _sliders.length,viewportFraction: 0.8,scale: 0.9,itemBuilder: (BuildContext context,int index){
              return Image.network(_sliders[index].image,fit: BoxFit.fill,);
            },
              autoplay: true,),),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: getIndexList(),
          )
        ],
      ), onRefresh: getIndexInfo),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          _isSelect = !_isSelect;
        });
      },child: Icon(Icons.android,color: _isSelect?Colors.red:Colors.white,),),
    );
  }
}

class MessageParkPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MessageParkPage();
  }
}

class _MessageParkPage extends State<MessageParkPage> {
  MemberlistBean _dateBean;

  void requestData() async {
    await NetFactory().dio.get(MEMBERLIST).then((response){
      if(response.data["state"] == 200){
        setState(() {
          _dateBean = MemberlistBean.fromJson(response.data);
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

  Widget getCardInfo(int index){
    return Container(
      margin: EdgeInsets.only(top: 15,bottom: 15),
      child: Image.network(_dateBean.data[index].avater,fit: BoxFit.contain,),);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("消息"),
        centerTitle: true,),
      body: Swiper(itemCount: _dateBean == null? 0:_dateBean.data.length,viewportFraction: 0.8,scale: 0.9,autoplay: true,duration: 2000,autoplayDelay: 5000,itemBuilder: (BuildContext context,int index) => getCardInfo(index),),
    );
  }
}