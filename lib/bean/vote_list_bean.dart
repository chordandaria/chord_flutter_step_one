class VoteListBean {
  List<VoteDataBean> _data;

  VoteListBean({List<VoteDataBean> data}) {
    this._data = data;
  }

  List<VoteDataBean> get data => _data;
  set data(List<VoteDataBean> data) => _data = data;

  VoteListBean.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = new List<VoteDataBean>();
      json['data'].forEach((v) {
        _data.add(new VoteDataBean.fromJson(v));
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

class VoteDataBean {
  String _title;
  String _cover;
  int _maxPoll;
  String _description;
  int _isPublished;
  String _startTime;
  String _endTime;
  String _createdAt;
  String _updatedAt;
  Null _deletedAt;
  int _hits;
  int _maxSingleItem;
  int _voteOptionsCount;
  int _voteValuesCount;
  int _expire;
  int _partakeCount;
  int _accumulativeCount;
  List<VoteOptions> _voteOptions;

  VoteDataBean(
      {String title,
        String cover,
        int maxPoll,
        String description,
        int isPublished,
        String startTime,
        String endTime,
        String createdAt,
        String updatedAt,
        Null deletedAt,
        int hits,
        int maxSingleItem,
        int voteOptionsCount,
        int voteValuesCount,
        int expire,
        int partakeCount,
        int accumulativeCount,
        List<VoteOptions> voteOptions}) {
    this._title = title;
    this._cover = cover;
    this._maxPoll = maxPoll;
    this._description = description;
    this._isPublished = isPublished;
    this._startTime = startTime;
    this._endTime = endTime;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._deletedAt = deletedAt;
    this._hits = hits;
    this._maxSingleItem = maxSingleItem;
    this._voteOptionsCount = voteOptionsCount;
    this._voteValuesCount = voteValuesCount;
    this._expire = expire;
    this._partakeCount = partakeCount;
    this._accumulativeCount = accumulativeCount;
    this._voteOptions = voteOptions;
  }

  String get title => _title;
  set title(String title) => _title = title;
  String get cover => _cover;
  set cover(String cover) => _cover = cover;
  int get maxPoll => _maxPoll;
  set maxPoll(int maxPoll) => _maxPoll = maxPoll;
  String get description => _description;
  set description(String description) => _description = description;
  int get isPublished => _isPublished;
  set isPublished(int isPublished) => _isPublished = isPublished;
  String get startTime => _startTime;
  set startTime(String startTime) => _startTime = startTime;
  String get endTime => _endTime;
  set endTime(String endTime) => _endTime = endTime;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;
  Null get deletedAt => _deletedAt;
  set deletedAt(Null deletedAt) => _deletedAt = deletedAt;
  int get hits => _hits;
  set hits(int hits) => _hits = hits;
  int get maxSingleItem => _maxSingleItem;
  set maxSingleItem(int maxSingleItem) => _maxSingleItem = maxSingleItem;
  int get voteOptionsCount => _voteOptionsCount;
  set voteOptionsCount(int voteOptionsCount) =>
      _voteOptionsCount = voteOptionsCount;
  int get voteValuesCount => _voteValuesCount;
  set voteValuesCount(int voteValuesCount) =>
      _voteValuesCount = voteValuesCount;
  int get expire => _expire;
  set expire(int expire) => _expire = expire;
  int get partakeCount => _partakeCount;
  set partakeCount(int partakeCount) => _partakeCount = partakeCount;
  int get accumulativeCount => _accumulativeCount;
  set accumulativeCount(int accumulativeCount) =>
      _accumulativeCount = accumulativeCount;
  List<VoteOptions> get voteOptions => _voteOptions;
  set voteOptions(List<VoteOptions> voteOptions) => _voteOptions = voteOptions;

  VoteDataBean.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _cover = json['cover'];
    _maxPoll = json['max_poll'];
    _description = json['description'];
    _isPublished = json['is_published'];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    _hits = json['hits'];
    _maxSingleItem = json['max_single_item'];
    _voteOptionsCount = json['vote_options_count'];
    _voteValuesCount = json['vote_values_count'];
    _expire = json['expire'];
    _partakeCount = json['partake_count'];
    _accumulativeCount = json['accumulative_count'];
    if (json['vote_options'] != null) {
      _voteOptions = new List<VoteOptions>();
      json['vote_options'].forEach((v) {
        _voteOptions.add(new VoteOptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['cover'] = this._cover;
    data['max_poll'] = this._maxPoll;
    data['description'] = this._description;
    data['is_published'] = this._isPublished;
    data['start_time'] = this._startTime;
    data['end_time'] = this._endTime;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['deleted_at'] = this._deletedAt;
    data['hits'] = this._hits;
    data['max_single_item'] = this._maxSingleItem;
    data['vote_options_count'] = this._voteOptionsCount;
    data['vote_values_count'] = this._voteValuesCount;
    data['expire'] = this._expire;
    data['partake_count'] = this._partakeCount;
    data['accumulative_count'] = this._accumulativeCount;
    if (this._voteOptions != null) {
      data['vote_options'] = this._voteOptions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VoteOptions {
  int _id;
  int _companyId;
  String _title;
  String _description;
  int _voteId;
  int _baseCount;
  int _sort;
  String _cover;
  Null _deletedAt;
  String _createdAt;
  String _updatedAt;
  int _voteCount;

  VoteOptions(
      {int id,
        int companyId,
        String title,
        Null description,
        int voteId,
        int baseCount,
        int sort,
        String cover,
        Null deletedAt,
        String createdAt,
        String updatedAt,
        int voteCount}) {
    this._id = id;
    this._companyId = companyId;
    this._title = title;
    this._description = description;
    this._voteId = voteId;
    this._baseCount = baseCount;
    this._sort = sort;
    this._cover = cover;
    this._deletedAt = deletedAt;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._voteCount = voteCount;
  }

  int get id => _id;
  set id(int id) => _id = id;
  int get companyId => _companyId;
  set companyId(int companyId) => _companyId = companyId;
  String get title => _title;
  set title(String title) => _title = title;
  Null get description => _description;
  set description(Null description) => _description = description;
  int get voteId => _voteId;
  set voteId(int voteId) => _voteId = voteId;
  int get baseCount => _baseCount;
  set baseCount(int baseCount) => _baseCount = baseCount;
  int get sort => _sort;
  set sort(int sort) => _sort = sort;
  String get cover => _cover;
  set cover(String cover) => _cover = cover;
  Null get deletedAt => _deletedAt;
  set deletedAt(Null deletedAt) => _deletedAt = deletedAt;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;
  int get voteCount => _voteCount;
  set voteCount(int voteCount) => _voteCount = voteCount;

  VoteOptions.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _companyId = json['company_id'];
    _title = json['title'];
    _description = json['description'];
    _voteId = json['vote_id'];
    _baseCount = json['base_count'];
    _sort = json['sort'];
    _cover = json['cover'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['company_id'] = this._companyId;
    data['title'] = this._title;
    data['description'] = this._description;
    data['vote_id'] = this._voteId;
    data['base_count'] = this._baseCount;
    data['sort'] = this._sort;
    data['cover'] = this._cover;
    data['deleted_at'] = this._deletedAt;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['vote_count'] = this._voteCount;
    return data;
  }
}