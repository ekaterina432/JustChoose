
import 'package:cloud_firestore/cloud_firestore.dart';

Future<QuerySnapshot> getQuery(Query query, size) async{
  try {
    QuerySnapshot qs = await query.get(GetOptions(source: Source.cache));
    if (qs.docs.isEmpty || qs.docs.length < size) {
      print('from Server');
      return query.get(GetOptions(source: Source.server));
    }
    print('from Cache');
    return qs;
  } catch (_) {
    print('from Server');
    return query.get(GetOptions(source: Source.server));
  }
}