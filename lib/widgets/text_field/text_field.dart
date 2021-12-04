import 'package:course/components/importing_packages.dart';

class TextFieldMark extends StatelessWidget {
  String hintText;
  bool? check;

  TextFieldMark({
    required this.hintText, this.check,
    Key? key}) : super(key: key);

  final TextEditingController _textController = TextEditingController();
  String? _searchText;

  @override
  Widget build(BuildContext context) {
    return TextField(
              controller: _textController,
              onChanged: (v) => _searchText = v,
              onSubmitted: (v) {_searchFunction(context, check!);},
              cursorHeight: getUniqueHeight(21),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: (){},
                  icon: SvgPicture.asset(IconPath.search,
                      fit: BoxFit.none, height: 20),
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: getUniqueWidth(14.0),
                  fontWeight: FontWeight.w400,
                  color: ConstColor.kDarkGrey,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ConstColor.kGreyBE,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ConstColor.kGreyBE,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                constraints: const BoxConstraints(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: getUniqueWidth(16.0),
                  vertical: getUniqueHeight(17.5),
                ),
              ),
            );
  }

   _searchFunction(context, bool check) {
    print(context);
    if(_textController.text.isNotEmpty){
      _textController.clear();
      //debugPrint("Search: $_searchText  XXX");
     if (check) Navigator.push(context, MaterialPageRoute(builder: (context)=>  SearchResultPage(searchText: _searchText.toString(),)));
    }
  }
}
