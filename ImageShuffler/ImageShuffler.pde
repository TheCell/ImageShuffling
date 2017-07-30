PImage img;

void settings()
{
  img = loadImage("C5i6nblXEAIC4Ih.jpg");
  size(img.width, img.height);
}

void setup()
{
  loadPixels();

  sortByRedHorizontal(img.width, img.height, img.pixels);

  updatePixels();
  image(img, 0, 0);
  noLoop();
}

void loop() {
}

void sortByRedHorizontal(int imgWidth, int imgHeight, int[] pixels)
{
  for (int y = 0; y < imgHeight; y++)
  {
    //int[] tempArr = new int[img.width];
    int pointer = 0;
    int tempColor = 0;

    // loop x values from 0 to max -1
    for (int x = 0; x < imgWidth -1; x++)
    {
      tempColor = pixels[x + y * imgWidth];
      int r = (tempColor >> 16) & 0xFF;
      // extract rgba colors
      //int a = (test >> 24) & 0xFF;
      //int g = (test >> 8) & 0xFF;
      //int b = test & 0xFF;

      pointer = x + y * imgWidth;

      // loop rest of array, search biggest number
      for (int temp = x + 1; temp < imgWidth; temp++)
      {
        int compareColor = pixels[temp + y * imgWidth];
        int compareR = (compareColor >> 16) & 0xFF;
        if (compareR > r)
        {
          r = compareR;
          pointer = temp + y * imgWidth;
        }
      }
      
      pixels[x + y * imgWidth] = pixels[pointer];
      pixels[pointer] = tempColor;
    }
  }
}