



//import at.mukprojects.imageloader.*;
//import at.mukprojects.imageloader.file.*;
//import at.mukprojects.imageloader.flickr.*;
//import at.mukprojects.imageloader.image.*;


//ImageLoader loader;
//ImageList nlImages, peImages, nsImages, nbImages, qcImages, onImages, 
//  mbImages, nuImages, ntImages, skImages, abImages, bcImages, ytImages;
//Image img;

//String apiKey = "3d2b7803505d73fb05fa3fc61bafc74d";
//String apiSecret = "d88e24aa3e6ea508";

//void setup() {
//  size(800, 450);

//  loader = new FlickrLoader(this, apiKey, apiSecret);
//  //nlImages = loader.start("Newfoundland", false, 60 * 1000);
//  //peImages = loader.start("Prince Edwrad Island", false, 60 * 1000);
//  nsImages = loader.start("Nova Scotia", false, 60 * 1000);
//  //nbImages = loader.start("New Brunswick", false, 60 * 1000);
//  //qcImages = loader.start("Quebec", false, 60 * 1000);
//  //onImages = loader.start("Ontario", false, 60 * 1000);
//  //mbImages = loader.start("Manitoba", false, 60 * 1000);
//  //nuImages = loader.start("Nunavut", false, 60 * 1000);
//  //ntImages = loader.start("Northwest Territories", false, 60 * 1000);
//  //skImages = loader.start("Saskatchewan", false, 60 * 1000);
//  //abImages = loader.start("Alberta", false, 60 * 1000);
//  //bcImages = loader.start("British Columbia", false, 60 * 1000);
//  //ytImages = loader.start("Yukon Territory", false, 60 * 1000);
//}

//void draw() {
//  if (img == null) {
//    img = nsImages.getRandom();
//  } else {
//    image(img.getImg(), 0, 0, width/2, height/2);
//    image(img.getImg(), 0, height/2, width/2, height/2);
//    image(img.getImg(), width/2, 0, width/2, height/2);
//    image(img.getImg(), width/2, height/2, width/2, height/2);
//  }
//}

//void mousePressed() {
//  img = nsImages.getRandom();
//}


/*
 * Below is a link to an openweathermap.org API. The text APIKEY in the link below is going
 * to be replaced by the actual APIKEY. I do it this way for security reasons.
 */
//String url="http://api.openweathermap.org/data/2.5/weather?q=Clonmel&APPID=APIKEY&mode=xml";

//MD5 ecription: https://forum.processing.org/one/topic/encrypt-a-string.html
import java.security.*;

//String apiKey = "3d2b7803505d73fb05fa3fc61bafc74d";
String apiKey = null;
//String apiSecret = "d88e24aa3e6ea508";
String apiSecret = null;


String apiSigFormat = apiSecret + "api_key" + apiKey + "perms" + "read";

String apiSig=null;

//String url=null;

  //url="http://flickr.com/services/auth/?api_key=[api_key]&perms=[perms]&api_sig=[api_sig]"
  
String url = "https://api.flickr.com/services/rest/?method=flickr.photos.search" +
      "&api_key=APIKEY" +
      "&text=SEARCH" +
      "&privacy_filter=1&safe_search=1&content_type=1&format=rest" +
      "&auth_token=72157672774407184-ef5baaef300bc098" +
      "&api_sig=APISIG";

String search=null;

