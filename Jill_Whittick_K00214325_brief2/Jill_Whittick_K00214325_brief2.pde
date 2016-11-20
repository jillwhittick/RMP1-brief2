
import at.mukprojects.imageloader.*;
import at.mukprojects.imageloader.file.*;
import at.mukprojects.imageloader.flickr.*;
import at.mukprojects.imageloader.image.*;


ImageLoader loader;
ImageList nlImages, peImages, nsImages, nbImages, qcImages, onImages, 
  mbImages, nuImages, ntImages, skImages, abImages, bcImages, ytImages;
Image img;

//String apiKey = "3d2b7803505d73fb05fa3fc61bafc74d";
String apiKey = null;
//String apiSecret = "d88e24aa3e6ea508";
String apiSecret = null;

void setup() {
  size(800, 450);
  
  apiKey = getAPIKey("flickr.com");

  
  if (apiKey == null) {
    println("Failed to find API KEY for flickr.com");
    exit();
  }

  
  apiSecret = getAPIKey("flickr.com/secret");
  
  if (apiSecret == null) {
    println("Failed to find API SECRET for flickr.com/secret");
    exit();
  }

  loader = new FlickrLoader(this, apiKey, apiSecret);
  
  nlImages = loader.start("Newfoundland Manitoba", false, 60 * 1000);
  //peImages = loader.start("Prince Edwrad Island", false, 60 * 1000);
  //nsImages = loader.start("Nova Scotia", false, 60 * 1000);
  //nbImages = loader.start("New Brunswick", false, 60 * 1000);
  //qcImages = loader.start("Quebec", false, 60 * 1000);
  //onImages = loader.start("Ontario", false, 60 * 1000);
  //mbImages = loader.start("Manitoba", false, 60 * 1000);
  //nuImages = loader.start("Nunavut", false, 60 * 1000);
  //ntImages = loader.start("Northwest Territories", false, 60 * 1000);
  //skImages = loader.start("Saskatchewan", false, 60 * 1000);
  //abImages = loader.start("Alberta", false, 60 * 1000);
  //bcImages = loader.start("British Columbia", false, 60 * 1000);
  //ytImages = loader.start("Yukon Territory", false, 60 * 1000);
}

void draw() {
  if (img == null) {
      img = nlImages.getRandom();
  } else {
      
    image(img.getImg(), 0, 0, width/2, height/2);
    image(img.getImg(), width/2, 0, width/2, height/2);
    
  }
}

void keyPressed() {
  img = nlImages.getRandom();
  img = nlImages.getRandom();

}




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
      if (allKeys[i].getString("provider").equals("flickr.com"))
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