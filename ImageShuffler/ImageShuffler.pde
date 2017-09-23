PImage img;
Sortingengine sorter;

// found settings and variable size through https://forum.processing.org/two/discussion/12079/problem-with-3-x-pimage-and-size-errors
// thanks https://forum.processing.org/two/profile/56/GoToLoop for pointing that out
// ideas: add partial artefacts and colorglitches like
/**
*  https://s3.envato.com/files/195730195/03_image.jpg
*  http://gdj.graphicdesignjunction.com/wp-content/uploads/2017/07/Glitch-Effect-Tutorial+10.jpg
*  http://gdj.graphicdesignjunction.com/wp-content/uploads/2017/07/Glitch-Effect-Tutorial+9-1.jpg
*  http://gdj.graphicdesignjunction.com/wp-content/uploads/2017/07/Glitch-Effect-Tutorial+7.jpg
*  http://gdj.graphicdesignjunction.com/wp-content/uploads/2017/07/Glitch-Effect-Tutorial+5.jpg
*  http://gdj.graphicdesignjunction.com/wp-content/uploads/2017/07/Glitch-Effect-Tutorial+4.jpg
*  https://i.ytimg.com/vi/tmOzkUiXrb4/maxresdefault.jpg
*  https://cmkt-image-prd.global.ssl.fastly.net/0.1.0/ps/2276804/580/386/m1/fpnw/wm0/01-.jpg?1487068376&s=27e600a151c7dd0d396301f517b81a39
*/
void settings()
{
  //img = loadImage("C5i6nblXEAIC4Ih.jpg");
  //img = loadImage("25K_BURNER.jpg");
  img = loadImage("eclipse.jpg");
  //img = loadImage("img_lights.jpg");
  size(img.width, img.height);
}

void setup()
{
  loadPixels();
  sorter = new Sortingengine();

  //sorter.horizontal(img.width, img.height, img.pixels, "RGB");
  //sorter.vertical(img.width, img.height, img.pixels, "RGB");

  sorter.fuzzyStrips(img.width, img.height, 50, "RGB", img.pixels);

  updatePixels();
  image(img, 0, 0);
  noLoop();
}

void loop() {
}