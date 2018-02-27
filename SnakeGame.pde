/***************************
*@author Elvin Torres elvin.torres.74@gmail.com
*@version 12/25/18
*/

//create a snake head and an arraylist for the tails
Snake snake;
ArrayList<Tail> tails;
//food object for the snake
Food food;
//variable that keeps track of the amount of tails
int totalTails;
/**************************************88
* Init Method
*/
void setup() {
  //size of the stage
 size(570,570);
 //place the snake at the top left corner of the screen
 snake = new Snake(0,0);
 //initalize all the other objects
 tails = new ArrayList<Tail>();
 food = new Food();
 frameRate(2); //set the framerate to 8 to simulate the classic snake game
 totalTails = 0;  //start out with 0 tails
}
/**************************
* Draw method that loops indefinitely 
*/
void draw() {
  background(0); //set the background to black (r,g,b) -> (0,0,0)
  drawGrid();  
  drawDashboard();
  //show the food and update the status of it
  food.show();
  food.update(snake.x, snake.y);
  //show the snake and allow it to move depending on the keyboard input
  snake.show();
  snake.move();
  //call the conditonal methods of the game. 
  eatFood();  //check if the player ate the fruit to grow
  ifCrash();  //check if the player has crashed
  follow();   //Make the tail follow the snake head
 
}

/**
*This method checks if the player has eaten the food 
*by checking the x and y location of both the food and the 
*snake. If this implication is true, then grow a tail
*/
void eatFood() {
 if(food.x == snake.x && food.y == snake.y) {
   if(totalTails == 0) {
    tails.add(new Tail(snake.px, snake.py));
    totalTails++;
    food.pickLoc();
   }
   else if(totalTails != 0){
    tails.add(new Tail(tails.get(totalTails-1).px, tails.get(totalTails-1).py)); 
    totalTails++;
    food.pickLoc();
   }
 }
}

/**
* Method that alllows the tails to move 
*/
void follow() {
 for(int i = 0; i<tails.size(); i++) {
  if(i==0) {  //if it is the first tail in the list
   tails.get(i).show(snake.px, snake.py); //then copy the previous x,y of the snake head
  }
  else
  {  //else, copy the previous x,y of the previous tail called
  tails.get(i).show(tails.get(i-1).px, tails.get(i-1).py);
  }
 }
}

//This method checks if the snake crashed
//into a wall or a tail. if it is true,
//then spawn in the middle of the screen and reset totalTails.
void ifCrash() {
  //CASE 1: if the snake crashes on the side of the screen
 if(snake.x < 0 || snake.x >= width ) {
  restart();
 }//CASE 2: if the snake crashes on the top and bottom of the screen
 else if(snake.y < 0 || snake.y >= height-30) {
   restart();
 }
 //CASE 3: if snake crashes into itself
 for(int i = 0; i< tails.size(); i++) {
   //checks the x,y of every tail in the list and compares the it with the snake head's.
  if(snake.x == tails.get(i).x && snake.y == tails.get(i).y){
    restart();
  }
 }
}

/**
*Draws the grid 15x15 pixels
*/
void drawGrid(){
  for(int i=15; i<width; i+=15){
    stroke(0,200,100);
    line(i,0,i,width-30); //stop at width-30 to draw the dashboard of the game
  }
  for(int i=15; i<width-30; i+=15){
    stroke(0,200,100);
    line(0,i,height,i); 
  }
}

/**
*Draws the dashboard that contains the info of the game
*/
void drawDashboard(){
  fill(255);
  stroke(255,0,0);
  line(0,height-30, width, height-30);  //line that seperates the dashboard and the grid
  text("Score:"+totalTails, 15, height-15);  //score label
}

void respawnInCenter(){
  snake.x = (width/2)-((width/2)%15);
   snake.y = (height/2)-((height/2)%15);
}

/**
*Restarts the snake and the score
*/
void restart(){
 respawnInCenter();
  food.pickLoc();  //pick a random location for the food as well
  while(!tails.isEmpty()) {
    tails.remove(0);
  }
  totalTails = 0; 
}