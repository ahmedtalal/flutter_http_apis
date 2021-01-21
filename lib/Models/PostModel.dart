class PostModel {
  int _Id ;
  int _UserId ;
  String _Title ;
  String _Body ;


  PostModel(this._Id,this._UserId,this._Title,this._Body);

  factory PostModel.fromJson(Map<String,dynamic> json){
    return PostModel(json["id"], json["userId"], json["title"], json["body"]) ;
  }
  int get Id => _Id;

  set Id(int value) {
    _Id = value;
  }

  int get UserId => _UserId;

  String get Body => _Body;

  set Body(String value) {
    _Body = value;
  }

  String get Title => _Title;

  set Title(String value) {
    _Title = value;
  }

  set UserId(int value) {
    _UserId = value;
  }
}