package {
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;
	
	public class Objetos extends Sprite{
		private const TS:uint = 24;
		private var fieldArray:Array;
		private var fieldSprite:Sprite;
		private var tetrominoes:Array = new Array();
		private var colors:Array = new Array();
		private var tetromino:Sprite;
		private var currentTetromino:uint;
		private var nextTetromino:uint;
		private var currentRotation:uint;
		private var tRow:int;
		private var tCol:int;
		private var timeCount:Timer = new Timer(500);
		private var gameOver:Boolean = false;
		private var contador:Number;

		public function Objetos(){
			generateField();
			initTetrominoes();
			nextTetromino = Math.floor(Math.random() * 8);
			generateTetromino();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKDown);
		}
		private function generateField():void{
			var colors:Array = new Array("0x4444444","0x5555555");
			fieldArray = new Array;
			var fieldSprite:Sprite = new Sprite;
			addChild(fieldSprite);
			fieldSprite.graphics.lineStyle(0, 0x000000);
			for (var i:uint = 0; i < 20; i++){
				fieldArray[i] = new Array;
				for (var j:uint = 0; j < 10; j++){
					fieldArray[i][j] = 0;
					fieldSprite.graphics.beginFill(colors[(j% 2 + i % 2) % 2]);
					fieldSprite.graphics.drawRect(TS * j, TS * i, TS, TS);
					fieldSprite.graphics.endFill();
				}
			}
		}
		private function initTetrominoes():void{
			tetrominoes[0] =  [
			// |
			[
			[0,0,0,0],
			[1,1,1,1],
			[0,0,0,0],
			[0,0,0,0]
			],
			[
			[0,1,0,0],
			[0,1,0,0],
			[0,1,0,0],
			[0,1,0,0]
			],
			[
			[0,0,0,0],
			[1,1,1,1],
			[0,0,0,0],
			[0,0,0,0]
			],
			[
			[0,1,0,0],
			[0,1,0,0],
			[0,1,0,0],
			[0,1,0,0]
			]
			];
			colors[0] = 0x00FFFF;
			//J
			tetrominoes[1] = [
			[
			[0,0,0,0],
			[0,1,1,1],
			[0,1,0,0],
			[0,0,0,0]
			],
			[
			[0,0,0,0],
			[1,1,0,0],
			[0,1,0,0],
			[0,1,0,0]
			],
			[
			[0,1,0,0],
			[0,1,1,1],
			[0,0,0,0],
			[0,0,0,0]
			],
			[
			[0,0,0,0],
			[0,1,1,0],
			[0,1,0,0],
			[0,1,0,0]
			]
			];
			colors[1] = 0xAA00FF;
			//L
			tetrominoes[2] = [
			[
			[0,0,0,0],
			[1,1,1,0],
			[1,0,0,0],
			[0,0,0,0]
			],
			[
			[1,1,0,0],
			[0,1,0,0],
			[0,1,0,0],
			[0,0,0,0]
			],
			[
			[0,0,1,0],
			[1,1,1,0],
			[0,0,0,0],
			[0,0,0,0]
			],
			[
			[0,1,0,0],
			[0,1,0,0],
			[0,1,1,0],
			[0,0,0,0]
			]
			];
			colors[2] = 0xFFA500;
			// T
			tetrominoes[3] = [
			[
			[0,1,0,0],
			[1,1,1,0],
			[0,0,0,0],
			[0,0,0,0]
			],
			[
			[0,1,0,0],
			[1,1,0,0],
			[0,1,0,0],
			[0,0,0,0]
			],
			[
			[0,0,1,0],
			[0,0,1,1],
			[0,0,1,0],
			[0,0,0,0]
			],
			[
			[0,0,0,0],
			[1,1,1,0],
			[0,1,0,0],
			[0,0,0,0]
			]
			];
			colors[3] = 0x0000FF;
			// Z
			tetrominoes[4] = [
			[
			[0,0,0,0],
			[1,1,0,0],
			[0,1,1,0],
			[0,0,0,0]
			],
			[
			[0,0,1,0],
			[0,1,1,0],
			[0,1,0,0],
			[0,0,0,0]
			],
			[
			[0,0,0,0],
			[1,1,0,0],
			[0,1,1,0],
			[0,0,0,0]
			],
			[
			[0,0,1,0],
			[0,1,1,0],
			[0,1,0,0],
			[0,0,0,0]
			]
			];
			colors[4] = 0xFF0000;
			// S
			tetrominoes[5] = [
			[
			[0,0,0,0],
			[0,1,1,0],
			[1,1,0,0],
			[0,0,0,0]
			],
			[
			[0,1,0,0],
			[0,1,1,0],
			[0,0,1,0],
			[0,0,0,0]
			],
			[
			[0,0,0,0],
			[0,1,1,0],
			[1,1,0,0],
			[0,0,0,0]
			],
			[
			[0,1,0,0],
			[0,1,1,0],
			[0,0,1,0],
			[0,0,0,0]
			]
			];
			colors[5] = 0x00FF00;
			// o
			tetrominoes[6] = [
			[
			[0,1,1,0],
			[0,1,1,0],
			[0,0,0,0],
			[0,0,0,0]
			],
			[
			[0,1,1,0],
			[0,1,1,0],
			[0,0,0,0],
			[0,0,0,0]
			],
			[
			[0,1,1,0],
			[0,1,1,0],
			[0,0,0,0],
			[0,0,0,0]
			],
			[
			[0,1,1,0],
			[0,1,1,0],
			[0,0,0,0],
			[0,0,0,0]
			]
			];
			colors[6] = 0xFFFF00;
			//.
			tetrominoes[7] = [
			[
			[0,0,0,0],
			[0,0,1,0],
			[0,0,0,0],
			[0,0,0,0]
			],
			[
			[0,0,0,0],
			[0,0,1,0],
			[0,0,0,0],
			[0,0,0,0]
			],
			[
			[0,0,0,0],
			[0,0,1,0],
			[0,0,0,0],
			[0,0,0,0]
			],
			[
			[0,0,0,0],
			[0,0,1,0],
			[0,0,0,0],
			[0,0,0,0]
			]
			];
			colors[7] = 0xFFAA00;
		}
		private function generateTetromino():void{
			if (!gameOver){
				currentTetromino = nextTetromino;
				nextTetromino = Math.floor(Math.random() * 8);
				drawNext();
				currentRotation = 0;
				tRow = 0;
				if (tetrominoes[currentTetromino][0][0].indexOf(1) == -1){
					tRow = -1;
				}
				tCol = 3;
				drawTetromino();
				if (canFit(tRow,tCol,currentRotation)){
					timeCount.addEventListener(TimerEvent.TIMER,onTime);
					timeCount.start();
				}else{
					gameOver = true;
				}
			}
		}
		private function drawTetromino():void{
			var ct:uint = currentTetromino;
			tetromino = new Sprite;
			addChild(tetromino);
			tetromino.graphics.lineStyle(0, 0x000000);
			for (var i:int=0; i < tetrominoes[ct][currentRotation].length; i++){
				for (var j:int=0; j < tetrominoes[ct][currentRotation][i].length; j++){
					if (tetrominoes[ct][currentRotation][i][j] == 1){
						tetromino.graphics.beginFill(colors[ct]);
						tetromino.graphics.drawRect(TS * j, TS * i, TS, TS);
						tetromino.graphics.endFill();
					}
				}
			}
			placeTetromino();
		}
		private function placeTetromino():void{
			tetromino.x = tCol * TS;
			tetromino.y = tRow * TS;
		}
		private function onKDown(event:KeyboardEvent):void{
			if (! gameOver){
				switch (event.keyCode){
					case 37 :
						if (canFit(tRow,tCol - 1,currentRotation)){
							tCol--;
							placeTetromino();
						}
						break;
					case 38 :
						var rot:uint = currentRotation + 1 % tetrominoes[currentTetromino].length;
						if (rot == 4){
							rot = 0;
						}
						if (canFit(tRow,tCol,rot)){
							currentRotation = rot;
							removeChild(tetromino);
							drawTetromino();
							placeTetromino();
						}
						break;
					case 39 :
						if (canFit(tRow,tCol + 1,currentRotation)){
							tCol++;
							placeTetromino();
						}
						break;
					case 40 :
						if (canFit(tRow + 1,tCol, currentRotation)){
							tRow++;
							placeTetromino();
						}else{
							landTetromino();
							generateTetromino();
						}
						break;
				}
			}
		}
		private function canFit(row:int,col:int,side:uint):Boolean{
			var ct:uint = currentTetromino;
			for (var i:int = 0; i < tetrominoes[ct][side].length; i++){
				for (var j:int = 0; j < tetrominoes[ct][side][i].length; j++){
					if (tetrominoes[ct][side][i][j] == 1){
						//Out of left Boundary
						if (col + j < 0){
							return false;
						}
						//Out of rigth Boundary
						if (col + j > 9){
							return false;
						}
						//Out of botton Boundary
						if (row + i > 19){
							return false;
						}
						//over another Boundary
						if (fieldArray[row + i][col + j] == 1){
							return false;
						}
					}
				}
			}
			return true;
		}
		private function landTetromino():void{
			var ct:uint = currentTetromino;
			var landed:Sprite;
			for (var i:int = 0; i < tetrominoes[ct][currentRotation].length; i++){
				for (var j:int = 0; j < tetrominoes[ct][currentRotation][i].length; j++){
					if (tetrominoes[ct][currentRotation][i][j] == 1){
						landed = new Sprite  ;
						addChild(landed);
						landed.graphics.lineStyle(0, 0x000000);
						landed.graphics.beginFill(colors[currentRotation]);
						landed.graphics.drawRect(TS * (tCol + j), TS * (tRow + i), TS, TS);
						landed.graphics.endFill();
						landed.name = "r" + (tRow + i) + "c" + (tCol + j);
						fieldArray[tRow + i][tCol + j] = 1;
					}
				}
			}
			removeChild(tetromino);
			timeCount.removeEventListener(TimerEvent.TIMER, onTime);
			timeCount.stop();
			checkForLines();
		}
		private function checkForLines():void{
			for (var i:int = 0; i<20; i ++){
				if (fieldArray[i].indexOf(0) == -1){
					for (var j :int =0; j<10; j++){
						fieldArray[i][j] = 0;
						removeChild(getChildByName("r" + i + "c" + j));
						contador++;
					}
					for (j = i; j>= 0; j--){
						for (var k:int = 0; k<10; k++){
							if (fieldArray[j][k] == 1){
								fieldArray[j][k] = 0;
								fieldArray[j + 1][k] = 1;
								getChildByName("r" + j + "c" + k ).y +=TS;
								getChildByName("r" + j + "c" + k ).name = "r"+ (j+1)+"c"+k;
							}
						}
					}
				}
			}
		}
		private function onTime(e: TimerEvent):void{
			if (canFit(tRow + 1, tCol, currentRotation)){
				tRow++;
				placeTetromino();
			}else{
				landTetromino();
				generateTetromino();
			}
		}
		private function drawNext():void{
			if (getChildByName("next") != null){
				removeChild(getChildByName("next"));
				}
			var next_t:Sprite = new Sprite  ;
			next_t.x = 300;
			next_t.name = "next";
			addChild(next_t);
			next_t.graphics.lineStyle(0, 0x000000);
			for (var i : int = 0; i<tetrominoes[nextTetromino][0].length; i++){
				for (var j:int = 0; j<tetrominoes[nextTetromino][0][i].length; j++){
					if (tetrominoes[nextTetromino][0][i][j] == 1){
						next_t.graphics.beginFill(colors[nextTetromino]);
						next_t.graphics.drawRect(TS * j,TS * i,TS,TS);
						next_t.graphics.endFill();
					}
				}
			}
		}
		
	}
}