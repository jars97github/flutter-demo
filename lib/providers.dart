import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login/login_view_model.dart';

final loginProvider = ChangeNotifierProvider((ref) => LoginViewModel());