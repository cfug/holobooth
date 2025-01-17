part of 'photo_booth_bloc.dart';

abstract class PhotoBoothEvent extends Equatable {
  const PhotoBoothEvent();
  @override
  List<Object> get props => [];
}

class PhotoBoothRecordingStarted extends PhotoBoothEvent {
  const PhotoBoothRecordingStarted();
}

class PhotoBoothGetReadyStarted extends PhotoBoothEvent {
  const PhotoBoothGetReadyStarted();
}

class PhotoBoothRecordingFinished extends PhotoBoothEvent {
  const PhotoBoothRecordingFinished(this.frames);

  final List<Frame> frames;

  @override
  List<Object> get props => [frames];
}
