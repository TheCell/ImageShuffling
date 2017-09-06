public final class Sortingengine
{
  public void horizontal(
    int imgWidth, 
    int imgHeight, 
    int[] pixels, 
    String order)
  {
    StringBuilder strBuilder = new StringBuilder(order);

    for (int i = strBuilder.length() -1; i >= 0; i--)
    {
      switch(strBuilder.charAt(i))
      {
      case 'R':
        sortByRedHorizontal(imgWidth, imgHeight, pixels);
        break;
      case 'G':
        sortByGreenHorizontal(imgWidth, imgHeight, pixels);
        break;
      case 'B':
        sortByBlueHorizontal(imgWidth, imgHeight, pixels);
        break;
      case 'A':

        break;
      default:
        println("nothing found for color " + strBuilder.charAt(i));
        break;
      }
    }
  }

  public void vertical(
    int imgWidth, 
    int imgHeight, 
    int[] pixels, 
    String order)
  {
    StringBuilder strBuilder = new StringBuilder(order);

    for (int i = strBuilder.length() -1; i >= 0; i--)
    {
      switch(strBuilder.charAt(i))
      {
      case 'R':
        sortByRedVertical(imgWidth, imgHeight, pixels);
        break;
      case 'G':
        sortByGreenVertical(imgWidth, imgHeight, pixels);
        break;
      case 'B':
        sortByBlueVertical(imgWidth, imgHeight, pixels);
        break;
      case 'A':

        break;
      default:
        println("nothing found for color " + strBuilder.charAt(i));
        break;
      }
    }
  }

  public void fuzzyStrips(
    int imgWidth, 
    int imgHeight, 
    int stripSize, 
    String order, 
    int[] pixels
    )
  {
    StringBuilder strBuilder = new StringBuilder(order);
    Integer seed = (int) random(100);

    for (int i = strBuilder.length() -1; i >= 0; i--)
    {
      switch(strBuilder.charAt(i))
      {
      case 'R':
        randomSeed(seed);
        fuzzyStripsRed(imgWidth, imgHeight, stripSize, pixels);
        break;
      case 'G':
        randomSeed(seed);
        fuzzyStripsGreen(imgWidth, imgHeight, stripSize, pixels);
        break;
      case 'B':
        randomSeed(seed);
        fuzzyStripsBlue(imgWidth, imgHeight, stripSize, pixels);
        break;
      case 'A':

        break;
      default:
        println("nothing found for color " + strBuilder.charAt(i));
        break;
      }
    }
  }

  private void sortByRedHorizontal(
    int imgWidth, 
    int imgHeight, 
    int[] pixels)
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

  private void sortByGreenHorizontal(
    int imgWidth, 
    int imgHeight, 
    int[] pixels)
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

  private void sortByBlueHorizontal(
    int imgWidth, 
    int imgHeight, 
    int[] pixels)
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

  private void sortByRedVertical(
    int imgWidth, 
    int imgHeight, 
    int[] pixels)
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

  private void sortByGreenVertical(
    int imgWidth, 
    int imgHeight, 
    int[] pixels)
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

  private void sortByBlueVertical(
    int imgWidth, 
    int imgHeight, 
    int[] pixels)
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

  private void sortByRGBVertical(
    int imgWidth, 
    int imgHeight, 
    int[] pixels)
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

  private void fuzzyStripsRed(
    int imgWidth, 
    int imgHeight, 
    int stripSize, 
    int[] pixels)
  {
    for (int y = 0; y < imgHeight; y++)
    {
      // set and reset variables
      int pointer = 0;
      int tempColor = 0;
      int stripCounter = 0;
      int linestartOffset = (int) random(imgWidth) % stripSize;

      // sort the offset
      for ( int x = 0; x < linestartOffset; x++)
      {
        tempColor = pixels[x + y * imgWidth];
        pointer = x + y * imgWidth;
        // extract rgba colors
        //int a = (tempColor >> 24) & 0xFF;
        int r = (tempColor >> 16) & 0xFF;
        //int g = (tempColor >> 8) & 0xFF;
        //int b = tempColor & 0xFF;

        int posInStrip = x % linestartOffset;

        // search for the next highest sorted pixel in strip
        for (int i = posInStrip; i < linestartOffset; i++)
        {
          int compareColor = pixels[i + y * imgWidth];
          int compareR = (compareColor >> 16) & 0xFF;

          if (compareR > r)
          {
            r = compareR;
            pointer = i + y * imgWidth;
          }
        }

        // swap pixels
        pixels[x + y * imgWidth] = pixels[pointer];
        pixels[pointer] = tempColor;
      }

      // loop x values from linestartOffset to max -1
      for (int x = linestartOffset; x < imgWidth; x++)
      {
        // increase the stripCounter after completing a strip
        if ( x > linestartOffset && (x - linestartOffset) % stripSize == 0)
        {
          stripCounter++;
        }

        tempColor = pixels[x + y * imgWidth];
        pointer = x + y * imgWidth;
        // extract rgba colors
        //int a = (tempColor >> 24) & 0xFF;
        int r = (tempColor >> 16) & 0xFF;
        //int g = (tempColor >> 8) & 0xFF;
        //int b = tempColor & 0xFF;

        int posInStrip = (x - linestartOffset) % stripSize;

        // search for the next highest sorted pixel in strip
        for (int i = linestartOffset + (stripCounter * stripSize + posInStrip); i < linestartOffset + (stripCounter * stripSize + stripSize) && i < imgWidth; i++)
        {
          int compareColor = pixels[i + y * imgWidth];
          int compareR = (compareColor >> 16) & 0xFF;

          if (compareR > r)
          {
            r = compareR;
            pointer = i + y * imgWidth;
          }
        }

        // swap pixels
        pixels[x + y * imgWidth] = pixels[pointer];
        pixels[pointer] = tempColor;
      }
    }
  }

  private void fuzzyStripsGreen(
    int imgWidth, 
    int imgHeight, 
    int stripSize, 
    int[] pixels)
  {
    for (int y = 0; y < imgHeight; y++)
    {
      // set and reset variables
      int pointer = 0;
      int tempColor = 0;
      int stripCounter = 0;
      int linestartOffset = (int) random(imgWidth) % stripSize;

      // sort the offset
      for ( int x = 0; x < linestartOffset; x++)
      {
        tempColor = pixels[x + y * imgWidth];
        pointer = x + y * imgWidth;
        // extract rgba colors
        //int a = (tempColor >> 24) & 0xFF;
        //int r = (tempColor >> 16) & 0xFF;
        int g = (tempColor >> 8) & 0xFF;
        //int b = tempColor & 0xFF;

        int posInStrip = x % linestartOffset;

        // search for the next highest sorted pixel in strip
        for (int i = posInStrip; i < linestartOffset; i++)
        {
          int compareColor = pixels[i + y * imgWidth];
          int compareG = (compareColor >> 8) & 0xFF;

          if (compareG > g)
          {
            g = compareG;
            pointer = i + y * imgWidth;
          }
        }

        // swap pixels
        pixels[x + y * imgWidth] = pixels[pointer];
        pixels[pointer] = tempColor;
      }

      // loop x values from linestartOffset to max -1
      for (int x = linestartOffset; x < imgWidth; x++)
      {
        // increase the stripCounter after completing a strip
        if ( x > linestartOffset && (x - linestartOffset) % stripSize == 0)
        {
          stripCounter++;
        }

        tempColor = pixels[x + y * imgWidth];
        pointer = x + y * imgWidth;
        // extract rgba colors
        //int a = (tempColor >> 24) & 0xFF;
        //int r = (tempColor >> 16) & 0xFF;
        int g = (tempColor >> 8) & 0xFF;
        //int b = tempColor & 0xFF;

        int posInStrip = (x - linestartOffset) % stripSize;

        // search for the next highest sorted pixel in strip
        for (int i = linestartOffset + (stripCounter * stripSize + posInStrip); i < linestartOffset + (stripCounter * stripSize + stripSize) && i < imgWidth; i++)
        {
          int compareColor = pixels[i + y * imgWidth];
          int compareG = (compareColor >> 8) & 0xFF;

          if (compareG > g)
          {
            g = compareG;
            pointer = i + y * imgWidth;
          }
        }

        // swap pixels
        pixels[x + y * imgWidth] = pixels[pointer];
        pixels[pointer] = tempColor;
      }
    }
  }

  private void fuzzyStripsBlue(
    int imgWidth, 
    int imgHeight, 
    int stripSize, 
    int[] pixels)
  {
    for (int y = 0; y < imgHeight; y++)
    {
      // set and reset variables
      int pointer = 0;
      int tempColor = 0;
      int stripCounter = 0;
      int linestartOffset = (int) random(imgWidth) % stripSize;

      // sort the offset
      for ( int x = 0; x < linestartOffset; x++)
      {
        tempColor = pixels[x + y * imgWidth];
        pointer = x + y * imgWidth;
        // extract rgba colors
        //int a = (tempColor >> 24) & 0xFF;
        //int r = (tempColor >> 16) & 0xFF;
        //int g = (tempColor >> 8) & 0xFF;
        int b = tempColor & 0xFF;

        int posInStrip = x % linestartOffset;

        // search for the next highest sorted pixel in strip
        for (int i = posInStrip; i < linestartOffset; i++)
        {
          int compareColor = pixels[i + y * imgWidth];
          int compareB = (compareColor & 0xFF);

          if (compareB > b)
          {
            b = compareB;
            pointer = i + y * imgWidth;
          }
        }

        // swap pixels
        pixels[x + y * imgWidth] = pixels[pointer];
        pixels[pointer] = tempColor;
      }

      // loop x values from linestartOffset to max -1
      for (int x = linestartOffset; x < imgWidth; x++)
      {
        // increase the stripCounter after completing a strip
        if ( x > linestartOffset && (x - linestartOffset) % stripSize == 0)
        {
          stripCounter++;
        }

        tempColor = pixels[x + y * imgWidth];
        pointer = x + y * imgWidth;
        // extract rgba colors
        //int a = (tempColor >> 24) & 0xFF;
        //int r = (tempColor >> 16) & 0xFF;
        //int g = (tempColor >> 8) & 0xFF;
        int b = tempColor & 0xFF;

        int posInStrip = (x - linestartOffset) % stripSize;

        // search for the next highest sorted pixel in strip
        for (int i = linestartOffset + (stripCounter * stripSize + posInStrip); i < linestartOffset + (stripCounter * stripSize + stripSize) && i < imgWidth; i++)
        {
          int compareColor = pixels[i + y * imgWidth];
          int compareB = (compareColor & 0xFF);

          if (compareB > b)
          {
            b = compareB;
            pointer = i + y * imgWidth;
          }
        }

        // swap pixels
        pixels[x + y * imgWidth] = pixels[pointer];
        pixels[pointer] = tempColor;
      }
    }
  }
}