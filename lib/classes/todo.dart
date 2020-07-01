class ToDo {

  int _id;
  String _task;

  ToDo(this._task);

  int get id => _id;
  String get task => _task;

  set task(String newTask) {
    this._task = newTask;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['id'] = _id;
    map['task'] = _task;

    return map;
  }

  ToDo.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._task = map['task'];
  }
}