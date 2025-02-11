part of 'import.dart';
class RegistraionDate {
  final registrationFormKey = GlobalKey<FormState>();

  TextEditingController email =
      TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "lamayousef1997@gmail.com");
  TextEditingController confirmPassword = TextEditingController(text: "123456");
  //
  // String selectedGender ="Male";
  // TextEditingController selectedDate = TextEditingController();
  // TextEditingController username = TextEditingController(text: "");
  //
  // // Function to handle the date picker dialog
  // Future<void> selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime(2100),
  //   );

    // if (picked != null && picked != selectedDate.text) {
    //   // String formattedDate = DateFormat("yyyy-MM-dd'T")
    //   //     .format(picked.toUtc().subtract(Duration(hours: 2, minutes: 12, seconds: 56, milliseconds: 124)));
    //   //
    //   // selectedDate.text = formattedDate;
    //
    // }



 void registerUser(BuildContext context) {
    // if(confirmPassword.text !=password.text){
    //
    //   showToast(context: context, message: "password not matches");
    // }else
    if (registrationFormKey.currentState!.validate() ) {
     // var data= context
     //      .read<RegistrationBloc>()
     //      .add(RegistrationReloadChange(regUser: RegistrationReqModel(email: email.text,password: password.text,name: username.text,birthDay: selectedDate.text,gender:selectedGender=="Male"?0:1,)));

    }}

}
