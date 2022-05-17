import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mc_core_constants/mc_core_constants.dart';
import 'package:mini_campus_core/mini_campus_core.dart';
import 'package:mini_campus_core_libs/mini_campus_core_libs.dart';

import '../models/feedback_model.dart';

final fdbkProvider = Provider((_) => FeedbackService());

class FeedbackService {
  static final DetaRepository _detaRepository =
      DetaRepository(baseName: DetaBases.feedback, detaBaseUrl: detaBaseUrl);

  Future addFeedback(FeedbackModel data) async {
    try {
      final res = await _detaRepository.addBaseData(data.toMap());

      if (res is DetaRepositoryException) {
        throw res;
      }

      return res;
    }

    // er
    catch (e) {
      debugLogger(e, name: 'addFeedback');
    }

    return null;
  }
}
