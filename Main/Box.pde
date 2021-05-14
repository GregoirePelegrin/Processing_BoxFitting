class Box{
    int size;
    int x;
    int y;
    boolean stuck;

    Box(int _x, int _y){
        this.x = _x;
        this.y = _y;

        boolean loop = true;
        while(loop){
            loop = false;
            for(Box box : boxes){
                if(box != this && this.touch(box)){
                    loop = true;
                    this.x = int(random(width));
                    this.y = int(random(height));
                    break;
                }
            }
        }

        this.size = 0;
        this.stuck = false;

        this.expand();
    }

    void display(){
        noStroke();
        fill(map(this.y,0,height,0,255), 255, 255);
        rect(this.x, this.y, this.size, this.size);
    }
    int expand(){
        if(this.stuck) return 0;
        this.size++;
        if(this.x-this.size/2 <= 0 || this.x+this.size/2 >= width || this.y-this.size/2 <= 0 || this.y+this.size/2 >= height){
            this.stuck = true;
            this.size--;
            return 0;
        }
        for(Box box : boxes){
            if(box != this && this.touch(box)){
                this.stuck = true;
                this.size--;
                return 0;
            }
        }
        return 0;
    }
    boolean touch(Box other){
        if(abs(this.y-other.y) <= (this.size+other.size)/2 && abs(this.x-other.x) <= (this.size+other.size)/2) return true;
        return false;
    }
}