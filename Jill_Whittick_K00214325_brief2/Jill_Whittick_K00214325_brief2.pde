import at.mukprojects.imageloader.*;
import at.mukprojects.imageloader.file.*;
import at.mukprojects.imageloader.flickr.*;
import at.mukprojects.imageloader.image.*;


ImageLoader loader;
ImageList images, peImages, nsImages, nbImages, qcImages, onImages, 
  mbImages, nuImages, ntImages, skImages, abImages, bcImages, ytImages;
Image imgLeft, imgRight;

//String apiKey = "3d2b7803505d73fb05fa3fc61bafc74d";
String apiKey = null;
//String apiSecret = "d88e24aa3e6ea508";
String apiSecret = null;

void setup() {
  size(800, 600);
  
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
  
  //images = loader.start("Newfoundland+Nature", false, 60 * 1000);
  //images = loader.start("Newfoundland", false, 60 * 1000);

  //images = loader.start("Newfoundland+Nature Prince+Edward+Island+Nature Nova+Scotia+Nature " +
  //  "New+Brunswick+Nature Quebec+Nature Ontario+Nature Manitoba+Nature " +
  //  "Saskatchewan+Nature Alberta+Nature British+Columbia+Nature Yukon+Nature " +
    //"Northwest+Territories+Nature Nunavut+Nature", false, 60 * 1000);
    
  //images = loader.start("northern+lights", false, 100 * 1000);
  images = loader.start("auroraborealis", false, 100 * 1000);

}

void draw() {
  if ((imgLeft == null) && (imgRight == null)) {
      imgLeft = images.getRandom();
      imgRight = images.getRandom();

} else {
      
    image(imgLeft.getImg(), 0, 0, width/2, height/2);
    image(imgRight.getImg(), width/2, 0, width/2, height/2);
    
  }
}

void keyPressed() {
  imgLeft = images.getRandom();
  imgRight = images.getRandom();

  println(imgLeft);
  println(imgRight);
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
      //if (allKeys[i].getString("provider").equals("flickr.com"))
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