import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:petshop/data/tables/product_table.dart';
import 'package:petshop/presentation/widgets/ecommerce_app.dart';
// import 'package:pedantic/pedantic.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'di/get_it.dart' as get_it;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(ProductTableAdapter());
  unawaited(get_it.init());
  runApp(const EcommerceApp());
}
