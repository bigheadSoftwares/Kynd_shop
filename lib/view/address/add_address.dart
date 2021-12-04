part of 'my_address.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final TextEditingController _yourLocation = TextEditingController()
    ..text = '${Constants.initialLatitude}, ${Constants.initialLongitude}';
  final TextEditingController _flat = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _saveAs = TextEditingController();

  @override
  void dispose() {
    _yourLocation.dispose();
    _flat.dispose();
    _name.dispose();
    _mobile.dispose();
    _saveAs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        title: 'Add Address',
      ),
      body: Column(
        children: <Widget>[
          Map(yourLocation: _yourLocation),
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                physics: const ClampingScrollPhysics(),
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      _AddAddressTextField(
                        controller: _yourLocation,
                        label: 'Your Location',
                      ),
                      sizedBoxHeight(10),
                      _AddAddressTextField(
                        controller: _flat,
                        label: 'Flat/ Building / Street',
                      ),
                      sizedBoxHeight(10),
                      _AddAddressTextField(
                        controller: _name,
                        label: 'Name',
                      ),
                      sizedBoxHeight(10),
                      _AddAddressTextField(
                        controller: _mobile,
                        label: 'Mobile',
                        textInputFormatter: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                  sizedBoxHeight(10),
                  const SubHeading1(
                    'Save as',
                    color: Colour.subtitleColor,
                    size: 16,
                  ),
                  _SaveAsWidget(controller: _saveAs)
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: CustomButton(
          radius: 25,
          backgroundColor: Colour.greenishBlue,
          padding: const EdgeInsets.symmetric(vertical: 12),
          onTap: () {
            pushReplacementNamed(context, Routes.home);
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
