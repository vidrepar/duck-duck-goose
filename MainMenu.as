package  {
	import flash.display.Stage;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.MouseEvent;
	
	public class MainMenu extends MovieClip{
		
		private var mStage:Stage;
		
		private var mPlayFunction:Function;
				
		private var mEnemy:Enemy = new Enemy(mStage, mSpeed, mAngle, mX, mY, mRadius, mOffset);
		//private var mEnemyManager:EnemyManager = new EnemyManager(mStage, mSpeed, mAngle, mX, mY, mRadius, mOffset);
		
		private var mAngle:Number = 0; // The Initial Angle Orbiting Starts From
		private var mSpeed:Number; // Number Of Pixels Orbited Per Frame
		private var mRadius:Number = 0; // Orbiting Distance From Origin
		
		private var mX:Number;
		private var mY:Number;
		
		private var mOffset:Number;
		
		private var playText:TextField = new TextField;
		//private var playTextFormat:TextFormat = new TextFormat("HighTide", 50, 0x000000); //Creates a new format for Score textfield, replace "Futura LT Heavy" with the font that you are using 
		
		private var playBtn:MovieClip = new MovieClip();
		private var gameOverText:TextField = new TextField();
		private var startText:TextField = new TextField();
		
		public function MainMenu(_stage:Stage, speed:Number, angle:Number, cX:Number, cY:Number, radius:Number, offset:Number, playFunction:Function) {
			// constructor code
			
			mStage = _stage;
			
			mAngle = angle;
			mSpeed = speed;
			mRadius = radius;
			mX = cX;
			mY = cY;
			mOffset = offset;
			
			mPlayFunction = playFunction;
			
			addEvents();
			
		}
		
		private function addEvents(){

			playBtn.addEventListener(MouseEvent.CLICK, onPlayClick);
			playBtn.addEventListener(MouseEvent.MOUSE_OVER, onTextHover);			
			playBtn.addEventListener(MouseEvent.MOUSE_OUT, onTextOut);
			
		}
		
		private function removeEvents(){
			
			playBtn.removeEventListener(MouseEvent.CLICK, onPlayClick);
			playBtn.removeEventListener(MouseEvent.MOUSE_OVER, onTextHover);			
			playBtn.removeEventListener(MouseEvent.MOUSE_OUT, onTextOut);
			
			}
			
		public function destroy(){
			
			removeEvents();
			mPlayFunction = null;
			
			}
		
		private function onPlayClick(evt:MouseEvent){
			
			mPlayFunction();
			removeBtn();
			
			}
			
		private function onTextHover(evt:MouseEvent){
			playBtn.alpha = 0.5;			
			}
			
		private function onTextOut(evt:MouseEvent){
			playBtn.alpha = 1;
			}
			
		public function removeBtn(){
			
			mStage.removeChild(playBtn);
			//mStage.removeChild(gameOverText);
			mStage.removeChild(startText);
			
			}
		
		public function createMenu(){
			
			//Backgorund
			mStage.color = 0xB4FA9B;
			
			//playBtn
			mStage.addChild(playBtn);
			playBtn.graphics.lineStyle(3,0x5DBA3C);
			playBtn.graphics.beginFill(0x5DBA3C);
			playBtn.graphics.drawRect(0,0,120,40);
			playBtn.x = mX - playBtn.width/2;
			playBtn.y = mY - playBtn.height/2;
			playBtn.addChild(playText);
			//playBtn.border = true;
			
			playText.appendText('Play');
			playText.height = 40;
			playText.width = 120;
			playText.x = playBtn.width/2 - 12;
			playText.y = 10;
			//playText.border = true;
			
			mStage.addChild(startText);
			startText.text = "Press 'Space' to release an egg and run. The bigger the enemy, the more points you get. Run, Forrest, run.";
			startText.x = mX - 130;
			startText.y = mY + 60;
			startText.height = 100;
			startText.width = 300;
			startText.wordWrap = true;
			
			}
			
		public function playAgain(){
			
			//Backgorund
			mStage.color = 0xF6A0A0;
			
			//playBtn
			mStage.addChild(playBtn);
			playBtn.graphics.lineStyle(3,0xBF0909);
			playBtn.graphics.beginFill(0xBF0909);
			playBtn.graphics.drawRect(0,0,160,40);
			playBtn.x = mX - playBtn.width/2;
			playBtn.y = mY - playBtn.height/2;
			playBtn.addChild(playText);
			//playBtn.border = true;
			
			playText.appendText('Game Over. Play Again?');
			playText.height = 40;
			playText.width = 160;
			playText.x = playBtn.width/2 - 60;
			playText.y = 10;
			//playText.border = true;
			
			/*
			mStage.addChild(gameOverText);
			gameOverText.text = "Game Over";
			gameOverText.x = mX - 30;
			gameOverText.y = mY - 60;
			gameOverText.height = 30;
			gameOverText.width = 80;
			*/
			
			}

	}
	
}
