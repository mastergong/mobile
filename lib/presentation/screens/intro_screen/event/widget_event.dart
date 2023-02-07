import 'package:flutter/foundation.dart';

import '../../../../core/local/key_value_storage_base.dart';
import '../../../routes/app_router.dart';
import '../../../routes/routes.dart';

void onDonePress() {
  KeyValueStorageBase().setEncrypted('firstApp', '1');
  AppRouter.popAndPushNamed(Routes.loginScreenRoute);
}
