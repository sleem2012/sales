import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'pick_muliti_image_state.dart';

class PickMultipleImageCubit extends Cubit<PickMultipleImageState> {
  PickMultipleImageCubit() : super(PickMultipleImageInitial());

  static PickMultipleImageCubit of(context) => BlocProvider.of<PickMultipleImageCubit>(context);

  final ImagePicker imagePicker = ImagePicker();

  List<XFile>? imageFileList = [];

  Future<List<XFile>?> selectImages() async {
    try {
      final List<XFile> selectedImages = await imagePicker.pickMultiImage();
      if (selectedImages.isNotEmpty) {
        imageFileList!.addAll(selectedImages);
        emit(PickMultipleImageSuccess());
        return selectedImages;
      }
    } catch (e) {
      emit(PickMultipleImageError(e.toString()));
    }
    return imageFileList;
  }
}
