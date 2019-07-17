import 'package:flutter/material.dart';
import 'api_url.dart';
import 'bean/news_bean.dart';
import 'netfactory.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsListPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewsListPage();
  }

}

class _NewsListPage extends State<NewsListPage>{
  List<NewsDataBean> _data = List<NewsDataBean>();

  Future<void> requestData() async {
    await NetFactory().dio.get(NEWSLIST).then((response){
      if(response.data["state"] == 200){
        setState(() {
          NewsListBean temp = NewsListBean.fromJson(response.data);
          _data = temp.data;
        });
      }
    });
  }


  @override
  void initState() {
    requestData();
  }

  List<Widget> getListItems(){
    return _data.map((item) => getItem(item)).toList();
  }


  Widget getItem(NewsDataBean item){
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsWebPage("https://blog.csdn.net/dalong3976/article/details/87628183")));
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        padding:EdgeInsets.all(15.0),
        child: Column(
        children: <Widget>[
          Text(item.title,style: TextStyle(fontSize: 15.0),maxLines: 2,overflow: TextOverflow.ellipsis,),
          Text(item.content,maxLines: 2,softWrap: true,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 10.0),)
        ],
      ),),);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("新闻速报"),),
      body: RefreshIndicator(
          child: _data.length == 0? Center(
            child: Text("没有数据"),
          ):ListView(
            children: getListItems(),
          ),
          onRefresh: requestData),
    );
  }
}

class NewsWebPage extends StatefulWidget {

  String url;

  NewsWebPage(this.url);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewsWebPage(url);
  }
}

class _NewsWebPage extends State<NewsWebPage> with SingleTickerProviderStateMixin {
  String url;

  final FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  _NewsWebPage(this.url);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebviewScaffold(
        appBar: AppBar(title: Text("News"),),
        url: url,
        withZoom: true,
      withLocalStorage: true,
      withJavascript: true,
      hidden: true,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

}
