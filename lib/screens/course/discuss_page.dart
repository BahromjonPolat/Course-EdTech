import 'package:course/components/importing_packages.dart';
import 'package:course/services/cloud/discuss_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscussPage extends StatefulWidget {
  final String _lessonId;

  const DiscussPage(this._lessonId, {Key? key}) : super(key: key);

  @override
  State<DiscussPage> createState() => _DiscussPageState();
}

class _DiscussPageState extends State<DiscussPage> {
  final Uuid _uuid = const Uuid();
  final DiscussService _discussService = DiscussMethods();
  final CloudStoreService _userService = CloudStoreMethods();
  final TextEditingController _messageController = TextEditingController();
  final _uid = FirebaseAuth.instance.currentUser!.uid;
  late String _lessonId;
  late double _width;

  @override
  void initState() {
    super.initState();
    _lessonId = widget._lessonId;
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: SizedBox(
        height: getUniqueHeight(572.0),
        child: Column(
          children: [
            _buildMessageList(),
            _showMessageField(),
          ],
        ),
      ),
    );
  }

  Expanded _buildMessageList() {
    return Expanded(
        child: FutureBuilder(
      future: _discussService.getDiscussList(_lessonId),
      builder: (context, AsyncSnapshot<List<Discuss>> snap) {
        if (snap.hasData) {
          if (snap.data!.isEmpty) {
            return Image.asset(ImagePath.testQuestion);
          }
          return ListView.builder(
              itemCount: snap.data!.length,
              itemBuilder: (context, index) {
                Discuss discuss = snap.data![index];
                return Container(
                  alignment: discuss.userId == _uid
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: discuss.userId == _uid
                      ? _setRightMessageLayout(discuss)
                      : _setLeftMessageLayout(discuss),
                );
              });
        } else if (snap.hasError) {
          return Image.asset(ImagePath.notFound);
        }
        return CupertinoActivityIndicator(radius: getUniqueWidth(24.0));
      },
    ));
  }

  _showMessageField() => Container(
        decoration: BoxDecoration(
            color: ConstColor.kOrangeAccentF8,
            border: Border.all(color: ConstColor.kOrangeE35, width: 0.5),
            borderRadius: BorderRadius.circular(getUniqueWidth(6.0))),
        child: Row(
          children: [
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: getUniqueHeight(160.0)),
                child: TextField(
                  controller: _messageController,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: "Message", border: _setBorder()),
                ),
              ),
            ),
            CustomIconButton(
                onPressed: _onSendButtonPressed, svgIcon: IconPath.play)
          ],
        ),
      );

  void _onSendButtonPressed() async {
    String id = _uuid.v4();
    String message = _messageController.text;
    if (message.isEmpty) return;
    _messageController.clear();
    Discuss discuss = Discuss(id, _uid, _lessonId, message, DateTime.now());
    await _discussService.setDiscuss(discuss).whenComplete(() {
      setState(() {});
    });
  }

  _setLeftMessageLayout(Discuss discuss) => ConstrainedBox(
        constraints: BoxConstraints(maxWidth: _width * 0.8),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: getUniqueHeight(3.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FutureBuilder(
                  future: _userService.getUserData(discuss.userId),
                  builder: (context, AsyncSnapshot<UserModel> snap) {
                    if (snap.hasData) {
                      return _setCircleAvatar(snap.data!.imageUrl);
                    }
                    return _setCircleAvatar('default');
                  }),
              Container(
                constraints: BoxConstraints(maxWidth: _width * 0.65),
                margin: EdgeInsets.symmetric(
                    horizontal: getUniqueWidth(6.0)),
                padding: EdgeInsets.symmetric(
                  horizontal: getUniqueWidth(12.0),
                  vertical: getUniqueHeight(8.0),
                ),
                child: CustomTextWidget(
                  discuss.message,
                  color: ConstColor.dark,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: ConstColor.kOrangeE35, width: getUniqueWidth(0.5)),
                  borderRadius: _setBorderRadiusOnly(
                    topLeft: 32.0,
                    topRight: 32.0,
                    bottomRight: 32.0,
                  ),
                  color: ConstColor.kWhite,
                ),
              ),
            ],
          ),
        ),
      );

  _setRightMessageLayout(Discuss discuss) => Container(
        margin: EdgeInsets.symmetric(vertical: getUniqueHeight(3.0)),
        padding: EdgeInsets.symmetric(
          horizontal: getUniqueWidth(12.0),
          vertical: getUniqueHeight(8.0),
        ),
        constraints: BoxConstraints(maxWidth: _width * 0.8),
        child: CustomTextWidget(
          discuss.message,
          color: ConstColor.kWhite,
        ),
        decoration: BoxDecoration(
          border: Border.all(
              color: ConstColor.kOrangeE35, width: getUniqueWidth(0.5)),
          borderRadius: _setBorderRadiusOnly(
            topRight: 32.0,
            topLeft: 32.0,
            bottomLeft: 32.0,

          ),
          color: ConstColor.kOrangeE35,
        ),
      );

  CircleAvatar _setCircleAvatar(String imageUrl) {
    if (imageUrl != 'default') {
      return CircleAvatar(backgroundImage: NetworkImage(imageUrl));
    }
    return const CircleAvatar(backgroundImage: AssetImage(ImagePath.profile));
  }

  BorderRadius _setBorderRadiusOnly({
    double topLeft = 0.0,
    double topRight = 0.0,
    double bottomRight = 0.0,
    double bottomLeft = 0.0,
  }) =>
      BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomRight: Radius.circular(bottomRight),
        bottomLeft: Radius.circular(bottomLeft),
      );

  OutlineInputBorder _setBorder() =>
      const OutlineInputBorder(borderSide: BorderSide.none);
}
