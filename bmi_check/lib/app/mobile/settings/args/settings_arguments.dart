import 'package:bmi_check/app/mobile/settings/settings_height/enum/height_metrics_enum.dart';
import 'package:bmi_check/app/mobile/settings/settings_weight/enum/weight_metrics_enum.dart';

class SettingsArguments {
  final HeightMetrics heightMetrics;
  final WeightMetrics weightMetrics;

  SettingsArguments({
    required this.weightMetrics,
    required this.heightMetrics,
  });
}
