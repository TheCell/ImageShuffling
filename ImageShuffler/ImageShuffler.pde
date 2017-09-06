PImage img;
Sortingengine sorter;

// found settings and variable size through https://forum.processing.org/two/discussion/12079/problem-with-3-x-pimage-and-size-errors
// thanks https://forum.processing.org/two/profile/56/GoToLoop for pointing that out
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