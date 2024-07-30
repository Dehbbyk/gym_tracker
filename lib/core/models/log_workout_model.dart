class LogWorkoutModel {
  final String duration;
  final String typeOfExercise;
  final String? weight;
  final String set;
  final DateTime date;

  LogWorkoutModel({
    required this.duration,
    required this.typeOfExercise,
    this.weight,
    required this.set,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'duration': duration,
        'typeOfExercise': typeOfExercise,
        'weight': weight,
        'set': set,
        'date': date.toIso8601String(),
      };

  static LogWorkoutModel fromJson(Map<String, dynamic> json) => LogWorkoutModel(
        duration: json['duration'],
        typeOfExercise: json['typeOfExercise'],
        weight: json['weight'],
        set: json['set'],
        date: DateTime.parse(json['date']),
      );
}
