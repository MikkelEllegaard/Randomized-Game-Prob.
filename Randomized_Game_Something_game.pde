boolean StartMenu = true;
boolean MakeGame = false;

boolean HowToPlay;
boolean About;

HashMap<String, Boolean> ThemesB = new HashMap<String, Boolean>();
HashMap<Integer, String> ThemesI = new HashMap<Integer, String>();


void setup() {
  size(1500, 800);
  
  ThemesB.put("Futuristic", false);
  ThemesB.put("Modern", false);
  ThemesB.put("Old", false);
  ThemesB.put("Western", false);
  
  ThemesI.put(1, "Futuristic");
  ThemesI.put(2, "Modern");
}

boolean Grid = true;
int GridX = 10; //How many tiles on X axis (NOT lines)
int GridY = 10; //How many tiles on Y axis (NOT lines)

void draw() {
  if (StartMenu) StartMenu();
  if (MakeGame) MakeGame();
  
  if (Grid) Grid();
}

void Grid() {
  fill(0);
  
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
  background(75, 150, 0);
}

void mousePressed() {
  if (mouseX >= width/4 && mouseX <= (width/4)+(width/2) && mouseY >= height*0.4 && mouseY <= (height*0.4)+(height*0.2)) {
    if (StartMenu) {
      StartMenu = false;
      MakeGame = true;
    }
  }
}
