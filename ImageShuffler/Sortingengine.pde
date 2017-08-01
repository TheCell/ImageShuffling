public final class Sortingengine
{
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

  void sortByGreenHorizontal(int imgWidth, int imgHeight, int[] pixels)
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

        // extract rgba colors
        //int a = (tempColor >> 24) & 0xFF;
        //int r = (tempColor >> 16) & 0xFF;
        int g = (tempColor >> 8) & 0xFF;
        //int b = tempColor & 0xFF;

        // set pointer to first unsorted element of current width
        pointer = x + y * imgWidth;

        // loop rest of array, search biggest color (messured by red)
        for (int temp = x + 1; temp < imgWidth; temp++)
        {
          int compareColor = pixels[temp + y * imgWidth];
          int compareG = (compareColor >> 8) & 0xFF;
          if (compareG > g)
          {
            g = compareG;
            pointer = temp + y * imgWidth;
          }
        }

        // exchange colors, highest remaining color is now sorted 
        pixels[x + y * imgWidth] = pixels[pointer];
        pixels[pointer] = tempColor;
      }
    }
  }

  void sortByBlueHorizontal(int imgWidth, int imgHeight, int[] pixels)
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

        // extract rgba colors
        //int a = (tempColor >> 24) & 0xFF;
        //int r = (tempColor >> 16) & 0xFF;
        //int g = (tempColor >> 8) & 0xFF;
        int b = tempColor & 0xFF;

        // set pointer to first unsorted element of current width
        pointer = x + y * imgWidth;

        // loop rest of array, search biggest color (messured by red)
        for (int temp = x + 1; temp < imgWidth; temp++)
        {
          int compareColor = pixels[temp + y * imgWidth];
          int compareB = compareColor & 0xFF;
          if (compareB > b)
          {
            b = compareB;
            pointer = temp + y * imgWidth;
          }
        }

        // exchange colors, highest remaining color is now sorted 
        pixels[x + y * imgWidth] = pixels[pointer];
        pixels[pointer] = tempColor;
      }
    }
  }

  void sortByRGBHorizontal(int imgWidth, int imgHeight, int[] pixels)
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

        // extract rgba colors
        //int a = (tempColor >> 24) & 0xFF;
        int r = (tempColor >> 16) & 0xFF;
        int g = (tempColor >> 8) & 0xFF;
        int b = tempColor & 0xFF;

        int rgb = r + g + b;

        // set pointer to first unsorted element of current width
        pointer = x + y * imgWidth;

        // loop rest of array, search biggest color (messured by red)
        for (int temp = x + 1; temp < imgWidth; temp++)
        {
          int compareColor = pixels[temp + y * imgWidth];
          int compareR = (compareColor >> 16) & 0xFF;
          int compareG = (compareColor >> 8) & 0xFF;
          int compareB = compareColor & 0xFF;

          if ((compareR + compareG + compareB) > rgb)
          {
            rgb = (compareR + compareG + compareB);
            pointer = temp + y * imgWidth;
          }
        }

        // exchange colors, highest remaining color is now sorted 
        pixels[x + y * imgWidth] = pixels[pointer];
        pixels[pointer] = tempColor;
      }
    }
  }

  void sortByRedVertical(int imgWidth, int imgHeight, int[] pixels)
  {
    for (int x = 0; x < imgWidth; x++)
    {
      // set and reset variables
      int pointer = 0;
      int tempColor = 0;

      // loop x values from 0 to max -1
      for (int y = 0; y < imgHeight -1; y++)
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
        for (int temp = y + 1; temp < imgHeight; temp++)
        {
          int compareColor = pixels[x + temp * imgWidth];
          int compareR = (compareColor >> 16) & 0xFF;
          if (compareR > r)
          {
            r = compareR;
            pointer = x + temp * imgWidth;
          }
        }

        // exchange colors, highest remaining color is now sorted 
        pixels[x + y * imgWidth] = pixels[pointer];
        pixels[pointer] = tempColor;
      }
    }
  }

  void sortByGreenVertical(int imgWidth, int imgHeight, int[] pixels)
  {
    for (int x = 0; x < imgWidth; x++)
    {
      // set and reset variables
      int pointer = 0;
      int tempColor = 0;

      // loop x values from 0 to max -1
      for (int y = 0; y < imgHeight -1; y++)
      {
        // save first color of width
        tempColor = pixels[x + y * imgWidth];
        // extract rgba colors
        //int a = (tempColor >> 24) & 0xFF;
        //int r = (tempColor >> 16) & 0xFF;
        int g = (tempColor >> 8) & 0xFF;
        //int b = tempColor & 0xFF;

        // set pointer to first unsorted element of current width
        pointer = x + y * imgWidth;

        // loop rest of array, search biggest color (messured by red)
        for (int temp = y + 1; temp < imgHeight; temp++)
        {
          int compareColor = pixels[x + temp * imgWidth];
          int compareG = (compareColor >> 8) & 0xFF;
          if (compareG > g)
          {
            g = compareG;
            pointer = x + temp * imgWidth;
          }
        }

        // exchange colors, highest remaining color is now sorted 
        pixels[x + y * imgWidth] = pixels[pointer];
        pixels[pointer] = tempColor;
      }
    }
  }

  void sortByBlueVertical(int imgWidth, int imgHeight, int[] pixels)
  {
    for (int x = 0; x < imgWidth; x++)
    {
      // set and reset variables
      int pointer = 0;
      int tempColor = 0;

      // loop x values from 0 to max -1
      for (int y = 0; y < imgHeight -1; y++)
      {
        // save first color of width
        tempColor = pixels[x + y * imgWidth];
        // extract rgba colors
        //int a = (tempColor >> 24) & 0xFF;
        //int r = (tempColor >> 16) & 0xFF;
        //int g = (tempColor >> 8) & 0xFF;
        int b = tempColor & 0xFF;

        // set pointer to first unsorted element of current width
        pointer = x + y * imgWidth;

        // loop rest of array, search biggest color (messured by red)
        for (int temp = y + 1; temp < imgHeight; temp++)
        {
          int compareColor = pixels[x + temp * imgWidth];
          int compareB = compareColor & 0xFF;
          if (compareB > b)
          {
            b = compareB;
            pointer = x + temp * imgWidth;
          }
        }

        // exchange colors, highest remaining color is now sorted 
        pixels[x + y * imgWidth] = pixels[pointer];
        pixels[pointer] = tempColor;
      }
    }
  }

  void sortByRGBVertical(int imgWidth, int imgHeight, int[] pixels)
  {
    for (int x = 0; x < imgWidth; x++)
    {
      // set and reset variables
      int pointer = 0;
      int tempColor = 0;

      // loop x values from 0 to max -1
      for (int y = 0; y < imgHeight -1; y++)
      {
        // save first color of width
        tempColor = pixels[x + y * imgWidth];
        // extract rgba colors
        //int a = (tempColor >> 24) & 0xFF;
        int r = (tempColor >> 16) & 0xFF;
        int g = (tempColor >> 8) & 0xFF;
        int b = tempColor & 0xFF;
        
        int rgb = r + g + b;

        // set pointer to first unsorted element of current width
        pointer = x + y * imgWidth;

        // loop rest of array, search biggest color (messured by red)
        for (int temp = y + 1; temp < imgHeight; temp++)
        {
          int compareColor = pixels[x + temp * imgWidth];
          int compareR = (compareColor >> 16) & 0xFF;
          int compareG = (compareColor >> 8) & 0xFF;
          int compareB = compareColor & 0xFF;

          if ((compareR + compareG + compareB) > rgb)
          {
            rgb = (compareR + compareG + compareB);
            pointer = x + temp * imgWidth;
          }
        }

        // exchange colors, highest remaining color is now sorted 
        pixels[x + y * imgWidth] = pixels[pointer];
        pixels[pointer] = tempColor;
      }
    }
  }
}