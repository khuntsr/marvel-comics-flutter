import 'package:app/controller/UniverseController.dart';
import 'package:app/helpers/static-data.dart';
import 'package:appwrite/models.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../helpers/session.dart';
import '../../helpers/utilities.dart';
import '../../models/sessionvm.dart';
import '../shared/aside.dart';
import '../shared/webview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AsyncMemoizer _memoizer;
  late SessionVm sessionVm;
  late YoutubePlayerController _ytbPlayerController;
  var universe = <Document>[];
  Document? activeUniverse = null;

  double l = 0;
  double r = 0;
  double t = 0;
  double b = 0;

  var c = CrossAxisAlignment.start;
  var m = MainAxisAlignment.start;

  @override
  void initState() {
    super.initState();
    _memoizer = AsyncMemoizer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isOpened = false;

  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  toggleMenu() {
    final _state = _sideMenuKey.currentState!;
    if (_state.isOpened) {
      _state.closeSideMenu();
    } else {
      _state.openSideMenu();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: _initState(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          return SideMenu(
            key: _endSideMenuKey,
            inverse: true,
            type: SideMenuType.slideNRotate,
            background: DefaultColors.primary,
            menu: Container(),
            onChange: (_isOpened) {
              setState(() => isOpened = _isOpened);
            },
            child: SideMenu(
              key: _sideMenuKey,
              menu: ASide(sessionVm.email, context),
              background: DefaultColors.dark,
              type: SideMenuType.shrinkNSlide,
              onChange: (_isOpened) {
                setState(() => isOpened = _isOpened);
              },
              child: IgnorePointer(
                ignoring: isOpened,
                child: Scaffold(
                  body: SafeArea(
                    child: Scaffold(
                      body: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/poster/" + activeUniverse!.data["Thumbnail"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: [
                            AppBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              leading: IconButton(
                                icon: Icon(MfgLabs.menu),
                                onPressed: () => toggleMenu(),
                              ),
                              title: Container(
                                alignment: Alignment.center,
                                child: Image.asset(ImgPaths.logo_marvel_universe, width: 120),
                              ),
                              actions: [
                                IconButton(
                                  icon: Icon(Entypo.logout),
                                  onPressed: () async {
                                    await Logout();
                                    Navigator.pushNamed(context, '/login');
                                  },
                                )
                              ],
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(left: l, right: r, top: t, bottom: b),
                                width: size.width * 1,
                                child: Column(
                                  crossAxisAlignment: c,
                                  mainAxisAlignment: m,
                                  children: [
                                    Text(
                                      activeUniverse?.data["MoviewName"],
                                      style: GoogleFonts.anton(fontSize: 32, fontWeight: FontWeight.w500, color: DefaultColors.baby_white, letterSpacing: 0.5),
                                      textAlign: (activeUniverse!.data['DataPlacement'] == 'top-left' || activeUniverse!.data['DataPlacement'] == 'bottom-left') ? TextAlign.start : TextAlign.end,
                                    ),
                                    SizedBox(height: 28),
                                    Text(
                                      activeUniverse?.data["RunTime"],
                                      style: GoogleFonts.openSans(fontSize: 16, color: DefaultColors.baby_white),
                                    ),
                                    SizedBox(height: 20),
                                    Container(color: DefaultColors.baby_white, width: 45, height: 4),
                                    SizedBox(height: 22),
                                    Container(
                                      decoration: BoxDecoration(border: Border.all(color: DefaultColors.baby_white), borderRadius: BorderRadius.all(Radius.circular(50))),
                                      padding: EdgeInsets.only(left: 2),
                                      child: IconButton(
                                          onPressed: () async {
                                            await showVideo();
                                          },
                                          icon: Icon(FontAwesome5.play, color: DefaultColors.baby_white, size: 22)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: Pad.md, bottom: Pad.sm),
                                          child: Text(
                                            "Marvel Cinematic Universe",
                                            style: GoogleFonts.anton(fontSize: 16, fontWeight: FontWeight.w500, color: DefaultColors.baby_white, letterSpacing: 0.5),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 130,
                                          child: ListView.builder(
                                            itemCount: universe.length,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context, int i) {
                                              final index = universe.indexWhere((element) => element.$id == activeUniverse!.$id);

                                              return TimelineTile(
                                                axis: TimelineAxis.horizontal,
                                                alignment: TimelineAlign.manual,
                                                lineXY: 0.9,
                                                startChild: GestureDetector(
                                                  onTap: () {
                                                    var x = universe.where((element) => element.$id == universe[i].$id).first;
                                                    setState(() {
                                                      activeUniverse = x;
                                                    });
                                                    updateTitlePlacement();
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.only(bottom: Pad.sm),
                                                    child: Image.asset('assets/images/thumbnail/' + universe[i].data["Thumbnail"]),
                                                  ),
                                                ),
                                                indicatorStyle: IndicatorStyle(
                                                  width: 14,
                                                  height: 14,
                                                  drawGap: true,
                                                  color: DefaultColors.baby_white.withOpacity(0.9),
                                                  indicator: index >= i
                                                      ? Container(
                                                          padding: EdgeInsets.all(3),
                                                          width: 14,
                                                          height: 14,
                                                          decoration: BoxDecoration(border: Border.all(color: index >= i ? DefaultColors.primary : DefaultColors.baby_white.withOpacity(0.9)), borderRadius: BorderRadius.all(Radius.circular(50))),
                                                          child: Container(
                                                            decoration: BoxDecoration(shape: BoxShape.circle, color: index >= i ? DefaultColors.primary : DefaultColors.baby_white.withOpacity(0.9)),
                                                          ),
                                                        )
                                                      : Container(
                                                          height: 14,
                                                          width: 14,
                                                          decoration: BoxDecoration(border: Border.all(color: index >= i ? DefaultColors.primary : DefaultColors.baby_white.withOpacity(0.9)), borderRadius: BorderRadius.all(Radius.circular(50))),
                                                        ),
                                                ),
                                                beforeLineStyle: LineStyle(
                                                  color: index >= i ? DefaultColors.primary : DefaultColors.baby_white.withOpacity(0.8),
                                                  thickness: 1,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => WebViewScreen(url: activeUniverse!.data["Details"])),
                                      );
                                    },
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            ('More About ' + activeUniverse!.data["MainCharacter"]).toUpperCase(),
                                            style: GoogleFonts.lato(color: DefaultColors.baby_white, fontSize: 14),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(vertical: 5),
                                            child: Icon(Entypo.down_open_big, color: DefaultColors.baby_white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return ScreenLoader();
      },
    );
  }

  _initState() async {
    try {
      return this._memoizer.runOnce(() async {
        var sessionData = await GetSession();
        if (sessionData == null) {
          Navigator.pushNamed(context, '/login');
        }

        sessionVm = sessionData!;

        universe = (await getAllUniverse())!;
        activeUniverse = universe[0];

        updateTitlePlacement();

        return true;
      });
    } catch (error) {
      return false;
    }
  }

  updateTitlePlacement() {
    var size = MediaQuery.of(context).size;

    setState(() {
      if (activeUniverse!.data['DataPlacement'] == 'top-right') {
        //top right
        l = size.width * 0.3;
        r = Pad.md;
        t = 24;
        b = 0;
        c = CrossAxisAlignment.end;
        m = MainAxisAlignment.start;
      } else if (activeUniverse!.data['DataPlacement'] == 'bottom-left') {
        //bottom left
        l = Pad.md;
        r = size.width * 0.3;
        t = 0;
        b = 24;
        c = CrossAxisAlignment.start;
        m = MainAxisAlignment.end;
      } else if (activeUniverse!.data['DataPlacement'] == 'bottom-right') {
        //bottom right
        l = size.width * 0.3;
        r = Pad.md;
        t = 0;
        b = 24;
        c = CrossAxisAlignment.end;
        m = MainAxisAlignment.end;
      } else {
        //top left
        l = Pad.md;
        r = size.width * 0.3;
        t = 24;
        b = 0;
        c = CrossAxisAlignment.start;
        m = MainAxisAlignment.start;
      }
    });
  }

  showVideo() async {
    setState(() {
      _ytbPlayerController = YoutubePlayerController(
        initialVideoId: activeUniverse!.data['YoutubeId'],
        flags: YoutubePlayerFlags(autoPlay: true),
      );
    });

    bool? result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(4),
          content: AspectRatio(
            aspectRatio: 16 / 9,
            child: YoutubePlayer(
              controller: _ytbPlayerController,
              showVideoProgressIndicator: true,
              liveUIColor: DefaultColors.primary,
            ),
          ),
        );
      },
    );

    if (result == null || result == false) {
      //_ytbPlayerController.dispose();
    }
  }
}
