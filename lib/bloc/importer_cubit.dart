import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:path/path.dart' as p;
import 'importer_state.dart';

class ImporterCubit extends Cubit<ImporterState> {
  ImporterCubit() : super(ImporterState());

  void importAll({
    required bool isFileGrouping,
    required bool isRawGrouping,
  }) async {
    // import photos
    if (state.imgSrc != null && state.finalDest != null) {
      _importPhotos(
        imgSrc: state.imgSrc!,
        finalDest: state.finalDest!,
        isFileGrouping: isFileGrouping,
        isRawGrouping: isRawGrouping,
      );
    }

    if (state.videoSrc != null && state.finalDest != null) {
      _importVideos(
        videoSrc: state.videoSrc!,
        finalDest: state.finalDest!,
        isFileGrouping: isFileGrouping,
      );
    }
  }

  void _importPhotos({
    required String imgSrc,
    required String finalDest,
    bool isFileGrouping = true,
    bool isRawGrouping = true,
  }) async {
    var src = Directory(imgSrc);
    var dest = Directory(p.join(finalDest, isFileGrouping ? 'Photos' : ''));
    late Directory rawDir;
    late Directory jpgDir;

    await src.create(recursive: true);
    await dest.create(recursive: true);
    if (isFileGrouping && isRawGrouping) {
      rawDir = Directory(p.join(dest.path, 'RAW'));
      jpgDir = Directory(p.join(dest.path, 'JPG'));
      await rawDir.create();
      await jpgDir.create();
    }

    void copyGroupByType(File entity) async {
      var File(:path) = entity;
      if (p.extension(path) == '.ARW') {
        await entity.absolute.copy(p.join(rawDir.path, p.basename(path)));
      } else {
        await entity.absolute.copy(p.join(jpgDir.path, p.basename(path)));
      }
    }

    void copyFile(File entity) async {
      await entity.absolute.copy(p.join(dest.path, p.basename(entity.path)));
    }

    src.listSync().whereType<File>().forEach(
      (entity) {
        try {
          isFileGrouping && isRawGrouping
              ? copyGroupByType(entity)
              : copyFile(entity);
        } catch (e) {
          print(e);
        }
      },
    );
    print('Import photos completed!');
  }

  void _importVideos({
    required String videoSrc,
    required String finalDest,
    bool isFileGrouping = true,
  }) async {
    var src = Directory(videoSrc);
    var dest = Directory(p.join(finalDest, isFileGrouping ? 'Videos' : ''));

    await src.create(recursive: true);
    await dest.create(recursive: true);

    src.listSync().whereType<File>().forEach(
      (entity) async {
        try {
          var File(:path) = entity;
          if (p.extension(path) == '.MP4') {
            await entity.absolute.copy(p.join(dest.path, p.basename(path)));
          }
        } catch (e) {
          print(e);
        }
      },
    );
    print('Import videos completed!');
  }
}
