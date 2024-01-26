import 'package:devicee/main_screen/Controllers/main_controller.dart';
import 'package:get/get.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  MainPage({super.key});
  MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0xfff5fffe),
      ),
      backgroundColor: const Color(0xfff5fffe),
      //backgroundColor: Colors.yellow.shade100,
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            physics:  const BouncingScrollPhysics(),
            child: Column(
              children: [
               const SizedBox(
                  height: 10,
                ),
                Container(
                  margin:const EdgeInsets.only(right: 20, left: 20),
                  width: Get.width,
                  height: 50,
                  child: Neumorphic(
                      style: NeumorphicStyle(
                          surfaceIntensity: 0.25,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(20)),
                          depth: 10,
                          lightSource: LightSource.topLeft,
                          color: Colors.white),
                      child:const Center(
                        child: Text(
                          'Device overview',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      )),
                ),
               const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SmallBox(
                      title: 'Android Version',
                      value: controller.android_version.value,
                      image: 'assets/android.png',
                    ),
                    SmallBox(
                        title: 'Device Name',
                        value: controller.device_name.value,
                        image: 'assets/emoji.png'),
                  ],
                ),
               const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SmallBox(
                        title: 'Battery Level',
                        value: controller.batterylevel.value,
                        image: 'assets/battery.png'),
                    SmallBox(
                        title: 'Battery Tempreture',
                        value: controller.batterytemp.value,
                        image: 'assets/temp.png'),
                  ],
                ),
               const SizedBox(
                  height: 25,
                ),
                Container(
                  width: Get.width,
                  margin:const EdgeInsets.only(right: 20, left: 20),
                  height: 50,
                  child: Neumorphic(
                      style: NeumorphicStyle(
                          surfaceIntensity: 0.25,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(20)),
                          depth: 10,
                          lightSource: LightSource.topLeft,
                          color: Colors.white),
                      child:const Center(
                        child: Text(
                          'Hardware info',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      )),
                ),
               const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SmallBox(
                      title: 'Memory',
                      value: controller.phisicalMemory.value,
                      image: 'assets/ram.png',
                    ),
                    SmallBox(
                        title: 'CPU core(s)',
                        value: controller.processor.value,
                        image: 'assets/cpu.png'),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FullWidthBox(
                        title: 'CPU Architecture',
                        value: controller.processorName.value,
                        image: 'assets/arch.png'),
                  ],
                ),
              const  SizedBox(
                  height: 25,
                ),
                Container(
                  margin:const EdgeInsets.only(right: 20, left: 20),
                  width: Get.width,
                  height: 50,
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        surfaceIntensity: 0.25,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20)),
                        depth: 10,
                        lightSource: LightSource.topLeft,
                        color: Colors.white),
                    child:const Center(
                      child: Text(
                        'Hard Drive',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                  ),
                ),
               const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SmallBox(
                      title: 'Total Disk Space',
                      value: controller.total_hard.value,
                      image: 'assets/hard.png',
                    ),
                    SmallBox(
                        title: 'Free Disk Space',
                        value: controller.free_hard.value,
                        image: 'assets/hard.png'),
                  ],
                ),
              const  SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SmallBox extends StatelessWidget {
  const SmallBox({
    super.key,
    required this.title,
    required this.value,
    required this.image,
  });

  final String title;
  final String value;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
          surfaceIntensity: 0.25,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
          depth: 10,
          lightSource: LightSource.topLeft,
          color: Colors.white),
      child: SizedBox(
        width: Get.width / 2 - 25,
        height: Get.width / 2 - 25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 35,
              height: 35,
              fit: BoxFit.fill,
            ),
          const  SizedBox(height: 10),
            Text(
              title,
              style:const TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              value,
              style:const TextStyle(
                  fontFamily: 'raya',
                  fontSize: 25,
                  color: Colors.purple,
                  letterSpacing: 2),
            ),
          ],
        ),
      ),
    );
  }
}

class FullWidthBox extends StatelessWidget {
  const FullWidthBox({
    super.key,
    required this.title,
    required this.value,
    required this.image,
  });

  final String title;
  final String value;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(right: 20, left: 20),
      child: Neumorphic(
        style: NeumorphicStyle(
            surfaceIntensity: 0.25,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
            depth: 10,
            lightSource: LightSource.topLeft,
            color: Colors.white),
        child: SizedBox(
          width: Get.width - 50,
          height: Get.width / 2 - 25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 35,
                height: 35,
                fit: BoxFit.fill,
              ),
             const SizedBox(height: 10),
              Text(
                title,
                style:const TextStyle(fontWeight: FontWeight.w500),
              ),
              //SizedBox(height: 10),
              Text(
                value,
                style:const TextStyle(
                    fontFamily: 'raya',
                    fontSize: 15,
                    color: Colors.purple,
                    letterSpacing: 2),
                overflow: TextOverflow.fade,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
