class IndexBean {
  List<SlidersBean> _sliders;
  List<SectionsBean> _sections;

  IndexBean({List<SlidersBean> sliders, List<SectionsBean> sections}) {
    this._sliders = sliders;
    this._sections = sections;
  }

  List<SlidersBean> get sliders => _sliders;
  set sliders(List<SlidersBean> sliders) => _sliders = sliders;
  List<SectionsBean> get sections => _sections;
  set sections(List<SectionsBean> sections) => _sections = sections;

  IndexBean.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      _sliders = new List<SlidersBean>();
      json['sliders'].forEach((v) {
        _sliders.add(new SlidersBean.fromJson(v));
      });
    }
    if (json['sections'] != null) {
      _sections = new List<SectionsBean>();
      json['sections'].forEach((v) {
        _sections.add(new SectionsBean.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._sliders != null) {
      data['sliders'] = this._sliders.map((v) => v.toJson()).toList();
    }
    if (this._sections != null) {
      data['sections'] = this._sections.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SlidersBean {
  Null _link;
  String _image;
  int _index;
  String _title;

  SlidersBean({Null link, String image, int index, String title}) {
    this._link = link;
    this._image = image;
    this._index = index;
    this._title = title;
  }

  Null get link => _link;
  set link(Null link) => _link = link;
  String get image => _image;
  set image(String image) => _image = image;
  int get index => _index;
  set index(int index) => _index = index;
  String get title => _title;
  set title(String title) => _title = title;

  SlidersBean.fromJson(Map<String, dynamic> json) {
    _link = json['link'];
    _image = json['image'];
    _index = json['index'];
    _title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this._link;
    data['image'] = this._image;
    data['index'] = this._index;
    data['title'] = this._title;
    return data;
  }
}

class SectionsBean {
  String _type;
  List<IconsBean> _icons;
  String _title;
  String _image;

  SectionsBean({String type, List<IconsBean> icons, String title,String image}) {
    this._type = type;
    this._icons = icons;
    this._title = title;
    this._image = image;
  }

  String get type => _type;
  set type(String type) => _type = type;
  List<IconsBean> get icons => _icons;
  set icons(List<IconsBean> icons) => _icons = icons;
  String get title => _title;
  set title(String title) => _title = title;
  String get image => _image;
  set image(String image) => _image =image;

  SectionsBean.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    if (json['icons'] != null) {
      _icons = new List<IconsBean>();
      json['icons'].forEach((v) {
        _icons.add(new IconsBean.fromJson(v));
      });
    }
    _title = json['title'];
    _image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    if (this._icons != null) {
      data['icons'] = this._icons.map((v) => v.toJson()).toList();
    }
    data['title'] = this._title;
    data['image'] = this._image;
    return data;
  }
}

class IconsBean {
  String _type;
  String _image;
  String _title;

  IconsBean({String type, String image, String title}) {
    this._type = type;
    this._image = image;
    this._title = title;
  }

  String get type => _type;
  set type(String type) => _type = type;
  String get image => _image;
  set image(String image) => _image = image;
  String get title => _title;
  set title(String title) => _title = title;

  IconsBean.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _image = json['image'];
    _title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['image'] = this._image;
    data['title'] = this._title;
    return data;
  }
}