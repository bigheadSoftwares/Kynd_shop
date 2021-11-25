part of 'profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({
    Key? key,
    required this.name,
    required this.email,
    required this.mobileNo,
    required this.dateOfBirth,
  }) : super(key: key);

  final String name;
  final String email;
  final String mobileNo;
  final String dateOfBirth;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _mobileNo = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _name.text = widget.name;
    _email.text = widget.email;
    _mobileNo.text = widget.mobileNo;
    _dob.text = widget.dateOfBirth;
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _mobileNo.dispose();
    _dob.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.white,
      appBar: appBar(
        context,
        title: 'Edit Profile',
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16,
          ),
          children: <Widget>[
            _EditScreenTextField(
              controller: _name,
              label: 'Name',
              validator: (String? value) {
                if (value == null || value == '') {
                  return 'Please enter your name';
                }
              },
            ),
            sizedBoxHeight(20),
            _EditScreenTextField(
              controller: _email,
              label: 'Email',
              validator: (String? value) {
                if (value == null || value == '') {
                  return 'Please enter your email';
                }
              },
            ),
            sizedBoxHeight(20),
            _EditScreenTextField(
              controller: _mobileNo,
              label: 'Mobile No',
              validator: (String? value) {
                if (value == null || value == '') {
                  return 'Please enter your mobile no.';
                }
              },
            ),
            sizedBoxHeight(20),
            _EditScreenTextField(
              controller: _dob,
              label: 'Date of Birth',
              readOnly: true,
              onTap: () async {
                DateTime? date = await pickDate(context);
                if (date != null) {
                  _dob.text = DateFormat('dd/MM/yyyy').format(date);
                }
              },
              validator: (String? value) {
                if (value == null || value == '') {
                  return 'Please enter your Date of Birth';
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16,
        ),
        child: CustomButton(
          radius: 25,
          backgroundColor: Colour.greenishBlue,
          padding: const EdgeInsets.symmetric(vertical: 15),
          onTap: () {
            if (_formKey.currentState!.validate()) {
              pop(context);
            }
          },
          child: const SubHeading2(
            'SAVE',
            color: Colour.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}

class _EditScreenTextField extends StatelessWidget {
  const _EditScreenTextField({
    Key? key,
    required this.controller,
    this.validator,
    required this.label,
    this.onTap,
    this.readOnly = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String label;
  final VoidCallback? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SubHeading1(
          label,
          color: Colour.subtitleColor,
          size: 16,
        ),
        TextFormField(
          controller: controller,
          onTap: onTap,
          readOnly: readOnly,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          validator: validator,
          decoration: InputDecoration(
            errorStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            border: UnderlineInputBorder(
              borderRadius: radius(10),
              borderSide: const BorderSide(
                color: Colour.subtitleColor,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: radius(10),
              borderSide: const BorderSide(
                color: Colour.greenishBlue,
              ),
            ),
            suffixIcon: const Icon(
              Icons.edit,
              color: Colour.subtitleColor,
            ),
          ),
        )
      ],
    );
  }
}
