/*picture credit
 img1:http://www.langtuw.com/Artc/show/1213
 img2:http://www.icec.org.cn/xwzx/201406/08/70841.html
 img3:http://allmumrecipe.blogspot.ca/2013/09/blog-post_9710.html
 img4:http://062220099.tw.tranews.com/
 img5:http://www.go2hn.com/jiachangcai/jcc-00003.htm
 img6:http://zh.wikipedia.org/wiki/%E7%89%9B%E9%9B%
 img7:https://media.istockphoto.com/photos/food-photography-picture-id1226284086?k=20&m=1226284086&s=170667a&w=0&h=2_fSp7SjW94lmEJN_2FOGUTebtu2LzdpSrllNtj5Cro=
 img8:http://pizzeriaitalianasacele.ro/wp-content/uploads/2014/09/margheritawiki.jpg
 img9:https://media-cdn.tripadvisor.com/media/photo-s/19/f3/62/42/veggie-burger.jpg
 img10:https://cdn.pixabay.com/photo/2014/08/26/09/33/indonesia-427784_960_720.jpg
 */
tile[] tiles=new tile[20];
int time;
int[] trackClicked=new int[200];
int[] track=new int[200];
boolean keep=false;
int[] show=new int[20];
void setup()
{
  time=0;
  size(800, 700);
  //create a number list to decide which picture put in the rectangles
  int[] numberList= {
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  };
  randomize(numberList);//shuffle the number list
  for (int i=0; i<tiles.length; i++)
  {
    tiles[i]=new tile(numberList[i]);
    tiles[i].reveal=false;
    show[i]=0;
  }
  for (int i=0; i<100; i++)
  {
    trackClicked[i]=0;
    track[i]=0;
  }
}
//write a function to shufflet the number list
void randomize(int[] a)
{
  int temp;
  for (int i=0; i<a.length; i++)
  {
    int pick=(int)random(a.length);
    temp=a[i];
    a[i]=a[pick];
    a[pick]=temp;
  }
}

void draw()
{
 
  rectMode(CENTER);
  int trueTiles=0;
  for (int i=0; i<tiles.length; i++)
  {
    if (tiles[i].reveal==false)//if the tile's reveal boolean is false, the tiles filled with white color
    {
      fill(color(255, 100, 20));
    }

    if (i<5)//place the tiles in the form of 4*3
    {
      tiles[i].x=140*(i+1)-50;
      tiles[i].y=80;
    } else if (i>=4&&i<10)
    {
      tiles[i].x=140*(i-4)-50;
      tiles[i].y=250;
    } else if (i>=10 && i<15) {
      tiles[i].x=140*(i-9)-50;
      tiles[i].y=420;
    } else
    {
      tiles[i].x=140*(i-14)-50;
      tiles[i].y=600;
    }
    rect(tiles[i].x, tiles[i].y, tiles[i].tileWidth, tiles[i].tileHeight);

    if (tiles[i].reveal==true)//if the tiles is clicked
    {

      show[i]++;
      imageMode(CENTER);

      image(tiles[i].tileColor, tiles[i].x, tiles[i].y);//show the picture
    } else
    {
      show[i]=0;
    }
    fill(0);
    if (tiles[i].reveal==true)
    {
      trueTiles++;//tracking how many tiles is revealed
    }
  }

  if (time>1&&time%2!=0)
  {
    //Clicking on a third tile reveals it and hides the previously revealed tiles when the previous two tiles' number is not the same
    if ((track[time-3]!= track[time-2]))
    {

      tiles[trackClicked[time-3]].reveal=false;
      tiles[trackClicked[time-2]].reveal=false;
    }
    //When two revealed tiles have the same color, they remain revealed until the game is over
    else
    {

      tiles[trackClicked[time-3]].reveal=true;
      tiles[trackClicked[time-2]].reveal=true;
    }
  }

  //if all the tiles are revealed,the game is over
  if (trueTiles==tiles.length)

  {
    gameOver();
  }
}
boolean over;
//create the tile class
class tile
{
  int x;
  int y;
  PImage tileColor;
  boolean reveal;
  int number;
  int tileWidth;
  int tileHeight;
  PImage spate;
  PImage[] images= {
    loadImage("img1.jpg"), loadImage("img2.jpg"), loadImage("img3.jpg"), loadImage("img4.jpg"), loadImage("img5.jpg"), loadImage("img6.jpg"), loadImage("img7.jpg"), loadImage("img8.jpg"), loadImage("img9.jpg"), loadImage("img10.jpg")
  };
  tile( int colorNumber)
  {
    reveal=false;
    tileWidth=120;
    tileHeight=120;
    number=colorNumber;
    tileColor=images[number-1];
  }
}

void mouseClicked()
{

  for (int i=0; i<tiles.length; i++)
  {//when the mouse click in the area of the tiles
    if (mouseX<=tiles[i].x+tiles[i].tileWidth/2&&mouseX>=tiles[i].x-tiles[i].tileWidth/2&&mouseY>=tiles[i].y-tiles[i].tileHeight/2&&mouseY<=tiles[i].y+tiles[i].tileHeight/2&&tiles[i].reveal==false)
    {
      tiles[i].reveal=true;

      time++;
      track[time-1]=tiles[i].number;
      trackClicked[time-1]=i;
    }
  }

  //the game restart when the player win the game and click at the screen
  if (over==true)
  {
    setup();
    over=false;
  }
}


void gameOver()
{
  fill(0);
  fill(200, 200, 500, 500);
  //if the player win , show the 'you win' text
  fill(0);
  rect(300, 300, 1000, 200);
  fill(255);
  textSize(50);
  text("YOU WIN ", 250, 340);
  fill(random(255), random(255), random(205));
  textSize(30);
  text("Click to restart ", 235, 390);
  over=true;
}
