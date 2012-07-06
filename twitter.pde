ArrayList<String> words = new ArrayList();

void setup(){
  size(550, 550);
  background(0);
  smooth();
  frameRate(5);

  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("8UJFwCBg7j0xVbwWU3IxuQ");
  cb.setOAuthConsumerSecret("UDn23jYBD46OFwVW7dsbOO7rVeFzKLZHfmMU4FcfCQ0");
  cb.setOAuthAccessToken("334008120-RS9NOUly4qtpMujXO3KPXsKfWgTkRFuevulqJJ8p");
  cb.setOAuthAccessTokenSecret("baZTqiwJTd2BPSgfM5UmeF3dG6ygKI8ZB2MHRU99jg");

  Twitter twitter = new TwitterFactory(cb.build()).getInstance();
  Query query = new Query("#JeremyLin");
  query.setRpp(100);

  try{
    QueryResult result = twitter.search(query);
    ArrayList tweets = (ArrayList) result.getTweets();
    
      for (int i = 0; i < tweets.size(); i++){
        Tweet t = (Tweet) tweets.get(i);
        String user = t.getFromUser();
        String msg = t.getText();
        Date d = t.getCreatedAt();
        println("Tweet by " + user + " at " + d + ": " + msg);
      
        String[] input = msg.split(" ");
        for (int j = 0; j < input.length; j++){
          words.add(input[j]);
        }
      };
    }
  catch (TwitterException te){
    println("Couldn't connect: " + te);
  };
}
void draw() {
  background(0);
  fill(0, 1);
  rect(0,0,width, height);
  
  int i = (frameCount % words.size());
  String word = words.get(i);
  
  float r = random(255);
  float g = random(255);
  float b = random(255);
  fill(r, g, b);
  textSize(50);
  text(word, 100, height/2);
//  textSize(random(10, 30));
  //text(word, random(width), random(height));
}

