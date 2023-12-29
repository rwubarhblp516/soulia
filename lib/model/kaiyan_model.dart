class KaiyanModel {
  List<ItemList>? itemList;
  int? count;
  int? total;
  String? nextPageUrl;
  bool? adExist;
  int? date;
  int? nextPublishTime;
  String? dialog;
  String? topIssue;
  int? refreshCount;
  int? lastStartId;

  KaiyanModel(
      {this.itemList,
      this.count,
      this.total,
      this.nextPageUrl,
      this.adExist,
      this.date,
      this.nextPublishTime,
      this.dialog,
      this.topIssue,
      this.refreshCount,
      this.lastStartId});

  KaiyanModel.fromJson(Map<String, dynamic> json) {
    if (json['itemList'] != null) {
      itemList = <ItemList>[];
      json['itemList'].forEach((v) {
        itemList!.add(ItemList.fromJson(v));
      });
    }
    count = json['count'];
    total = json['total'];
    nextPageUrl = json['nextPageUrl'];
    adExist = json['adExist'];
    date = json['date'];
    nextPublishTime = json['nextPublishTime'];
    dialog = json['dialog'];
    topIssue = json['topIssue'];
    refreshCount = json['refreshCount'];
    lastStartId = json['lastStartId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (itemList != null) {
      data['itemList'] = itemList!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    data['total'] = total;
    data['nextPageUrl'] = nextPageUrl;
    data['adExist'] = adExist;
    data['date'] = date;
    data['nextPublishTime'] = nextPublishTime;
    data['dialog'] = dialog;
    data['topIssue'] = topIssue;
    data['refreshCount'] = refreshCount;
    data['lastStartId'] = lastStartId;
    return data;
  }
}

class ItemList {
  String? type;
  Data? data;
  String? trackingData;
  String? tag;
  int? id;
  int? adIndex;

  ItemList(
      {this.type,
      this.data,
      this.trackingData,
      this.tag,
      this.id,
      this.adIndex});

  ItemList.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    trackingData = json['trackingData'];
    tag = json['tag'];
    id = json['id'];
    adIndex = json['adIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['trackingData'] = trackingData;
    data['tag'] = tag;
    data['id'] = id;
    data['adIndex'] = adIndex;
    return data;
  }
}

class Data {
  String? dataType;
  int? id;
  String? title;
  String? description;
  String? library;
  List<Tags>? tags;
  Consumption? consumption;
  String? resourceType;
  String? slogan;
  Provider? provider;
  String? category;
  Author? author;
  Cover? cover;
  String? playUrl;
  String? thumbPlayUrl;
  int? duration;
  WebUrl? webUrl;
  int? releaseTime;
  List<PlayInfo>? playInfo;
  String? campaign;
  String? waterMarks;
  bool? ad;
  List<void>? adTrack;
  String? type;
  String? titlePgc;
  String? descriptionPgc;
  String? remark;
  bool? ifLimitVideo;
  int? searchWeight;
  String? brandWebsiteInfo;
  String? videoPosterBean;
  int? idx;
  String? shareAdTrack;
  String? favoriteAdTrack;
  String? webAdTrack;
  int? date;
  String? promotion;
  String? label;
  List<void>? labelList;
  String? descriptionEditor;
  bool? collected;
  bool? reallyCollected;
  bool? played;
  List<void>? subtitles;
  String? lastViewTime;
  String? playlists;
  String? src;
  String? recallSource;
  String? text;
  String? font;
  String? actionUrl;
  Header? header;
  List<ItemList>? itemList;
  int? count;
  String? footer;

  Data(
      {this.dataType,
      this.id,
      this.title,
      this.description,
      this.library,
      this.tags,
      this.consumption,
      this.resourceType,
      this.slogan,
      this.provider,
      this.category,
      this.author,
      this.cover,
      this.playUrl,
      this.thumbPlayUrl,
      this.duration,
      this.webUrl,
      this.releaseTime,
      this.playInfo,
      this.campaign,
      this.waterMarks,
      this.ad,
      this.adTrack,
      this.type,
      this.titlePgc,
      this.descriptionPgc,
      this.remark,
      this.ifLimitVideo,
      this.searchWeight,
      this.brandWebsiteInfo,
      this.videoPosterBean,
      this.idx,
      this.shareAdTrack,
      this.favoriteAdTrack,
      this.webAdTrack,
      this.date,
      this.promotion,
      this.label,
      this.labelList,
      this.descriptionEditor,
      this.collected,
      this.reallyCollected,
      this.played,
      this.subtitles,
      this.lastViewTime,
      this.playlists,
      this.src,
      this.recallSource,
      this.text,
      this.font,
      this.actionUrl,
      this.header,
      this.itemList,
      this.count,
      this.footer});

  Data.fromJson(Map<String, dynamic> json) {
    dataType = json['dataType'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    library = json['library'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    consumption = json['consumption'] != null
        ? Consumption.fromJson(json['consumption'])
        : null;
    resourceType = json['resourceType'];
    slogan = json['slogan'];
    provider =
        json['provider'] != null ? Provider.fromJson(json['provider']) : null;
    category = json['category'];
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    cover = json['cover'] != null ? Cover.fromJson(json['cover']) : null;
    playUrl = json['playUrl'];
    thumbPlayUrl = json['thumbPlayUrl'];
    duration = json['duration'];
    webUrl = json['webUrl'] != null ? WebUrl.fromJson(json['webUrl']) : null;
    releaseTime = json['releaseTime'];
    if (json['playInfo'] != null) {
      playInfo = <PlayInfo>[];
      json['playInfo'].forEach((v) {
        playInfo!.add(PlayInfo.fromJson(v));
      });
    }
    campaign = json['campaign'];
    waterMarks = json['waterMarks'];
    ad = json['ad'];
    type = json['type'];
    titlePgc = json['titlePgc'];
    descriptionPgc = json['descriptionPgc'];
    remark = json['remark'];
    ifLimitVideo = json['ifLimitVideo'];
    searchWeight = json['searchWeight'];
    brandWebsiteInfo = json['brandWebsiteInfo'];
    videoPosterBean = json['videoPosterBean'];
    idx = json['idx'];
    shareAdTrack = json['shareAdTrack'];
    favoriteAdTrack = json['favoriteAdTrack'];
    webAdTrack = json['webAdTrack'];
    date = json['date'];
    promotion = json['promotion'];
    label = json['label'];
    descriptionEditor = json['descriptionEditor'];
    collected = json['collected'];
    reallyCollected = json['reallyCollected'];
    played = json['played'];
    lastViewTime = json['lastViewTime'];
    playlists = json['playlists'];
    src = json['src'];
    recallSource = json['recallSource'];
    recallSource = json['recall_source'];
    text = json['text'];
    font = json['font'];
    actionUrl = json['actionUrl'];
    header = json['header'] != null ? Header.fromJson(json['header']) : null;
    if (json['itemList'] != null) {
      itemList = <ItemList>[];
      json['itemList'].forEach((v) {
        itemList!.add(ItemList.fromJson(v));
      });
    }
    count = json['count'];
    footer = json['footer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dataType'] = dataType;
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['library'] = library;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (consumption != null) {
      data['consumption'] = consumption!.toJson();
    }
    data['resourceType'] = resourceType;
    data['slogan'] = slogan;
    if (provider != null) {
      data['provider'] = provider!.toJson();
    }
    data['category'] = category;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    if (cover != null) {
      data['cover'] = cover!.toJson();
    }
    data['playUrl'] = playUrl;
    data['thumbPlayUrl'] = thumbPlayUrl;
    data['duration'] = duration;
    if (webUrl != null) {
      data['webUrl'] = webUrl!.toJson();
    }
    data['releaseTime'] = releaseTime;
    if (playInfo != null) {
      data['playInfo'] = playInfo!.map((v) => v.toJson()).toList();
    }
    data['campaign'] = campaign;
    data['waterMarks'] = waterMarks;
    data['ad'] = ad;
    data['type'] = type;
    data['titlePgc'] = titlePgc;
    data['descriptionPgc'] = descriptionPgc;
    data['remark'] = remark;
    data['ifLimitVideo'] = ifLimitVideo;
    data['searchWeight'] = searchWeight;
    data['brandWebsiteInfo'] = brandWebsiteInfo;
    data['videoPosterBean'] = videoPosterBean;
    data['idx'] = idx;
    data['shareAdTrack'] = shareAdTrack;
    data['favoriteAdTrack'] = favoriteAdTrack;
    data['webAdTrack'] = webAdTrack;
    data['date'] = date;
    data['promotion'] = promotion;
    data['label'] = label;
    data['descriptionEditor'] = descriptionEditor;
    data['collected'] = collected;
    data['reallyCollected'] = reallyCollected;
    data['played'] = played;
    data['lastViewTime'] = lastViewTime;
    data['playlists'] = playlists;
    data['src'] = src;
    data['recallSource'] = recallSource;
    data['recall_source'] = recallSource;
    data['text'] = text;
    data['font'] = font;
    data['actionUrl'] = actionUrl;
    if (header != null) {
      data['header'] = header!.toJson();
    }
    if (itemList != null) {
      data['itemList'] = itemList!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    data['footer'] = footer;
    return data;
  }
}

class Tags {
  int? id;
  String? name;
  String? actionUrl;
  String? adTrack;
  String? desc;
  String? bgPicture;
  String? headerImage;
  String? tagRecType;
  String? childTagList;
  String? childTagIdList;
  bool? haveReward;
  bool? ifNewest;
  int? newestEndTime;
  int? communityIndex;

  Tags(
      {this.id,
      this.name,
      this.actionUrl,
      this.adTrack,
      this.desc,
      this.bgPicture,
      this.headerImage,
      this.tagRecType,
      this.childTagList,
      this.childTagIdList,
      this.haveReward,
      this.ifNewest,
      this.newestEndTime,
      this.communityIndex});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    actionUrl = json['actionUrl'];
    adTrack = json['adTrack'];
    desc = json['desc'];
    bgPicture = json['bgPicture'];
    headerImage = json['headerImage'];
    tagRecType = json['tagRecType'];
    childTagList = json['childTagList'];
    childTagIdList = json['childTagIdList'];
    haveReward = json['haveReward'];
    ifNewest = json['ifNewest'];
    newestEndTime = json['newestEndTime'];
    communityIndex = json['communityIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['actionUrl'] = actionUrl;
    data['adTrack'] = adTrack;
    data['desc'] = desc;
    data['bgPicture'] = bgPicture;
    data['headerImage'] = headerImage;
    data['tagRecType'] = tagRecType;
    data['childTagList'] = childTagList;
    data['childTagIdList'] = childTagIdList;
    data['haveReward'] = haveReward;
    data['ifNewest'] = ifNewest;
    data['newestEndTime'] = newestEndTime;
    data['communityIndex'] = communityIndex;
    return data;
  }
}

class Consumption {
  int? collectionCount;
  int? shareCount;
  int? replyCount;
  int? realCollectionCount;

  Consumption(
      {this.collectionCount,
      this.shareCount,
      this.replyCount,
      this.realCollectionCount});

  Consumption.fromJson(Map<String, dynamic> json) {
    collectionCount = json['collectionCount'];
    shareCount = json['shareCount'];
    replyCount = json['replyCount'];
    realCollectionCount = json['realCollectionCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['collectionCount'] = collectionCount;
    data['shareCount'] = shareCount;
    data['replyCount'] = replyCount;
    data['realCollectionCount'] = realCollectionCount;
    return data;
  }
}

class Provider {
  String? name;
  String? alias;
  String? icon;

  Provider({this.name, this.alias, this.icon});

  Provider.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alias = json['alias'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['alias'] = alias;
    data['icon'] = icon;
    return data;
  }
}

class Author {
  int? id;
  String? icon;
  String? name;
  String? description;
  String? link;
  int? latestReleaseTime;
  int? videoNum;
  String? adTrack;
  Follow? follow;
  Shield? shield;
  int? approvedNotReadyVideoCount;
  bool? ifPgc;
  int? recSort;
  bool? expert;

  Author(
      {this.id,
      this.icon,
      this.name,
      this.description,
      this.link,
      this.latestReleaseTime,
      this.videoNum,
      this.adTrack,
      this.follow,
      this.shield,
      this.approvedNotReadyVideoCount,
      this.ifPgc,
      this.recSort,
      this.expert});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    name = json['name'];
    description = json['description'];
    link = json['link'];
    latestReleaseTime = json['latestReleaseTime'];
    videoNum = json['videoNum'];
    adTrack = json['adTrack'];
    follow = json['follow'] != null ? Follow.fromJson(json['follow']) : null;
    shield = json['shield'] != null ? Shield.fromJson(json['shield']) : null;
    approvedNotReadyVideoCount = json['approvedNotReadyVideoCount'];
    ifPgc = json['ifPgc'];
    recSort = json['recSort'];
    expert = json['expert'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['icon'] = icon;
    data['name'] = name;
    data['description'] = description;
    data['link'] = link;
    data['latestReleaseTime'] = latestReleaseTime;
    data['videoNum'] = videoNum;
    data['adTrack'] = adTrack;
    if (follow != null) {
      data['follow'] = follow!.toJson();
    }
    if (shield != null) {
      data['shield'] = shield!.toJson();
    }
    data['approvedNotReadyVideoCount'] = approvedNotReadyVideoCount;
    data['ifPgc'] = ifPgc;
    data['recSort'] = recSort;
    data['expert'] = expert;
    return data;
  }
}

class Follow {
  String? itemType;
  int? itemId;
  bool? followed;

  Follow({this.itemType, this.itemId, this.followed});

  Follow.fromJson(Map<String, dynamic> json) {
    itemType = json['itemType'];
    itemId = json['itemId'];
    followed = json['followed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemType'] = itemType;
    data['itemId'] = itemId;
    data['followed'] = followed;
    return data;
  }
}

class Shield {
  String? itemType;
  int? itemId;
  bool? shielded;

  Shield({this.itemType, this.itemId, this.shielded});

  Shield.fromJson(Map<String, dynamic> json) {
    itemType = json['itemType'];
    itemId = json['itemId'];
    shielded = json['shielded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemType'] = itemType;
    data['itemId'] = itemId;
    data['shielded'] = shielded;
    return data;
  }
}

class Cover {
  String? feed;
  String? detail;
  String? blurred;
  String? sharing;
  String? homepage;

  Cover({this.feed, this.detail, this.blurred, this.sharing, this.homepage});

  Cover.fromJson(Map<String, dynamic> json) {
    feed = json['feed'];
    detail = json['detail'];
    blurred = json['blurred'];
    sharing = json['sharing'];
    homepage = json['homepage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['feed'] = feed;
    data['detail'] = detail;
    data['blurred'] = blurred;
    data['sharing'] = sharing;
    data['homepage'] = homepage;
    return data;
  }
}

class WebUrl {
  String? raw;
  String? forWeibo;

  WebUrl({this.raw, this.forWeibo});

  WebUrl.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    forWeibo = json['forWeibo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['raw'] = raw;
    data['forWeibo'] = forWeibo;
    return data;
  }
}

class PlayInfo {
  int? height;
  int? width;
  List<UrlList>? urlList;
  String? name;
  String? type;
  String? url;

  PlayInfo(
      {this.height, this.width, this.urlList, this.name, this.type, this.url});

  PlayInfo.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    width = json['width'];
    if (json['urlList'] != null) {
      urlList = <UrlList>[];
      json['urlList'].forEach((v) {
        urlList!.add(UrlList.fromJson(v));
      });
    }
    name = json['name'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['width'] = width;
    if (urlList != null) {
      data['urlList'] = urlList!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}

class UrlList {
  String? name;
  String? url;
  int? size;

  UrlList({this.name, this.url, this.size});

  UrlList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    data['size'] = size;
    return data;
  }
}

class Header {
  int? id;
  String? title;
  String? font;
  String? subTitle;
  String? subTitleFont;
  String? textAlign;
  String? cover;
  Label? label;
  String? actionUrl;
  List<LabelList>? labelList;
  String? rightText;
  List<String>? iconList;
  String? description;

  Header(
      {this.id,
      this.title,
      this.font,
      this.subTitle,
      this.subTitleFont,
      this.textAlign,
      this.cover,
      this.label,
      this.actionUrl,
      this.labelList,
      this.rightText,
      this.iconList,
      this.description});

  Header.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    font = json['font'];
    subTitle = json['subTitle'];
    subTitleFont = json['subTitleFont'];
    textAlign = json['textAlign'];
    cover = json['cover'];
    label = json['label'] != null ? Label.fromJson(json['label']) : null;
    actionUrl = json['actionUrl'];
    if (json['labelList'] != null) {
      labelList = <LabelList>[];
      json['labelList'].forEach((v) {
        labelList!.add(LabelList.fromJson(v));
      });
    }
    rightText = json['rightText'];
    iconList = json['iconList'].cast<String>();
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['font'] = font;
    data['subTitle'] = subTitle;
    data['subTitleFont'] = subTitleFont;
    data['textAlign'] = textAlign;
    data['cover'] = cover;
    if (label != null) {
      data['label'] = label!.toJson();
    }
    data['actionUrl'] = actionUrl;
    if (labelList != null) {
      data['labelList'] = labelList!.map((v) => v.toJson()).toList();
    }
    data['rightText'] = rightText;
    data['iconList'] = iconList;
    data['description'] = description;
    return data;
  }
}

class Label {
  String? text;
  String? card;
  String? detail;

  Label({this.text, this.card, this.detail});

  Label.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    card = json['card'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['card'] = card;
    data['detail'] = detail;
    return data;
  }
}

class LabelList {
  String? text;
  String? actionUrl;

  LabelList({this.text, this.actionUrl});

  LabelList.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    actionUrl = json['actionUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['actionUrl'] = actionUrl;
    return data;
  }
}

class VideoPosterBean {
  double? scale;
  String? url;
  String? fileSizeStr;

  VideoPosterBean({this.scale, this.url, this.fileSizeStr});

  VideoPosterBean.fromJson(Map<String, dynamic> json) {
    scale = json['scale'];
    url = json['url'];
    fileSizeStr = json['fileSizeStr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['scale'] = scale;
    data['url'] = url;
    data['fileSizeStr'] = fileSizeStr;
    return data;
  }
}
