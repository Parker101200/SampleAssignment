int x=0;
int y=0;
int a=0;
int b=0;

int iterate=function(){
    int tmp=x*x-y*y+a;
    y=2*x*y+b;
    x=tmp;  
};

int drawAB=function(){
    point(200+a*100,200-b*100);
};

int seriesDiverges=function(n){
    for(int i=0;i<n;i++){
        iterate();
        if(x*x+y*y>4.0){
            return true;
        }
    }
};

background(128, 0, 0);
b=-2;

int stillDrawing=true;
int draw= function() {
    if(stillDrawing){
        for(int i=0;i<100;i++){
            a=a+0.01;
            if(a>=2){
                a=-2;
                b+=0.01;
                frameRate(10000);
            }
            if(b>=2){
                stillDrawing=false;
            }
            x=0;y=0;
            if(seriesDiverges(15)){
                stroke(255, 255, 255);
                drawAB();
            }
        }
    }
};