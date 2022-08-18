import 'package:bonfire/bonfire.dart';

class MyGameController extends GameComponent {
  @override
  Future<void>? onLoad() {
    print(gameRef.player!.properties!.values);
    // TODO: implement onLoad
    return super.onLoad();
  }
}
