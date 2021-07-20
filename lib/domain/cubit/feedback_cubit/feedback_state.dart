class FeedbackState {
  final String? appeal;
  final String? name;
  final String? surname;
  final String? email;
  final String? phone;
  final String? theme;
  final String? title;
  final String? body;
  final bool? accept;

  const FeedbackState(
      {this.appeal,
      this.name,
      this.surname,
      this.email,
      this.phone,
      this.theme,
      this.title,
      this.body,
      this.accept});

  FeedbackState copyWith(
      {String? appeal,
      String? username,
      String? surname,
      String? email,
      String? phone,
      String? theme,
      String? title,
      String? body,
      bool? accept}) {
    return FeedbackState(
        appeal: appeal ?? this.appeal,
        name: username ?? this.name,
        surname: surname ?? this.surname,
        email: email ?? this.email,
        theme: theme ?? this.theme,
        title: title ?? this.title,
        body: body ?? this.body,
        accept: accept ?? this.accept);
  }
}
