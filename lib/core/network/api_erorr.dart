class ApiErorr {
  final String message;
  final int? stausCode;

  ApiErorr({required this.message, this.stausCode});

  @override
  String toString() {
    return message;
  }
}
