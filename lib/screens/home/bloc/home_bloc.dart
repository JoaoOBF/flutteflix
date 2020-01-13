import 'package:flutteflix/data/repository/omdb_repository.dart';
import 'package:flutteflix/model/omdb.dart';
import 'package:flutteflix/model/search.dart';
import 'package:rxdart/rxdart.dart';

class ApplicationBloc {
  final OMDBRepository _repository = OMDBRepository();
  final BehaviorSubject<List<Search>> _subject =
      BehaviorSubject<List<Search>>();
  List<Search> _list;

  ApplicationBloc() {
    getOMDB();
  }

  getOMDB() async {
    _list = List();
    OMDB response1 = await _repository.getOMDB(s: 'batman');
    _verify(response1);
    OMDB response2 = await _repository.getOMDB(s: 'avengers');
    _verify(response2);
    OMDB response3 = await _repository.getOMDB(s: 'star');
    _verify(response3);
    _subject.sink.add(_list..shuffle());
  }

  _verify(OMDB omdb) {
    if (omdb?.response == "True") {
      _list.addAll(omdb.search);
    }
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<Search>> get subject => _subject;
}
