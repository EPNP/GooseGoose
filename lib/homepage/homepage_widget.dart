import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'homepage_model.dart';
export 'homepage_model.dart';

class HomepageWidget extends StatefulWidget {
  const HomepageWidget({
    Key? key,
    this.tweetref,
  }) : super(key: key);

  final DocumentReference? tweetref;

  @override
  _HomepageWidgetState createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget> {
  late HomepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomepageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.pushNamed('PostTweet');
        },
        backgroundColor: Color(0xFFBB9FC8),
        elevation: 8.0,
        child: Icon(
          FFIcons.kedit2Copy,
          color: Colors.white,
          size: 24.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1.0,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Color(0x3A000000),
                    offset: Offset(0.0, 1.0),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 37.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                40.0, 0.0, 0.0, 0.0),
                            child: Image.network(
                              'https://firebasestorage.googleapis.com/v0/b/twittyv2-865d9.appspot.com/o/goose%2001%201.png?alt=media&token=724dbcb9-1093-4a79-9c89-396fcf7f3580',
                              width: 25.0,
                              height: 35.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 25.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              icon: Icon(
                                FFIcons.ksmsCopy,
                                color: Color(0xFFBB9FC8),
                                size: 27.0,
                              ),
                              onPressed: () async {
                                context.pushNamed('ChatPage');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
              child: AuthUserStreamWidget(
                builder: (context) => StreamBuilder<List<TweetsRecord>>(
                  stream: queryTweetsRecord(
                    queryBuilder: (tweetsRecord) => tweetsRecord
                        .whereIn('uid',
                            (currentUserDocument?.following?.toList() ?? []))
                        .orderBy('Tweet_time', descending: true),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      );
                    }
                    List<TweetsRecord> socialFeedTweetsRecordList =
                        snapshot.data!;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(socialFeedTweetsRecordList.length,
                          (socialFeedIndex) {
                        final socialFeedTweetsRecord =
                            socialFeedTweetsRecordList[socialFeedIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              26.0, 8.0, 26.0, 43.0),
                          child: StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(
                                socialFeedTweetsRecord.uid!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              final userPostUsersRecord = snapshot.data!;
                              return Container(
                                width: MediaQuery.of(context).size.width * 0.94,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 2.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0xFFB49CBF),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          1.0, 1.0, 1.0, 1.0),
                                                  child: Container(
                                                    width: 55.0,
                                                    height: 55.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      socialFeedTweetsRecord
                                                          .tweetOwnerpic!,
                                                      fit: BoxFit.scaleDown,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            socialFeedTweetsRecord
                                                                .tweetBy!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            dateTimeFormat(
                                                                'd/M H:mm',
                                                                socialFeedTweetsRecord
                                                                    .tweetTime!),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          socialFeedTweetsRecord
                                                              .tweetByEmail!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        75.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  socialFeedTweetsRecord.name!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.black,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ToggleIcon(
                                                  onPressed: () async {
                                                    final postLikedByElement =
                                                        currentUserReference;
                                                    final postLikedByUpdate =
                                                        socialFeedTweetsRecord
                                                                .postLikedBy!
                                                                .toList()
                                                                .contains(
                                                                    postLikedByElement)
                                                            ? FieldValue
                                                                .arrayRemove([
                                                                postLikedByElement
                                                              ])
                                                            : FieldValue
                                                                .arrayUnion([
                                                                postLikedByElement
                                                              ]);
                                                    final tweetsUpdateData = {
                                                      'Post_liked_by':
                                                          postLikedByUpdate,
                                                    };
                                                    await socialFeedTweetsRecord
                                                        .reference
                                                        .update(
                                                            tweetsUpdateData);
                                                  },
                                                  value: socialFeedTweetsRecord
                                                      .postLikedBy!
                                                      .toList()
                                                      .contains(
                                                          currentUserReference),
                                                  onIcon: Icon(
                                                    Icons.favorite_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 20.0,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.black,
                                                    size: 20.0,
                                                  ),
                                                ),
                                                Text(
                                                  socialFeedTweetsRecord
                                                      .postLikedBy!
                                                      .toList()
                                                      .length
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.black,
                                                        fontSize: 10.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                ),
                                                Container(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Visibility(
                                                    visible: !socialFeedTweetsRecord
                                                            .postGiftedBy!
                                                            .toList()
                                                            .contains(
                                                                currentUserReference) &&
                                                        (socialFeedTweetsRecord
                                                                .tweetBy !=
                                                            currentUserDisplayName),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons.card_giftcard,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        final tweetsUpdateData =
                                                            {
                                                          'Post_Gifted_by':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            currentUserReference
                                                          ]),
                                                        };
                                                        await socialFeedTweetsRecord
                                                            .reference
                                                            .update(
                                                                tweetsUpdateData);
                                                        if (!socialFeedTweetsRecord
                                                            .postGiftedBy!
                                                            .toList()
                                                            .contains(
                                                                currentUserReference)) {
                                                          final tweetsCreateData =
                                                              {
                                                            ...createTweetsRecordData(
                                                              name:
                                                                  socialFeedTweetsRecord
                                                                      .name,
                                                              uid:
                                                                  currentUserReference,
                                                              postGiftedFrom:
                                                                  socialFeedTweetsRecord
                                                                      .tweetBy,
                                                              tweetBy:
                                                                  currentUserDisplayName,
                                                              tweetByEmail:
                                                                  currentUserEmail,
                                                              tweetOwnerpic:
                                                                  currentUserPhoto,
                                                            ),
                                                            'Tweet_time': FieldValue
                                                                .serverTimestamp(),
                                                          };
                                                          await TweetsRecord
                                                                  .createDoc(
                                                                      currentUserReference!)
                                                              .set(
                                                                  tweetsCreateData);
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (socialFeedTweetsRecord
                                                      .postGiftedFrom !=
                                                  null &&
                                              socialFeedTweetsRecord
                                                      .postGiftedFrom !=
                                                  '')
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      76.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Gifted from ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          Text(
                                            socialFeedTweetsRecord
                                                .postGiftedFrom!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
