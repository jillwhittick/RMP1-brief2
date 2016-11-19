import at.mukprojects.imageloader.*;
import at.mukprojects.imageloader.file.*;
import at.mukprojects.imageloader.flickr.*;
import at.mukprojects.imageloader.image.*;


ImageLoader loader;
ImageList nlImages, peImages, nsImages, nbImages, qcImages, onImages, 
  mbImages, nuImages, ntImages, skImages, abImages, bcImages, ytImages;
Image img;

String apiKey = "3d2b7803505d73fb05fa3fc61bafc74d";
String apiSecret = "d88e24aa3e6ea508";

void setup() {
  size(800, 450);

  loader = new FlickrLoader(this, apiKey, apiSecret);
  nlImages = loader.start("Newfoundland", false, 60 * 1000);
  peImages = loader.start("Prince Edwrad Island", false, 60 * 1000);
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
    img = peImages.getRandom();
  } else {
    image(img.getImg(), 0, 0, width/2, height/2);
    image(img.getImg(), 0, height/2, width/2, height/2);
    image(img.getImg(), width/2, 0, width/2, height/2);
    image(img.getImg(), width/2, height/2, width/2, height/2);
  }
}

void mousePressed() {
  img = peImages.getRandom();
}