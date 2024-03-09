import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://sgtalkxwzqwfmuyvxocy.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNndGFsa3h3enF3Zm11eXZ4b2N5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDk1NTA2NjgsImV4cCI6MjAyNTEyNjY2OH0.UOZof4cQMVdLBzXI3NQcS7Upntbi9bhRTpw100_Xigk';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
