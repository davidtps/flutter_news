class RecommendHotModel {
  List<Data> data;

  RecommendHotModel({this.data});

  RecommendHotModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String sourceId;
  String articleId;
  String updateTime;
  String modifyTime;
  String url;
  String title;
  String contents;
  String source;
  String img;
  String postid;
  String commentCount;
  String votecount;
  String replyCount;

  Data(
      {this.sourceId,
      this.articleId,
      this.updateTime,
      this.modifyTime,
      this.url,
      this.title,
      this.contents,
      this.source,
      this.img,
      this.postid,
      this.commentCount,
      this.votecount,
      this.replyCount});

  Data.fromJson(Map<String, dynamic> json) {
    sourceId = json['sourceId'];
    articleId = json['article_id'];
    updateTime = json['update_time'];
    modifyTime = json['modify_time'];
    url = json['url'];
    title = json['title'];
    contents = json['contents'];
    source = json['source'];
    img = json['img'];
    postid = json['postid'];
    commentCount = json['commentCount'];
    votecount = json['votecount'];
    replyCount = json['replyCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sourceId'] = this.sourceId;
    data['article_id'] = this.articleId;
    data['update_time'] = this.updateTime;
    data['modify_time'] = this.modifyTime;
    data['url'] = this.url;
    data['title'] = this.title;
    data['contents'] = this.contents;
    data['source'] = this.source;
    data['img'] = this.img;
    data['postid'] = this.postid;
    data['commentCount'] = this.commentCount;
    data['votecount'] = this.votecount;
    data['replyCount'] = this.replyCount;
    return data;
  }
}
