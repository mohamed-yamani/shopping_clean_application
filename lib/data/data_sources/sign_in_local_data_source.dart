import 'package:hive/hive.dart';
import 'package:petshop/data/tables/convert_token_table.dart';
import 'package:petshop/domain/entites/convert_token_entity.dart';

abstract class SessionLocalDataSource {
  Future<void> saveNewSession(ConvertTokenTable newSession);
  Future<ConvertTokenTable> getSession();
  Future<void> deleteSession();
  Future<bool> checkIfSessionExists();
}

class SessionLocalDataSourceImpl extends SessionLocalDataSource {
  @override
  Future<bool> checkIfSessionExists() async {
    late final Box sessionBox;
    if (Hive.isBoxOpen('sessionBox')) {
      sessionBox = Hive.box('sessionBox');
    } else {
      sessionBox = await Hive.openBox('sessionBox');
    }
    return sessionBox.isNotEmpty;
  }

  @override
  Future<void> deleteSession() async {
    late final Box sessionBox;
    if (Hive.isBoxOpen('sessionBox')) {
      sessionBox = Hive.box('sessionBox');
    } else {
      sessionBox = await Hive.openBox('sessionBox');
    }
    sessionBox.delete(0);
  }

  @override
  Future<ConvertTokenTable> getSession() async {
    late final Box sessionBox;
    if (Hive.isBoxOpen('sessionBox')) {
      sessionBox = Hive.box('sessionBox');
    } else {
      sessionBox = await Hive.openBox('sessionBox');
    }
    return sessionBox.get(0);
  }

  @override
  Future<void> saveNewSession(ConvertTokenEntity newSession) async {
    late final Box sessionBox;
    if (Hive.isBoxOpen('sessionBox')) {
      sessionBox = Hive.box('sessionBox');
    } else {
      sessionBox = await Hive.openBox('sessionBox');
    }
    sessionBox.put(0, newSession);
  }
}
