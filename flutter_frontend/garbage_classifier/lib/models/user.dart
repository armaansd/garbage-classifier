class user implements Comparable{
  String name;
  int score;

  user( this.name, this.score);


  user.fromJson( Map<String,dynamic>  json) {
    name = json['id'];
    score = json['score'];
  }
  @override
  int compareTo(other) {

    if (this.score == null || other == null) {
      return null;
    }

    if (this.score < other.score) {
      return 1;
    }

    if (this.score > other.score) {
      return -1;
    }

    if (this.score == other.score) {
      return 0;
    }

    return null;
  }
}