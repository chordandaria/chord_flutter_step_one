class MemberlistBean {
  List<MemberDataBean> _data;

  MemberlistBean({List<MemberDataBean> data}) {
    this._data = data;
  }

  List<MemberDataBean> get data => _data;
  set data(List<MemberDataBean> data) => _data = data;

  MemberlistBean.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = new List<MemberDataBean>();
      json['data'].forEach((v) {
        _data.add(new MemberDataBean.fromJson(v));
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

class MemberDataBean {
  String _name;
  int _age;
  String _birth;
  String _avater;

  MemberDataBean({String name, int age, String birth, String avater}) {
    this._name = name;
    this._age = age;
    this._birth = birth;
    this._avater = avater;
  }

  String get name => _name;
  set name(String name) => _name = name;
  int get age => _age;
  set age(int age) => _age = age;
  String get birth => _birth;
  set birth(String birth) => _birth = birth;
  String get avater => _avater;
  set avater(String avater) => _avater = avater;

  MemberDataBean.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _age = json['age'];
    _birth = json['birth'];
    _avater = json['avater'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['age'] = this._age;
    data['birth'] = this._birth;
    data['avater'] = this._avater;
    return data;
  }
}