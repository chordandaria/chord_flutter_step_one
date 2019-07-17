class NewsListBean {
  List<NewsDataBean> _data;

  NewsListBean({List<NewsDataBean> data}) {
    this._data = data;
  }

  List<NewsDataBean> get data => _data;
  set data(List<NewsDataBean> data) => _data = data;

  NewsListBean.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = new List<NewsDataBean>();
      json['data'].forEach((v) {
        _data.add(new NewsDataBean.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewsDataBean {
  String _title;
  String _content;
  String _url;

  NewsDataBean({String title, String content, String url}) {
    this._title = title;
    this._content = content;
    this._url = url;
  }

  String get title => _title;
  set title(String title) => _title = title;
  String get content => _content;
  set content(String content) => _content = content;
  String get url => _url;
  set url(String url) => _url = url;

  NewsDataBean.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _content = json['content'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['content'] = this._content;
    data['url'] = this._url;
    return data;
  }
}