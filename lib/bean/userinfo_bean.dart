class UserInfoBean {
  int _state;
  UserInfoDataBean _data;

  UserInfoBean({int state, UserInfoDataBean data}) {
    this._state = state;
    this._data = data;
  }

  int get state => _state;
  set state(int state) => _state = state;
  UserInfoDataBean get data => _data;
  set data(UserInfoDataBean data) => _data = data;

  UserInfoBean.fromJson(Map<String, dynamic> json) {
    _state = json['state'];
    _data = json['data'] != null ? new UserInfoDataBean.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this._state;
    if (this._data != null) {
      data['data'] = this._data.toJson();
    }
    return data;
  }
}

class UserInfoDataBean {
  String _name;
  int _age;
  int _phone;
  String _mail;
  String _avater;

  UserInfoDataBean({String name, int age, int phone, String mail, String avater}) {
    this._name = name;
    this._age = age;
    this._phone = phone;
    this._mail = mail;
    this._avater = avater;
  }

  String get name => _name;
  set name(String name) => _name = name;
  int get age => _age;
  set age(int age) => _age = age;
  int get phone => _phone;
  set phone(int phone) => _phone = phone;
  String get mail => _mail;
  set mail(String mail) => _mail = mail;
  String get avater => _avater;
  set avater(String avater) => _avater = avater;

  UserInfoDataBean.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _age = json['age'];
    _phone = json['phone'];
    _mail = json['mail'];
    _avater = json['avater'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['age'] = this._age;
    data['phone'] = this._phone;
    data['mail'] = this._mail;
    data['avater'] = this._avater;
    return data;
  }
}