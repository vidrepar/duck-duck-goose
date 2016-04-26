package  {
	
	import flash.display.Stage;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldType;
	import flash.display.Stage;
	import flash.display.Shape;
	
	public class Game extends MovieClip {
		
		private var mPlayer:Player;
		private var mEnemyManager:EnemyManager;
		private var mEgg:Egg = new Egg(mStage, mSpeed, mAngle, mX, mY, mRadius, mOffset);
		private var mEnemy:Enemy = new Enemy(mStage, mSpeed, mAngle, mX, mY, mRadius, mOffset);
		
		private var mEndGameFunction:Function;
		
		private var mStage:Stage;
		
		private var mAngle:Number = 0; // The Initial Angle Orbiting Starts From
		private var mSpeed:Number; // Number Of Pixels Orbited Per Frame
		private var mRadius:Number = 0; // Orbiting Distance From Origin
		
		private var mX:Number;
		private var mY:Number;
		
		private var mOffset:Number;
		
		private var isSpace = false;
		private var keyDown:Boolean = false;
		private var keyCountArray:Array = new Array;
		private var circleCountArray:Array = new Array;
		private var droppedEggArray:Array = new Array;

		private var score:Number = new Number; 
		private var points:Number = new Number;
		
        private var scoreText:TextField = new TextField(); //Creates a textfield to display the score
        //private var scoreTextFormat:TextFormat = new TextFormat("Times New Roman", 50, 0x0F9BF2); //Creates a new format for Score textfield, replace "Futura LT Heavy" with the font that you are using 

		public function Game(_stage:Stage, speed:Number, angle:Number, cX:Number, cY:Number, radius:Number, offset:Number, endGameFunction:Function) {
			// constructor code
			
			mStage = _stage;
			
			mAngle = angle;
			mSpeed = speed;
			mRadius = radius;
			mX = cX;
			mY = cY;
			mOffset = offset;
			
			mEndGameFunction = endGameFunction;

			initConfig();
			addEvents(); //Set Up Event Listeners
			createPlayer();
			createEnemies();
			createEgg();
			//playerCircle(); //Somehow not on the stage
			
		}
		
		private function initConfig(){
			
			mStage.color = 0xFFFFCC;
			
			}
			
		public function destroy(){
			
			removeEvents();
			mEndGameFunction = null;
			
			mStage.removeChild(mEgg);
			mStage.removeChild(mEnemyManager.enemyArray[0]);
			mStage.removeChild(mEnemyManager.enemyArray[1]);
			mStage.removeChild(mEnemyManager.enemyArray[2]);
			mStage.removeChild(mEnemyManager.enemyArray[3]);
			mStage.removeChild(mEnemyManager.enemyArray[4]);
			mStage.removeChild(mEnemyManager.enemyArray[5]);
			mStage.removeChild(mEnemyManager.enemyArray[6]);
			mStage.removeChild(mEnemyManager.enemyArray[7]);
			mStage.removeChild(mEnemyManager.enemyArray[8]);
			mStage.removeChild(mEnemyManager.enemyArray[9]);
			mStage.removeChild(mPlayer);
			mStage.removeChild(scoreText);
			
			}
			
		private function removeEvents(){
			//se poklici to funkcijo nekam
			mStage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			mStage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);	
			mStage.removeEventListener(Event.ENTER_FRAME, onFrame);
			
			}
		
		private function createPlayer(){
			
			mPlayer = new Player(mStage, mSpeed, mAngle, mX, mY, mRadius, mOffset); //creates new instance of Player
			mStage.addChild(mPlayer); //adds mPlayer to stage
			mPlayer.playerSpeed();
			
			}
			
			
		private function createEnemies(){
			
			mEnemyManager = new EnemyManager(mStage, mSpeed, mAngle, mX, mY, mRadius, mOffset);
			mEnemyManager.createEnemies();
			sumScore();
			
			}
		
		//Create An Egg On Stage
		private function createEgg(){
			
			mPlayer.addChild(mEgg);
			
			}
			
		
		//When Called, Egg Is Dropped On The Same Angle As Player's Angle (Which Is Moving) And Stays There
		private function dropEgg(){
			
			var rad:Number = mPlayer.mAngle * (Math.PI / 180); // Converting Degrees To Radians
			mEgg.x = mX + mPlayer.mRadius * Math.cos(rad); // Position The Orbiter Along x-axis
			mEgg.y = mY + mPlayer.mRadius * Math.sin(rad); // Position The Orbiter Along y-axis
			
			mEgg.mAngle = mPlayer.mAngle;
			
			mStage.addChild(mEgg);
			
			}
			
		//Once Egg Is Dropped You Recollect It With This Function	
		private function recollectEgg(){
			
			createEgg();
			mEgg.x = 0;
			mEgg.y = 0;
			keyCountArray.length = 0;
			
			};
		
		private function addEvents(){
			
			mStage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			mStage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);	
			mStage.addEventListener(Event.ENTER_FRAME, onFrame);
			
			}	
		
		private function onFrame(evt:Event){
			
			if(mEnemyManager.enemyArray[0].hitTestObject(mPlayer)){
					trace("HIT 0", score, points);
					points = 0;
					score = 0;
					scoreText.text = String(score);
					mEndGameFunction();
					}
			if(mEnemyManager.enemyArray[1].hitTestObject(mPlayer)){
					trace("HIT 1", score, points);
					points = 0; score = 0;
					scoreText.text = String(score);
					mEndGameFunction();
					}
			if(mEnemyManager.enemyArray[2].hitTestObject(mPlayer)){
					trace("HIT 2", score, points);
					points = 0; score = 0;
					scoreText.text = String(score);
					mEndGameFunction();
					}
			if(mEnemyManager.enemyArray[3].hitTestObject(mPlayer)){
					trace("HIT 3", score, points);
					points = 0; score = 0;
					scoreText.text = String(score);
					mEndGameFunction();
					}
			if(mEnemyManager.enemyArray[4].hitTestObject(mPlayer)){
					trace("HIT 4", score, points);
					points = 0; score = 0;
					scoreText.text = String(score);
					mEndGameFunction();
					}
			if(mEnemyManager.enemyArray[5].hitTestObject(mPlayer)){
					trace("HIT 5", score, points);
					points = 0; score = 0;
					scoreText.text = String(score);
					mEndGameFunction();
					}
			if(mEnemyManager.enemyArray[6].hitTestObject(mPlayer)){
					trace("HIT 6", score, points);
					points = 0; score = 0;
					scoreText.text = String(score);
					mEndGameFunction();
					}
			if(mEnemyManager.enemyArray[7].hitTestObject(mPlayer)){
					trace("HIT 7", score, points);
					points = 0; score = 0;
					scoreText.text = String(score);
					mEndGameFunction();
					}
			if(mEnemyManager.enemyArray[8].hitTestObject(mPlayer)){
					trace("HIT 8", score, points);
					points = 0; score = 0;
					scoreText.text = String(score);
					mEndGameFunction();
					}
			if(mEnemyManager.enemyArray[9].hitTestObject(mPlayer)){
					trace("HIT 9", score, points);
					points = 0; score = 0;
					scoreText.text = String(score);
					mEndGameFunction();
					}
			
			
			//Sestevanje rezultata
			//Enemy #0
			if(mEnemyManager.enemyArray[0].mSpeed == mEnemy.difficultyArray[0] &&
			   mEnemyManager.enemyArray[0].mAngle == mEnemy.difficultyArray[0]*6){
				points = 50;
				sumScore();
				}
			else if(mEnemyManager.enemyArray[0].mSpeed == mEnemy.difficultyArray[1] &&
			   mEnemyManager.enemyArray[0].mAngle == mEnemy.difficultyArray[1]*6){
				points = 100;
				sumScore();
				}
			else if(mEnemyManager.enemyArray[0].mSpeed == mEnemy.difficultyArray[2] &&
			   mEnemyManager.enemyArray[0].mAngle == mEnemy.difficultyArray[2]*6){
				points = 200;
				sumScore();
				}
			
			//Enemy #1
			if(mEnemyManager.enemyArray[1].mSpeed == mEnemy.difficultyArray[0] &&
			   mEnemyManager.enemyArray[1].mAngle == mEnemyManager.enemyAngleArray[0]+mEnemy.difficultyArray[0]*6){
				points = 50;
				sumScore();
				}
			else if(mEnemyManager.enemyArray[1].mSpeed == mEnemy.difficultyArray[1] &&
			   mEnemyManager.enemyArray[1].mAngle == mEnemyManager.enemyAngleArray[0]+mEnemy.difficultyArray[1]*6){
				points = 100;
				sumScore();
				}
			else if(mEnemyManager.enemyArray[1].mSpeed == mEnemy.difficultyArray[2] &&
			   mEnemyManager.enemyArray[1].mAngle == mEnemyManager.enemyAngleArray[0]+mEnemy.difficultyArray[2]*6){
				points = 200;
				sumScore();
				}
			
			//Enemy #2
			if(mEnemyManager.enemyArray[2].mSpeed == mEnemy.difficultyArray[0] &&
			   mEnemyManager.enemyArray[2].mAngle == mEnemyManager.enemyAngleArray[1]+mEnemy.difficultyArray[0]*6){
				points = 50;
				sumScore();
				}
			else if(mEnemyManager.enemyArray[2].mSpeed == mEnemy.difficultyArray[1] &&
			   mEnemyManager.enemyArray[2].mAngle == mEnemyManager.enemyAngleArray[1]+mEnemy.difficultyArray[1]*6){
				points = 100;
				sumScore();
				}
			else if(mEnemyManager.enemyArray[2].mSpeed == mEnemy.difficultyArray[2] &&
			   mEnemyManager.enemyArray[2].mAngle == mEnemyManager.enemyAngleArray[1]+mEnemy.difficultyArray[2]*6){
				points = 200;
				sumScore();
				}
			
			//Enemy #3
			if(mEnemyManager.enemyArray[3].mSpeed == mEnemy.difficultyArray[0] &&
			   mEnemyManager.enemyArray[3].mAngle == mEnemyManager.enemyAngleArray[2]+mEnemy.difficultyArray[0]*6){
				points = 50;
				sumScore();
				}
			else if(mEnemyManager.enemyArray[3].mSpeed == mEnemy.difficultyArray[1] &&
			   mEnemyManager.enemyArray[3].mAngle == mEnemyManager.enemyAngleArray[2]+mEnemy.difficultyArray[1]*6){
				points = 100;
				sumScore();
				}
			else if(mEnemyManager.enemyArray[3].mSpeed == mEnemy.difficultyArray[2] &&
			   mEnemyManager.enemyArray[3].mAngle == mEnemyManager.enemyAngleArray[2]+mEnemy.difficultyArray[2]*6){
				points = 200;
				sumScore();
				}
			
			//Enemy #4
			if(mEnemyManager.enemyArray[4].mSpeed == mEnemy.difficultyArray[0] &&
			   mEnemyManager.enemyArray[4].mAngle == mEnemyManager.enemyAngleArray[3]+mEnemy.difficultyArray[0]*6){
				points = 50;
				sumScore();
				}
			else if(mEnemyManager.enemyArray[4].mSpeed == mEnemy.difficultyArray[1] &&
			   mEnemyManager.enemyArray[4].mAngle == mEnemyManager.enemyAngleArray[3]+mEnemy.difficultyArray[1]*6){
				points = 100;
				sumScore();
				}
			else if(mEnemyManager.enemyArray[4].mSpeed == mEnemy.difficultyArray[2] &&
			   mEnemyManager.enemyArray[4].mAngle == mEnemyManager.enemyAngleArray[3]+mEnemy.difficultyArray[2]*6){
				points = 200;
				sumScore();
				}
			
			//Enemy #5
			if(mEnemyManager.enemyArray[5].mSpeed == mEnemy.difficultyArray[0] &&
			   mEnemyManager.enemyArray[5].mAngle == mEnemyManager.enemyAngleArray[4]+mEnemy.difficultyArray[0]*6){
				points = 50;
				sumScore();
				}
			else if(mEnemyManager.enemyArray[5].mSpeed == mEnemy.difficultyArray[1] &&
			   mEnemyManager.enemyArray[5].mAngle == mEnemyManager.enemyAngleArray[4]+mEnemy.difficultyArray[1]*6){
				points = 100;
				sumScore();
				}
			else if(mEnemyManager.enemyArray[5].mSpeed == mEnemy.difficultyArray[2] &&
			   mEnemyManager.enemyArray[5].mAngle == mEnemyManager.enemyAngleArray[4]+mEnemy.difficultyArray[2]*6){
				points = 200;
				sumScore();
				}
			
			//Enemy #6
			if(mEnemyManager.enemyArray[6].mSpeed == mEnemy.difficultyArray[0] &&
			   mEnemyManager.enemyArray[6].mAngle == mEnemyManager.enemyAngleArray[5]+mEnemy.difficultyArray[0]*6){
				points = 50;
				sumScore();
				}
			else if(mEnemyManager.enemyArray[6].mSpeed == mEnemy.difficultyArray[1] &&
			   mEnemyManager.enemyArray[6].mAngle == mEnemyManager.enemyAngleArray[5]+mEnemy.difficultyArray[1]*6){
				points = 100;
				sumScore();
				}
			else if(mEnemyManager.enemyArray[6].mSpeed == mEnemy.difficultyArray[2] &&
			   mEnemyManager.enemyArray[6].mAngle == mEnemyManager.enemyAngleArray[5]+mEnemy.difficultyArray[2]*6){
				points = 200;
				sumScore();
				}
			
			//Enemy #7
			if(mEnemyManager.enemyArray[7].mSpeed == mEnemy.difficultyArray[0] &&
			   mEnemyManager.enemyArray[7].mAngle == mEnemyManager.enemyAngleArray[6]+mEnemy.difficultyArray[0]*6){
				points = 50;
				sumScore();
				}
			else if(mEnemyManager.enemyArray[7].mSpeed == mEnemy.difficultyArray[1] &&
			   mEnemyManager.enemyArray[7].mAngle == mEnemyManager.enemyAngleArray[6]+mEnemy.difficultyArray[1]*6){
				points = 100;
				sumScore();
				}
			else if(mEnemyManager.enemyArray[7].mSpeed == mEnemy.difficultyArray[2] &&
			   mEnemyManager.enemyArray[7].mAngle == mEnemyManager.enemyAngleArray[6]+mEnemy.difficultyArray[2]*6){
				points = 200;
				sumScore();
				}
			
			//Enemy #8
			if(mEnemyManager.enemyArray[8].mSpeed == mEnemy.difficultyArray[0] &&
			   mEnemyManager.enemyArray[8].mAngle == mEnemyManager.enemyAngleArray[7]+mEnemy.difficultyArray[0]*6){
				points = 50;
				sumScore();
				}
			else if(mEnemyManager.enemyArray[8].mSpeed == mEnemy.difficultyArray[1] &&
			   mEnemyManager.enemyArray[8].mAngle == mEnemyManager.enemyAngleArray[7]+mEnemy.difficultyArray[1]*6){
				points = 100;
				sumScore();
				}
			else if(mEnemyManager.enemyArray[8].mSpeed == mEnemy.difficultyArray[2] &&
			   mEnemyManager.enemyArray[8].mAngle == mEnemyManager.enemyAngleArray[7]+mEnemy.difficultyArray[2]*6){
				points = 200;
				sumScore();
				}
			
			//Enemy #9
			if(mEnemyManager.enemyArray[9].mSpeed == mEnemy.difficultyArray[0] &&
			   mEnemyManager.enemyArray[9].mAngle == mEnemyManager.enemyAngleArray[8]+mEnemy.difficultyArray[0]*6){
				points = 50;
				sumScore();
				}
			else if(mEnemyManager.enemyArray[9].mSpeed == mEnemy.difficultyArray[1] &&
			   mEnemyManager.enemyArray[9].mAngle == mEnemyManager.enemyAngleArray[8]+mEnemy.difficultyArray[1]*6){
				points = 100;
				sumScore();
				}
			else if(mEnemyManager.enemyArray[9].mSpeed == mEnemy.difficultyArray[2] &&
			   mEnemyManager.enemyArray[9].mAngle == mEnemyManager.enemyAngleArray[8]+mEnemy.difficultyArray[2]*6){
				points = 200;
				sumScore();
				}
						
			
			if(mPlayer.mAngle <= -360){
				mPlayer.mAngle = 0;
				}			
			
			//ce je keyCountArray.length == 0, potem ne pobere, bug
			if(mPlayer.mAngle ==  mEgg.mAngle && keyCountArray.length !== 1){
				
				recollectEgg();
				
				}
				
			//This If's Reset The Enemy After 360 Into Initial Position
			
			// Enemy #0
			mEnemyManager.enemyArray[0].resetEnemy();
			if(mEnemyManager.enemyArray[0].mAngle == 1 ||
			   mEnemyManager.enemyArray[0].mAngle == 2 ||
			   mEnemyManager.enemyArray[0].mAngle == 3 ||
			   mEnemyManager.enemyArray[0].mAngle == 4 ||
			   mEnemyManager.enemyArray[0].mAngle == 5){
				mEnemyManager.enemyArray[0].removeEvents();//This One Stops Enemy
				mEnemyManager.enemyArray[0].mAngle = mEnemyManager.enemyAngleArray[9]; // Sets mAngle To Initial mAngle For Another Circle And Another And Another
				}
			
			// Enemy #1
			mEnemyManager.enemyArray[1].resetEnemy();
			if(mEnemyManager.enemyArray[1].mAngle == mEnemyManager.enemyAngleArray[0]+1 ||
			   mEnemyManager.enemyArray[1].mAngle == mEnemyManager.enemyAngleArray[0]+2 ||
			   mEnemyManager.enemyArray[1].mAngle == mEnemyManager.enemyAngleArray[0]+3 ||
			   mEnemyManager.enemyArray[1].mAngle == mEnemyManager.enemyAngleArray[0]+4 ||
			   mEnemyManager.enemyArray[1].mAngle == mEnemyManager.enemyAngleArray[0]+5){
				mEnemyManager.enemyArray[1].removeEvents();//This One Stops Enemy
				mEnemyManager.enemyArray[1].mAngle = mEnemyManager.enemyAngleArray[0]; // Sets mAngle To Initial mAngle For Another Circle And Another And Another
				}
			
			// Enemy #2
			mEnemyManager.enemyArray[2].resetEnemy();
			if(mEnemyManager.enemyArray[2].mAngle == mEnemyManager.enemyAngleArray[1]+1 ||
			   mEnemyManager.enemyArray[2].mAngle == mEnemyManager.enemyAngleArray[1]+2 ||
			   mEnemyManager.enemyArray[2].mAngle == mEnemyManager.enemyAngleArray[1]+3 ||
			   mEnemyManager.enemyArray[2].mAngle == mEnemyManager.enemyAngleArray[1]+4 ||
			   mEnemyManager.enemyArray[2].mAngle == mEnemyManager.enemyAngleArray[1]+5){
				mEnemyManager.enemyArray[2].removeEvents();//This One Stops Enemy
				mEnemyManager.enemyArray[2].mAngle = mEnemyManager.enemyAngleArray[1]; // Sets mAngle To Initial mAngle For Another Circle And Another And Another
				}
			
			// Enemy #3
			mEnemyManager.enemyArray[3].resetEnemy();
			if(mEnemyManager.enemyArray[3].mAngle == mEnemyManager.enemyAngleArray[2]+1 ||
			   mEnemyManager.enemyArray[3].mAngle == mEnemyManager.enemyAngleArray[2]+2 ||
			   mEnemyManager.enemyArray[3].mAngle == mEnemyManager.enemyAngleArray[2]+3 ||
			   mEnemyManager.enemyArray[3].mAngle == mEnemyManager.enemyAngleArray[2]+4 ||
			   mEnemyManager.enemyArray[3].mAngle == mEnemyManager.enemyAngleArray[2]+5){
				mEnemyManager.enemyArray[3].removeEvents();//This One Stops Enemy
				mEnemyManager.enemyArray[3].mAngle = mEnemyManager.enemyAngleArray[2]; // Sets mAngle To Initial mAngle For Another Circle And Another And Another
				}
			
			// Enemy #4
			mEnemyManager.enemyArray[4].resetEnemy();
			if(mEnemyManager.enemyArray[4].mAngle == mEnemyManager.enemyAngleArray[3]+1 ||
			   mEnemyManager.enemyArray[4].mAngle == mEnemyManager.enemyAngleArray[3]+2 ||
			   mEnemyManager.enemyArray[4].mAngle == mEnemyManager.enemyAngleArray[3]+3 ||
			   mEnemyManager.enemyArray[4].mAngle == mEnemyManager.enemyAngleArray[3]+4 ||
			   mEnemyManager.enemyArray[4].mAngle == mEnemyManager.enemyAngleArray[3]+5){
				mEnemyManager.enemyArray[4].removeEvents();//This One Stops Enemy
				mEnemyManager.enemyArray[4].mAngle = mEnemyManager.enemyAngleArray[3]; // Sets mAngle To Initial mAngle For Another Circle And Another And Another
				}
			
			// Enemy #5
			mEnemyManager.enemyArray[5].resetEnemy();
			if(mEnemyManager.enemyArray[5].mAngle == mEnemyManager.enemyAngleArray[4]+1 ||
			   mEnemyManager.enemyArray[5].mAngle == mEnemyManager.enemyAngleArray[4]+2 ||
			   mEnemyManager.enemyArray[5].mAngle == mEnemyManager.enemyAngleArray[4]+3 ||
			   mEnemyManager.enemyArray[5].mAngle == mEnemyManager.enemyAngleArray[4]+4 ||
			   mEnemyManager.enemyArray[5].mAngle == mEnemyManager.enemyAngleArray[4]+5){
				mEnemyManager.enemyArray[5].removeEvents();//This One Stops Enemy
				mEnemyManager.enemyArray[5].mAngle = mEnemyManager.enemyAngleArray[4]; // Sets mAngle To Initial mAngle For Another Circle And Another And Another
				}
			
			// Enemy #6
			mEnemyManager.enemyArray[6].resetEnemy();
			if(mEnemyManager.enemyArray[6].mAngle == mEnemyManager.enemyAngleArray[5]+1 ||
			   mEnemyManager.enemyArray[6].mAngle == mEnemyManager.enemyAngleArray[5]+2 ||
			   mEnemyManager.enemyArray[6].mAngle == mEnemyManager.enemyAngleArray[5]+3 ||
			   mEnemyManager.enemyArray[6].mAngle == mEnemyManager.enemyAngleArray[5]+4 ||
			   mEnemyManager.enemyArray[6].mAngle == mEnemyManager.enemyAngleArray[5]+5){
				mEnemyManager.enemyArray[6].removeEvents();//This One Stops Enemy
				mEnemyManager.enemyArray[6].mAngle = mEnemyManager.enemyAngleArray[5]; // Sets mAngle To Initial mAngle For Another Circle And Another And Another
				}
			
			// Enemy #7
			mEnemyManager.enemyArray[7].resetEnemy();
			if(mEnemyManager.enemyArray[7].mAngle == mEnemyManager.enemyAngleArray[6]+1 ||
			   mEnemyManager.enemyArray[7].mAngle == mEnemyManager.enemyAngleArray[6]+2 ||
			   mEnemyManager.enemyArray[7].mAngle == mEnemyManager.enemyAngleArray[6]+3 ||
			   mEnemyManager.enemyArray[7].mAngle == mEnemyManager.enemyAngleArray[6]+4 ||
			   mEnemyManager.enemyArray[7].mAngle == mEnemyManager.enemyAngleArray[6]+5){
				mEnemyManager.enemyArray[7].removeEvents();//This One Stops Enemy
				mEnemyManager.enemyArray[7].mAngle = mEnemyManager.enemyAngleArray[6]; // Sets mAngle To Initial mAngle For Another Circle And Another And Another
				}

			// Enemy #8
			mEnemyManager.enemyArray[8].resetEnemy();
			if(mEnemyManager.enemyArray[8].mAngle == mEnemyManager.enemyAngleArray[7]+1 ||
			   mEnemyManager.enemyArray[8].mAngle == mEnemyManager.enemyAngleArray[7]+2 ||
			   mEnemyManager.enemyArray[8].mAngle == mEnemyManager.enemyAngleArray[7]+3 ||
			   mEnemyManager.enemyArray[8].mAngle == mEnemyManager.enemyAngleArray[7]+4 ||
			   mEnemyManager.enemyArray[8].mAngle == mEnemyManager.enemyAngleArray[7]+5){
				mEnemyManager.enemyArray[8].removeEvents();//This One Stops Enemy
				mEnemyManager.enemyArray[8].mAngle = mEnemyManager.enemyAngleArray[7]; // Sets mAngle To Initial mAngle For Another Circle And Another And Another
				}
			
			// Enemy #9
			mEnemyManager.enemyArray[9].resetEnemy();
			if(mEnemyManager.enemyArray[9].mAngle == mEnemyManager.enemyAngleArray[8]+1 ||
			   mEnemyManager.enemyArray[9].mAngle == mEnemyManager.enemyAngleArray[8]+2 ||
			   mEnemyManager.enemyArray[9].mAngle == mEnemyManager.enemyAngleArray[8]+3 ||
			   mEnemyManager.enemyArray[9].mAngle == mEnemyManager.enemyAngleArray[8]+4 ||
			   mEnemyManager.enemyArray[9].mAngle == mEnemyManager.enemyAngleArray[8]+5){
				mEnemyManager.enemyArray[9].removeEvents();//This One Stops Enemy
				mEnemyManager.enemyArray[9].mAngle = mEnemyManager.enemyAngleArray[8]; // Sets mAngle To Initial mAngle For Another Circle And Another And Another

				}
								
			} //End Of Reseting Enemies Into Initial Position After 360 Path

			
			private var timeout;
			
		//Very Important Function That's Finally Working
		private function sumScore(){
			
			score = score + points;
			trace("score", score,
				  "points", points);
			
			scoreText.text = String(score); //This converts the score variable from a number to a string, because our score textbox can only display strings
			
			
			//Positions the score textbox and sets its type to dynamic so that it can be changed through code
			scoreText.type = TextFieldType.DYNAMIC;
			scoreText.x = mX-10;
			scoreText.y = mY-20;
			scoreText.width = 100;
			//scoreText.border = true;
			
			//Sets the format of the score textbox
			//scoreText.defaultTextFormat = scoreTextFormat;
			
			//Adds Everything To Stage
			mStage.addChild(scoreText);
			
			}
				
		public function onKeyDown(evt:KeyboardEvent){
						
			if(evt.keyCode == 32){
				
				mPlayer.mSpeed = 5;
				clearTimeout(timeout);
				isSpace = true;
				if(keyDown == false){
					keyCountArray.push(1);//just push sth to Array					
					
				}
				
				//trace(keyCountArray.length);
				
				//When keyCountArray.length (# Times Space Is Pressed) Is 1, dropEgg();
				if(keyCountArray.length == 1){
					
					dropEgg();
			
			//Enemy 0
			if(mEgg.mAngle < 0 && mEgg.mAngle > -36){
				mEnemyManager.enemyArray[0].startChasingAroundCircle();
				mEnemyManager.enemyArray[0].mX = mX;
				mEnemyManager.enemyArray[0].mY = mY;
				}
			//Enemy 1
			if(mEgg.mAngle < -324 && mEgg.mAngle > -360){
				mEnemyManager.enemyArray[1].startChasingAroundCircle();
				mEnemyManager.enemyArray[1].mX = mX;
				mEnemyManager.enemyArray[1].mY = mY;
				}
			//Enemy 2
			if(mEgg.mAngle < -288 && mEgg.mAngle > -324){
				mEnemyManager.enemyArray[2].startChasingAroundCircle();
				mEnemyManager.enemyArray[2].mX = mX;
				mEnemyManager.enemyArray[2].mY = mY;
				}
			//Enemy 3
			if(mEgg.mAngle < -252 && mEgg.mAngle > -288){
				mEnemyManager.enemyArray[3].startChasingAroundCircle();
				mEnemyManager.enemyArray[3].mX = mX;
				mEnemyManager.enemyArray[3].mY = mY;
				}
			//Enemy 4
			if(mEgg.mAngle < -216 && mEgg.mAngle > -252){
				mEnemyManager.enemyArray[4].startChasingAroundCircle();
				mEnemyManager.enemyArray[4].mX = mX;
				mEnemyManager.enemyArray[4].mY = mY;
				}
			//Enemy 5
			if(mEgg.mAngle < -180 && mEgg.mAngle > -216){
				mEnemyManager.enemyArray[5].startChasingAroundCircle();
				mEnemyManager.enemyArray[5].mX = mX;
				mEnemyManager.enemyArray[5].mY = mY;
				}
			//Enemy 6
			if(mEgg.mAngle < -144 && mEgg.mAngle > -180){
				mEnemyManager.enemyArray[6].startChasingAroundCircle();
				mEnemyManager.enemyArray[6].mX = mX;
				mEnemyManager.enemyArray[6].mY = mY;
				}
				

			//Enemy 7
			if(mEgg.mAngle < -108 && mEgg.mAngle > -144){
				mEnemyManager.enemyArray[7].startChasingAroundCircle();
				mEnemyManager.enemyArray[7].mX = mX;
				mEnemyManager.enemyArray[7].mY = mY;
				}

			//Enemy 8
			if(mEgg.mAngle < -72 && mEgg.mAngle > -108){
				mEnemyManager.enemyArray[8].startChasingAroundCircle();
				mEnemyManager.enemyArray[8].mX = mX;
				mEnemyManager.enemyArray[8].mY = mY;
				}
			
			//Enemy 9
			if(mEgg.mAngle < -36 && mEgg.mAngle > -72){
				mEnemyManager.enemyArray[9].startChasingAroundCircle();
				mEnemyManager.enemyArray[9].mX = mX;
				mEnemyManager.enemyArray[9].mY = mY;
				}
					
					}
				
				keyDown = true;
				
				//timeout + removeEventListener Is A Hack To Disable Cheating Like Pressing Space Once And Hold It Down
				timeout = setTimeout(function(){  
						   keyDown = false;
						  mPlayer.mSpeed = 1;
						   },10);
				
				}
				
				mStage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown); //This + timeout
			
			}	
			
		private function onKeyUp(evt:KeyboardEvent){
			
			if(evt.keyCode == 32){
				
				isSpace = false;
				mPlayer.mSpeed = 1;
				mStage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
				
				}
			
			}
			
		//just visual path around enemies, can erase it later on
		private function playerCircle(){
			
			var circle:Shape = new Shape(); // The instance name circle is created
			circle.graphics.lineStyle(2, 0x000000); // Give the ellipse a black, 2 pixels thick line
			circle.graphics.drawCircle(mX, mY, mOffset*(-3.3)); // Draw the circle, assigning it a x position, y position, radius.
			mStage.addChild(circle); // Add a child
			
			}
		
	}
	
}