public static String bytesToHex(byte[] b) {
  char hexDigit[] = {
    '0', '1', '2', '3', '4', '5', '6', '7',
    '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'
  };
  StringBuffer buf = new StringBuffer();
  for (int j=0; j<b.length; j++) {
    buf.append(hexDigit[(b[j] >>4) & 0x0f]);
    buf.append(hexDigit[b[j] & 0x0f]);
  }
  return buf.toString();
}
void setup() {
  
  //set size of canvas
  size(600, 600);
  
  // Use anto aliasing
  smooth();
  
  // Set the background colour
  background(200);
  
  //// Set the font to use for text
  //PFont generalFont = createFont("Ariel", 20, true); // Arial, 20 point, anti-aliasing on
  //textFont(generalFont);
  
  //  // Get the api key (using the function I wrote) and replace the text APIKEY in the 
  //// link with the key
  
  apiKey = getAPIKey("flickr.com");
  apiSecret = getAPIKey("flickr.com/secret");
  
  if (apiKey == null) {
    println("Failed to find API KEY for flickr.com");
    exit();
  }
  
  if (apiSecret == null) {
    println("Failed to find API SECRET for flickr.com/secret");
    exit();
  }
  
  url = url.replace("APIKEY", apiKey);
  
  
  try {
    MessageDigest md = MessageDigest.getInstance("MD5");
    //String input="aabbccddeeff"; //storing the password in input string
    String input=apiSigFormat; //storing the password in input string
    md.update(input.getBytes()); //storing the password in md object as bytes
    byte[] output = md.digest(); //producing the 128 bit output using the md5 algorithm
    apiSig= bytesToHex(output); //converting the bytes to string and storing in cipher String
  }
  catch (Exception e) {
    System.out.println("Exception: "+e);
  }
  println(apiSig);
  
  
  
  //url="http://flickr.com/services/auth/?api_key=[api_key]&perms=[perms]&api_sig=[api_sig]"
  
  //url = "https://api.flickr.com/services/rest/?method=flickr.photos.search" +
  //    "&api_key=" + apiKey +
  //    "&text=" + search +
  //    "&privacy_filter=1&safe_search=1&content_type=1&format=rest" +
  //    "&auth_token=72157672837006633-ec15837baed89c46" +
  //    "&api_sig=" + apiSig;


url = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=a4705a25494ce649c2611fe6e6c335a7&text=Ontario&format=rest&auth_token=72157672837006633-ec15837baed89c46&api_sig=d3ec20fd79fa4073abe43f070c70cb91";


  // loadXML loads the xml at the given url (or file)
  XML xmlResponse = loadXML(url);
  
  // formt the xmlResponse we have received into a string and indent using 5
  // spaces, then print out the string. I'm doing this for information 
  // purposes only
  print(xmlResponse.format(5));


}



// The following will hold the name of the location whose weather we are reading
//String locationName;

// The following will hold the temperature of the location
//int temperature;

//void setup() {

  

  

  
  /* Get the child of the root node ('current' in this case) called 'city'. The
     getChild() method returns an XML object that models the XML in question.
  */
  //XML locationNode = xmlResponse.getChild("city");

  /* Get the String value of the attribute called 'name'
  */
  //locationName = locationNode.getString("name");
  
  
  //XML temperatureNode = xmlResponse.getChild("temperature");
  
  // Get the value of the 'temp' attribute as a float, substract -273.15 as the temperature
  // is given in kelvin and we want to convert it to celius. The cast to an int. We cast it
  // to an int because we use it later on and we need it in int format.
  //temperature = (int)(temperatureNode.getFloat("value")-273.15);
  
  // Set the color mode to Hue Saturation Brightness (HSB) as apposed to RGB
  // and set the max value of the H, the S and the B values to be 100.
  //colorMode(HSB, 100);
//}

//void draw() {
//  // Draw the title 
//  fill(0);
//  textAlign(CENTER);
//  text(locationName, width/2, 20);
  
//  // Draw a circle. Remember we are specifying color as HSB. I am modifying the
//  // saturation value based the temperature. A hue value of 0 is red
//  // see http://infohost.nmt.edu/tcc/help/pubs/colortheory/web/hsv.html
//  fill(0, temperature, 100);
//  noStroke();
  
//  // Note that I am using the map function to map temperature from a
//  // range of 20 - 100 to a range of 10 - width
//  //float diameter = map(temperature, 20, 100, 10, width);
//  float diameter = map(temperature, -10, 30, 10, width);
//  ellipse(width/2, height/2, diameter, diameter);
//  noLoop();
  
//}

String getAPIKey(String provider)
{
  String theKey = null;
 
  XML xml = loadXML("apikeys.xml");
  
  if (xml == null)
  {
    // The file isn't there lets "abort"
    println("Failed to locate the file apikeys.xml");
    exit();
  }
  else
  {
    // Note in the sample xml above I have only one key so the array will only have one element.
    // In the future I may have many keys.
    XML[] allKeys = xml.getChildren("key");
    
    for (int i=0; i<allKeys.length; i++)
    {
      if (allKeys[i].getString("provider").equals(provider))
      {        
        // Bingo, found the one I'm looking for. Set the APIKEY 
        theKey = allKeys[i].getString("key");
        
        // break out of the for loop, we have found what we are looking for
        break;
      }
    }
  }
  
  return theKey;
} 