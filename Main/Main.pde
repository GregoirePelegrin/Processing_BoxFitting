int PROBA_POP = 200;

ArrayList<Box> boxes;

void setup(){
    size(600, 600);
    frameRate(30);
    colorMode(HSB, 255);
    rectMode(CENTER);

    boxes = new ArrayList<Box>();
    for(int i=0; i<random(20); i++){
        boxes.add(new Box(int(random(width)), int(random(height))));
    }

    background(0);
}

void draw(){
    if(random(100) <= PROBA_POP){
        for(int i=0; i<random(20); i++){
            boxes.add(new Box(int(random(width)), int(random(height))));
        }
    }
    for(Box box : boxes){
        box.expand();
        box.display();
    }
}