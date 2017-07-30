PImage img;

// found settings and variable size through https://forum.processing.org/two/discussion/12079/problem-with-3-x-pimage-and-size-errors
// thanks https://forum.processing.org/two/profile/56/GoToLoop for pointing that out
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
    // set and reset variables
    int pointer = 0;
    int tempColor = 0;

    // loop x values from 0 to max -1
    for (int x = 0; x < imgWidth -1; x++)
    {
      // save first color of width
      tempColor = pixels[x + y * imgWidth];
      int r = (tempColor >> 16) & 0xFF;
      // extract rgba colors
      //int a = (tempColor >> 24) & 0xFF;
      //int g = (tempColor >> 8) & 0xFF;
      //int b = tempColor & 0xFF;
      
      // set pointer to first unsorted element of current width
      pointer = x + y * imgWidth;

      // loop rest of array, search biggest color (messured by red)
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

      // exchange colors, highest remaining color is now sorted 
      pixels[x + y * imgWidth] = pixels[pointer];
      pixels[pointer] = tempColor;
    }
  }
}