import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/values/sizeconfig.dart';
import 'package:bs_assignment/di/injectable.dart';
import 'package:bs_assignment/environment/build_config.dart';
import 'package:bs_assignment/environment/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: Env.fileName);
  Env.loadBuildConfig();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
    statusBarColor: AppColor.primaryOne4B9EFF,  // Change this to your desired color
    statusBarIconBrightness: Brightness.light,  // For white icons
    statusBarBrightness: Brightness.dark,  // For dark icons (iOS)
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
  ]).then((_) async {
    await initHiveStorage();
    await configureDependencies();
    runApp(const MyApp());
  });
}

Future initHiveStorage() async {
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  return Hive.init(appDocumentDirectory.path);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return getIt<GetMaterialApp>();
          },
        );
      },
    );
  }
}
