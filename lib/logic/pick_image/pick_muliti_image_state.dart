part of 'pick_muliti_image_cubit.dart';

@immutable
abstract class PickMultipleImageState {}

class PickMultipleImageInitial extends PickMultipleImageState {}
class PickMultipleImageLoading extends PickMultipleImageState {}
class PickMultipleImageSuccess extends PickMultipleImageState {}
class PickMultipleImageError extends PickMultipleImageState {
   final String error;
   PickMultipleImageError(this.error);
}
