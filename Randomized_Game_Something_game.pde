boolean Testing = true;

boolean ObstacleMade = false;
float Obstacle1, Obstacle2, Obstacle3, Obstacle4;
boolean PlayerMade = false;
int PlayerX, PlayerY, PlayerFall, PlayerJump; //Jump is the same as Fall, but seperating them makes it way easier to use
boolean MovePlayerUp, MovePlayerDown, MovePlayerLeft, MovePlayerRight;
boolean PlayerCollision;

boolean StartMenu = true;
boolean MakeGame = false;
boolean PlayGame = false;

boolean HowToPlay;
boolean About;

boolean SelectTheme;
boolean SelectGenre;
boolean SelectGameplay;

HashMap<String, Boolean> ThemesB = new HashMap<String, Boolean>();
HashMap<Integer, String> ThemesI = new HashMap<Integer, String>();
String Theme1;
String Theme2;

HashMap<String, Boolean> GenresB = new HashMap<String, Boolean>();
HashMap<Integer, String> GenresI = new HashMap<Integer, String>();
String Genre1;
String Genre2;

HashMap<String, Boolean> GameplaysB = new HashMap<String, Boolean>();
HashMap<Integer, String> GameplaysI = new HashMap<Integer, String>();
String Gameplay1;
String Gameplay2;

int MenuSizes;
int Options = 2; //Must be least 2, though currently just 2

void setup() {
  size(1500, 800);

  ThemesB.put("Realistic", false);
  ThemesB.put("Western", false);
  ThemesI.put(1, "Realistic");
  ThemesI.put(2, "Western");
  Theme1 = ThemesI.get(floor(random(1, Options+1)));
  Theme2 = ThemesI.get(floor(random(1, Options+1)));

  GenresB.put("Horror", false);
  GenresB.put("Town & City", false);
  if (Options >= 3) GenresB.put("Building", false); //works like tycoons on roblox. u get money, then press buttons to build some shit
  GenresI.put(1, "Horror");
  GenresI.put(2, "Town & City");
  if (Options >= 3) GenresI.put(3, "Building");
  Genre1 = GenresI.get(floor(random(1, Options+1)));
  Genre2 = GenresI.get(floor(random(1, Options+1)));

  GameplaysB.put("Obby", false);
  GameplaysB.put("Story", false);
  GameplaysI.put(1, "Obby");
  GameplaysI.put(2, "Story");
  Gameplay1 = GameplaysI.get(floor(random(1, Options+1)));
  Gameplay2 = GameplaysI.get(floor(random(1, Options+1)));

  MenuSizes = width;

  if (Testing) {
    println("Testermode On");
    StartMenu = false;
    MakeGame = false;
    PlayGame = true;

    ThemesB.put("Realistic", true);
    GenresB.put("Horror", true);
    GameplaysB.put("Obby", true);
  }
}

boolean Grid = true;
int GridX = 10; //How many tiles on X axis (NOT lines)
int GridY = 10; //How many tiles on Y axis (NOT lines)

void draw() {
  background(75, 150, 0);
  fill(240);
  rect(width*0.1, height*0.1, width*0.8, height*0.8);
  if (StartMenu) StartMenu();
  if (MakeGame) MakeGame();
  if (PlayGame) PlayGame();

  if (Grid) Grid();
}

void Grid() {
  fill(0);

  strokeWeight(1);

  for (int i = width/GridX; i < width; i += width/GridX) {
    line(i, 0, i, height);
  }

  for (int i = height/GridY; i < height; i+= height/GridY) {
    line(0, i, width, i);
  }
}

void StartMenu() {

  background(75, 150, 0);


  fill(255, 50, 50); //give playbutton red color
  if (mouseX >= width/4 && mouseX <= (width/4)+(width/2) && mouseY >= height*0.4 && mouseY <= (height*0.4)+(height*0.2)) fill(204, 0, 0); //is mouse hovering over play button?

  rect(width/4, height*0.4, width/2, height*0.2); //play button
  fill(0);
  textSize(100);
  text("PLAY", width*0.43, height*0.54);

  if (mouseX >= width/4 && mouseX <= (width/4)+(width/2) && mouseY >= height*0.1 && mouseY <= (height*0.1)+(height*0.2)) fill(204, 102, 0); //is mouse hovering over how to play button?
  else fill(255, 150, 50);

  rect(width/4, height*0.1, width/2, height*0.2); //how to play button

  if (mouseX >= width/4 && mouseX <= (width/4)+(width/2) && mouseY >= height*0.7 && mouseY <= (height*0.7)+(height*0.2)) fill(204, 102, 0); //is mouse hovering over about button?
  else fill(255, 150, 50);

  rect(width/4, height*0.7, width/2, height*0.2); //about button
  fill(0);
  text("HOW TO PLAY", width*0.31, height*0.24);
  text("ABOUT", width*0.4, height*0.845);

  noFill();
}

