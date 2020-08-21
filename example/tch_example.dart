import 'dart:ffi';
import 'dart:io';

import 'package:tch/tch.dart' as tch;

final torch = tch.Torch(DynamicLibrary.open(_getPath()));
void main() {
  print(torch.atc_cuda_device_count());
}

String _getPath() {
  var path = '/usr/local/lib/python3.8/site-packages/torch/lib/libtorch.so';
  if (Platform.isMacOS) {
    path = '/usr/local/lib/python3.8/site-packages/torch/lib/libtorch.dylib';
  }
  if (Platform.isWindows) {
    path = '/usr/local/lib/python3.8/site-packages/torch/lib/libtorch.dll';
  }
  return path;
}
