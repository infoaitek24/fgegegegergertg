import '../database.dart';

class NameServerTable extends SupabaseTable<NameServerRow> {
  @override
  String get tableName => 'name_server';

  @override
  NameServerRow createRow(Map<String, dynamic> data) => NameServerRow(data);
}

class NameServerRow extends SupabaseDataRow {
  NameServerRow(super.data);

  @override
  SupabaseTable get table => NameServerTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get url => getField<String>('url');
  set url(String? value) => setField<String>('url', value);
}
