import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:path/path.dart' as p;
import 'importer_state.dart';

class ImporterCubit extends Cubit<ImporterState> {
  ImporterCubit() : super(ImporterState());

  void importAll() async {
    // import photos
    if (state.imgSrc != null && state.finalDest != null) {
      _importPhotos(imgSrc: state.imgSrc!, finalDest: state.finalDest!);
    }

    if (state.videoSrc != null && state.finalDest != null) {
      _importVideos(videoSrc: state.videoSrc!, finalDest: state.finalDest!);
    }
  }

  void _importPhotos(
      {required String imgSrc, required String finalDest}) async {
    var src = Directory(imgSrc);
    var dest = Directory(p.join(finalDest, 'Photos'));

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
      {required String videoSrc, required String finalDest}) async {
    var src = Directory(videoSrc);
    var dest = Directory(p.join(finalDest, 'Videos'));

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