void MakeGame() {

  textAlign(LEFT);
  textSize(MenuSizes*0.05);
  fill(0);

  //Select theme
  if (SelectTheme == true) {
    text("Select Theme", width*0.15, height*0.225);
    textSize(MenuSizes*0.075);

    fill(50, 150, 255);
    if (mouseX >= width*0.3 && mouseX <= (width*0.3)+(width*0.4) && mouseY >= height*0.3 && mouseY <= (height*0.3)+(height*0.2)) fill(50, 50, 255); //is mouse hovering over first theme option?
    rect(width*0.3, height*0.3, width*0.4, height*0.2);
    fill(0);
    textAlign(CENTER);
    text(Theme1, width/2, height*0.45);

    fill(50, 150, 255);
    if (mouseX >= width*0.3 && mouseX <= (width*0.3)+(width*0.4) && mouseY >= height*0.6 && mouseY <= (height*0.6)+(height*0.2)) fill(50, 50, 255); //is mouse hovering over second theme option?
    rect(width*0.3, height*0.6, width*0.4, height*0.2);
    while (Theme2 == Theme1) Theme2 = ThemesI.get(floor(random(1, Options+1)));
    fill(0);
    text(Theme2, width/2, height*0.75);

    //Select genre
  } else if (SelectGenre == true) {
    text("Select Genre", width*0.15, height*0.225);
    textSize(MenuSizes*0.075);

    fill(50, 150, 255);
    if (mouseX >= width*0.3 && mouseX <= (width*0.3)+(width*0.4) && mouseY >= height*0.3 && mouseY <= (height*0.3)+(height*0.2)) fill(50, 50, 255); //is mouse hovering over first genre option?
    rect(width*0.3, height*0.3, width*0.4, height*0.2);
    fill(0);
    textAlign(CENTER);
    text(Genre1, width/2, height*0.45);

    fill(50, 150, 255);
    if (mouseX >= width*0.3 && mouseX <= (width*0.3)+(width*0.4) && mouseY >= height*0.6 && mouseY <= (height*0.6)+(height*0.2)) fill(50, 50, 255); //is mouse hovering over second genre option?
    rect(width*0.3, height*0.6, width*0.4, height*0.2);
    while (Genre2 == Genre1) Genre2 = GenresI.get(floor(random(1, Options+1)));
    fill(0);
    text(Genre2, width/2, height*0.75);

    //Select gameplay
  } else if (SelectGameplay == true) {
    text("Select Gameplay", width*0.15, height*0.225);
    textSize(MenuSizes*0.075);

    fill(50, 150, 255);
    if (mouseX >= width*0.3 && mouseX <= (width*0.3)+(width*0.4) && mouseY >= height*0.3 && mouseY <= (height*0.3)+(height*0.2)) fill(50, 50, 255); //is mouse hovering over first gameplay option?
    rect(width*0.3, height*0.3, width*0.4, height*0.2);
    fill(0);
    textAlign(CENTER);
    text(Gameplay1, width/2, height*0.45);

    fill(50, 150, 255);
    if (mouseX >= width*0.3 && mouseX <= (width*0.3)+(width*0.4) && mouseY >= height*0.6 && mouseY <= (height*0.6)+(height*0.2)) fill(50, 50, 255); //is mouse hovering over second gameplay option?
    rect(width*0.3, height*0.6, width*0.4, height*0.2);
    while (Gameplay2 == Gameplay1) Gameplay2 = GameplaysI.get(floor(random(1, Options+1)));
    fill(0);
    text(Gameplay2, width/2, height*0.75);
  }
}

