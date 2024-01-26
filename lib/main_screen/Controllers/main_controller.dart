import 'package:battery_info/battery_info_plugin.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:system_info/system_info.dart';
import 'package:disk_space_plus/disk_space_plus.dart';

class MainController extends GetxController{
// ignore: non_constant_identifier_names
int GIGABYTE = 1024 * 1024 * 1024;

// ignore: non_constant_identifier_names
RxString android_version = ''.obs;
// ignore: non_constant_identifier_names
RxString device_name = ''.obs;
RxString batterylevel = ''.obs;
RxString batterytemp = ''.obs;
RxString phisicalMemory = ''.obs;
RxString processor = ''.obs;
RxString processorName = ''.obs;
// ignore: non_constant_identifier_names
RxString total_hard = ''.obs;
// ignore: non_constant_identifier_names
RxString free_hard = ''.obs;
Future<void> fetchInfo()async {
DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
android_version.value = androidInfo.version.release.toString();
device_name.value = androidInfo.model.toString();
// ignore: prefer_interpolation_to_compose_strings
phisicalMemory.value=((SysInfo.getTotalPhysicalMemory()/GIGABYTE).ceil()).toString()+ ' + '+(SysInfo.getTotalVirtualMemory()/GIGABYTE).ceil().toString()+" GB";
processor.value = SysInfo.processors.length.toString();
await DiskSpacePlus.getTotalDiskSpace.then((value){
  final val = value!~/1024;
  total_hard.value = '${val}GB';
});
await DiskSpacePlus.getFreeDiskSpace.then((value){
  final val = value!~/1024;
  free_hard.value = '${val}GB';
});
var processors = SysInfo.processors;
for (var processor in processors) {
   processorName.value = processor.name;
  }
}
void fetchBattery()async{
await BatteryInfoPlugin().androidBatteryInfo.then((value){
  batterylevel.value = '${value!.batteryLevel} %';
  batterytemp.value = '${value.temperature} C';
} );
}
  @override
  void onInit() {
    fetchInfo();
    fetchBattery();
    super.onInit();
  }  
}