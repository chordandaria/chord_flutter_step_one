class ReserveListBean {
  List<ReserveDataBean> _data;

  ReserveListBean({List<ReserveDataBean> data}) {
    this._data = data;
  }

  List<ReserveDataBean> get data => _data;
  set data(List<ReserveDataBean> data) => _data = data;

  ReserveListBean.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = new List<ReserveDataBean>();
      json['data'].forEach((v) {
        _data.add(new ReserveDataBean.fromJson(v));
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

class ReserveDataBean {
  String _date;
  List<ReserveEventBean> _event;

  ReserveDataBean({String date, List<ReserveEventBean> event}) {
    this._date = date;
    this._event = event;
  }

  String get date => _date;
  set date(String date) => _date = date;
  List<ReserveEventBean> get event => _event;
  set event(List<ReserveEventBean> event) => _event = event;

  ReserveDataBean.fromJson(Map<String, dynamic> json) {
    _date = json['date'];
    if (json['event'] != null) {
      _event = new List<ReserveEventBean>();
      json['event'].forEach((v) {
        _event.add(new ReserveEventBean.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this._date;
    if (this._event != null) {
      data['event'] = this._event.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReserveEventBean {
  String _title;
  String _time;

  ReserveEventBean({String title, String time}) {
    this._title = title;
    this._time = time;
  }

  String get title => _title;
  set title(String title) => _title = title;
  String get time => _time;
  set time(String time) => _time = time;

  ReserveEventBean.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['time'] = this._time;
    return data;
  }
}