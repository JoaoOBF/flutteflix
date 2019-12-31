import 'package:flutteflix/data/provider/omdb_provider.dart';
import 'package:flutteflix/model/omdb.dart';

class OMDBRepository {
  OMDBApiProvider _apiProvider = OMDBApiProvider();

  Future<OMDB> getOMDB({String s = "batman"}) {
    return _apiProvider.getUser(s: s);
  }
}