void PlayGame() {
  if (GameplaysB.get("Obby")) { //Gameplay being made - game is made using chosen genre and theme (check "how to game ting")
    if (GenresB.get("Horror")) { //Genre being added
      color ObbyGround = (200);
      color PlayerHead = (100);
      color PlayerBody = (150);
      if (ThemesB.get("Realistic")) { //Theme being added

        fill(ObbyGround);
        strokeWeight(2);

        //Giving obstacles their heights
        if (!ObstacleMade) {
          Obstacle1 = floor(random(4, 9))*0.1;
          Obstacle2 = floor(random(4, 9))*0.1;
          Obstacle3 = floor(random(4, 9))*0.1;
          Obstacle4 = floor(random(4, 9))*0.1;

          ObstacleMade = true;
        }

        //Obstacles - ground
        rect(width*0.1, height*0.6, width*0.15, height);
        if (PlayerX >= width*0.1 && PlayerX <= (width*0.1)+(width*0.15) && PlayerY >= height*0.55-floor(height*0.025)) {
          if (PlayerJump == 0) PlayerCollision = true;
          PlayerY = floor(height*0.6)-floor(height*0.075);
        }

        rect(width*0.75, height*0.6, width*0.15, height);
        if (PlayerX >= (width*0.75-height*0.025) && PlayerX <= (width*0.75)+(width*0.15) && PlayerY >= height*0.55-floor(height*0.025)) {
          if (PlayerJump == 0) PlayerCollision = true;
          PlayerY = floor(height*0.6)-floor(height*0.075);
        }
        rect(width*0.31, int(height*Obstacle1), width*0.05, height);
        if (PlayerX >= (width*0.31-height*0.025) && PlayerX <= (width*0.31)+(width*0.05) && PlayerY >= int((height*Obstacle1)-height*0.05)-floor(height*0.025)) {
          if (PlayerJump == 0) PlayerCollision = true;
          PlayerY = floor(height*Obstacle1)-floor(height*0.075);
        }
        rect(width*0.42, int(height*Obstacle2), width*0.05, height);
        if (PlayerX >= (width*0.42-height*0.025) && PlayerX <= (width*0.42)+(width*0.05) && PlayerY >= int((height*Obstacle2)-height*0.05)-floor(height*0.025)) {
          if (PlayerJump == 0) PlayerCollision = true;
          PlayerY = floor(height*Obstacle2)-floor(height*0.075);
        }
        rect(width*0.53, int(height*Obstacle3), width*0.05, height);
        if (PlayerX >= (width*0.53-height*0.025) && PlayerX <= (width*0.53)+(width*0.05) && PlayerY >= int((height*Obstacle3)-height*0.05)-floor(height*0.025)) {
          if (PlayerJump == 0) PlayerCollision = true;
          PlayerY = floor(height*Obstacle3)-floor(height*0.075);
        }
        rect(width*0.64, int(height*Obstacle4), width*0.05, height);
        if (PlayerX >= (width*0.64-height*0.025) && PlayerX <= (width*0.64)+(width*0.05) && PlayerY >= int((height*Obstacle4)-height*0.05)-floor(height*0.025)) {
          if (PlayerJump == 0) PlayerCollision = true;
          PlayerY = floor(height*Obstacle4)-floor(height*0.075);
        }

        //Making sure no obstacle goes through screen
        fill(75, 150, 0);
        rect(0, height*0.9, width, height*0.1);

        //Player
        if (!PlayerMade) {
          PlayerX = floor(width*0.15);
          PlayerY = floor(height*0.525);

          PlayerMade = true;
        }

        fill(PlayerHead);
        rect(PlayerX, PlayerY, height*0.025, height*0.025);
        fill(PlayerBody);
        rect(PlayerX, PlayerY+(height*0.025), height*0.025, height*0.05);

        //Player movement
        if (MovePlayerRight && PlayerX < (width*0.9)-(height*0.03)) PlayerX = PlayerX + floor(width*0.002);
        if (MovePlayerLeft && PlayerX > (width*0.105)) PlayerX = PlayerX - floor(width*0.002);

        if (MovePlayerUp) {
          if (PlayerJump > 0 && PlayerY > height*0.1 + 25) {
            PlayerY = PlayerY - PlayerJump;
            PlayerJump--;
          } else if (PlayerJump <= 0 || PlayerY <= height*0.1 + 25) {
            PlayerJump = 0;
            if (!PlayerCollision) {
              PlayerY = PlayerY + PlayerFall;
              PlayerFall++;
            } else if (PlayerCollision) {
              PlayerFall = 0;
              MovePlayerUp = false;
            }
          }
        }
        
        
      }
    }
  }
  noFill();

  strokeWeight(10);
  line(width*0.1, height*0.1, width*0.1, height*0.9); //lodret
  line(width*0.9, height*0.1, width*0.9, height*0.9);
  line(width*0.1, height*0.1, width*0.9, height*0.1); //vandret
  line(width*0.1, height*0.9, width*0.9, height*0.9);
  strokeWeight(1);
}

