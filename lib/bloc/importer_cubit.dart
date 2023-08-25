import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:path/path.dart' as p;
import 'importer_state.dart';

class ImporterCubit extends Cubit<ImporterState> {
  ImporterCubit() : super(ImporterState());

  void importAll() async {
    // import photos
    if (state.imgSrc != null && state.imgDest != null) {
      _importPhotos(imgSrc: state.imgSrc!, imgDest: state.imgDest!);
    }

    if (state.videoSrc != null && state.videoDest != null) {
      _importVideos(videoSrc: state.videoSrc!, videoDest: state.videoDest!);
    }
  }

  void _importPhotos({required String imgSrc, required String imgDest}) async {
    var src = Directory(imgSrc);
    var dest = Directory(p.join(imgDest, 'Photos'));

    if (!src.existsSync()) await src.create(recursive: true);
    if (!dest.existsSync()) await dest.create(recursive: true);

    src.listSync().whereType<File>().forEach((entity) {
      var File(:path) = entity;
      if (p.extension(path) == '.ARW') {
        var rawDir = Directory(p.join(dest.path, 'RAW'));
        if (!rawDir.existsSync()) rawDir.create();
        entity.absolute.copy(p.join(rawDir.path, p.basename(path)));
      } else {
        var jpgDir = Directory(p.join(dest.path, 'JPG'));
        if (!jpgDir.existsSync()) jpgDir.create();
        entity.absolute.copy(p.join(jpgDir.path, p.basename(path)));
      }
    });
    print('Import photos completed!');
  }

  void _importVideos(
      {required String videoSrc, required String videoDest}) async {
    var src = Directory(videoSrc);
    var dest = Directory(p.join(videoDest, 'Videos'));

    if (!src.existsSync()) await src.create(recursive: true);
    if (!dest.existsSync()) await dest.create(recursive: true);

    src.listSync().whereType<File>().forEach(
      (entity) {
        var File(:path) = entity;
        if (p.extension(path) == '.MP4') {
          entity.absolute.copy(p.join(dest.path, p.basename(path)));
        }
      },
    );
    print('Import videos completed!');
  }
}
