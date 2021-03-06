

import de.bezier.guido.*;
//Declare and initialize NUM_ROWS and NUM_COLS = 20
public int NUM_ROWS = 20;
public int NUM_COLS = 20;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs = new ArrayList <MSButton>(); //ArrayList of just the minesweeper buttons that are mined

void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    
    buttons = new MSButton[NUM_ROWS][NUM_COLS];
    //your code to initialize buttons goes here
    for(int i = 0;i<NUM_ROWS;i++){
        for(int j = 0;j<NUM_COLS;j++){
            buttons[i][j] = new MSButton(i,j);
        }
    }
    
    
    setBombs();
}
public void setBombs()
{
    //your code
    int ran;
    int can;
    while(bombs.size()<=20){
        ran = (int)(Math.random()*20);
        can = (int)(Math.random()*20);
        MSButton bab = new MSButton(ran,can);
        if(bombs.contains(bab)){

        }else{
            bombs.add(bab);
        }
    }
    
}

public void draw ()
{
    background( 0 );
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    //your code here
    return false;
}
public void displayLosingMessage()
{
    //your code here
}
public void displayWinningMessage()
{
    //your code here
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
        width = 400/NUM_COLS;
        height = 400/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {
        clicked = true;
        if(mouseButton == RIGHT){
            if (marked == true){
                marked = false;
            }else{
                marked = true;
                clicked = false;
            }
        }else if(bombs.contains(this)){
            displayLosingMessage();
        }else if(countBombs(this.r,this.c) > 0){
            setLabel(""+countBombs(this.r,this.c));
        }else{
                
        }
        //your code here
    }

    public void draw () 
    {    
        if (marked)
            fill(0);
        else if( clicked && bombs.contains(this) ) 
            fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
        if(r<=NUM_ROWS || c<=NUM_COLS){
            return true;
        }
        return false;
    }
    public int countBombs(int row, int col)
    {
        int numBombs = 0;
        for(int i = row-1;i<=row+1;i++){
            for(int o = col-1;o<=col+1;o++){
                if(isValid(i,o)){
                    if(bombs.contains(buttons[i][o])){
                        numBombs += 1;
                    }
                }
            }
        }
        //your code here
        return numBombs;
    }
}



