class Moment {
  const Moment(
      {required this.id,
      required this.title,
      required this.description,
      required this.videoPath,
      required this.dateTime});

  final int id;
  final String title;
  final String description;
  final String videoPath;
  final DateTime dateTime;
}