void mouseClicked() {
  println("Mouse has been clicked");

  //StartMenu
  if (StartMenu) {
    if (mouseX >= width/4 && mouseX <= (width/4)+(width/2) && mouseY >= height*0.4 && mouseY <= (height*0.4)+(height*0.2)) {
      StartMenu = false;
      MakeGame = true;
      SelectTheme = true;

      println("MakeGame = " + MakeGame + " & SelectTheme = " + SelectTheme + " & StartMenu = " + StartMenu);
    }
  }

  //Theme selection
  else if (MakeGame == true && SelectTheme == true) {
    if (mouseX >= width*0.3 && mouseX <= (width*0.3)+(width*0.4) && mouseY >= height*0.3 && mouseY <= (height*0.3)+(height*0.2)) {
      ThemesB.put(Theme1, true);
      SelectTheme = false;
      SelectGenre = true;

      println("MakeGame = " + MakeGame + " & SelectTheme = " + SelectTheme + " & SelectGenre = " + SelectGenre);
    } else if (mouseX >= width*0.3 && mouseX <= (width*0.3)+(width*0.4) && mouseY >= height*0.6 && mouseY <= (height*0.6)+(height*0.2)) {
      ThemesB.put(Theme2, true);
      SelectTheme = false;
      SelectGenre = true;

      println("MakeGame = " + MakeGame + " & SelectTheme = " + SelectTheme + " & SelectGenre = " + SelectGenre);
    }

    //Genre selection
  } else if (MakeGame == true && SelectGenre == true) {
    if (mouseX >= width*0.3 && mouseX <= (width*0.3)+(width*0.4) && mouseY >= height*0.3 && mouseY <= (height*0.3)+(height*0.2)) {
      GenresB.put(Genre1, true);
      SelectGenre = false;
      SelectGameplay = true;

      println("MakeGame = " + MakeGame + " & SelectGenre = " + SelectGenre + " & SelectGameplay = " + SelectGameplay);
    } else if (mouseX >= width*0.3 && mouseX <= (width*0.3)+(width*0.4) && mouseY >= height*0.6 && mouseY <= (height*0.6)+(height*0.2)) {
      GenresB.put(Genre2, true);
      SelectGenre = false;
      SelectGameplay = true;

      println("MakeGame = " + MakeGame + " & SelectGenre = " + SelectGenre + " & SelectGameplay = " + SelectGameplay);
    }
  } else if (MakeGame == true && SelectGameplay == true) {
    if (mouseX >= width*0.3 && mouseX <= (width*0.3)+(width*0.4) && mouseY >= height*0.3 && mouseY <= (height*0.3)+(height*0.2)) {
      GameplaysB.put(Gameplay1, true);
      SelectGameplay = false;
      PlayGame = true;
    } else if (mouseX >= width*0.3 && mouseX <= (width*0.3)+(width*0.4) && mouseY >= height*0.6 && mouseY <= (height*0.6)+(height*0.2)) {
      GameplaysB.put(Gameplay2, true);
      SelectGameplay = false;
      PlayGame = true;
    }
  }
}

void keyPressed() {
  //Universal movement
  if (key == 'a') MovePlayerLeft = true;
  if (key == 'd') MovePlayerRight = true;
  
  //Movement for certain gameplays
  if ((key == 'w' || key == ' ') && !MovePlayerUp) {
    MovePlayerUp = true;
    if (GameplaysB.get("Obby")) {
      PlayerJump = 25;
      PlayerCollision = false;
    }
  }
}

void keyReleased() {
  if (key == 'a') MovePlayerLeft = false;
  if (key == 'd') MovePlayerRight = false;
}
