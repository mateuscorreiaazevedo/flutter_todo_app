import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/core/database/app_database.dart';

final driftProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});
