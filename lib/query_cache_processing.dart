import 'package:cloud_firestore/cloud_firestore.dart';

Future<QuerySnapshot> getQuery(Query query) async{
  try {
    QuerySnapshot qs = await query.get(GetOptions(source: Source.cache));
    if (qs.docs.isEmpty) {
      return query.get(GetOptions(source: Source.server));
    }
    return qs;
  } catch (_) {
    return query.get(GetOptions(source: Source.server));
  }
}