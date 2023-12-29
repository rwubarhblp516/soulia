// 定制UI配置项
import 'fijkplayer_skin.dart';

class PlayerShowConfig implements ShowConfigAbs {
  bool drawerBtn = true;

  bool nextBtn = true;
  @override
  bool speedBtn = true;
  @override
  bool topBar = true;
  @override
  bool lockBtn = true;

  bool autoNext = true;
  @override
  bool bottomPro = true;
  @override
  bool stateAuto = true;

  bool isAutoPlay = false;
}
