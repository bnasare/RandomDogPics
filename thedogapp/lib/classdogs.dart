class Dog {
  String message;
  String status;

  Dog({
    required this.message,
    required this.status
    });

    factory Dog.fromJson(Map<String, dynamic> dog){
      return Dog(
        message: dog['message'], 
        status: dog['status']);
    }
}