package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Stage;
	import flash.display.Shape;
	import flash.text.TextField;
	import com.greensock.TweenLite;
	
	public class EnemyManager extends MovieClip{
		
		private var mStage:Stage;
		public var mEnemy:Enemy;
		private var mPlayer:Player = new Player(mStage, mSpeed, mAngle, mX, mY, mRadius, mOffset);
		
		private var mAngle:Number = 0; // The Initial Angle Orbiting Starts From
		public var mSpeed:Number; // Number Of Pixels Orbited Per Frame
		private var mRadius:Number = 0; // Orbiting Distance From Origin
		
		private var mX:Number;
		private var mY:Number;
		
		private var mOffset:Number;
		
		public var enemyArray:Array = new Array;
		public var enemyAngleArray:Array = new Array;
		
		public var difficultyArray:Array = new Array;

		public function EnemyManager(_stage:Stage, speed:Number, angle:Number, cX:Number, cY:Number, radius:Number, offset:Number) {
			// constructor code
			
			mStage = _stage;
			
			mAngle = angle;
			mSpeed = speed;
			mRadius = radius;
			mX = cX;
			mY = cY;
			mOffset = offset;
			
			//mSpeed = 1.5;//Try Speeds: 2, 1.5, 1
			mRadius = mOffset*3.3;
			
			//createEnemies();
			addEvents();
			
		}
		
		private function addEvents(){
			
			mStage.addEventListener(Event.ENTER_FRAME, onFrame);
			
			//trace(mEnemy.mSpeed);
			
			}
			
		private function onFrame(evt:Event){
			
			}
		
		public function createEnemies(){
			
			difficultyArray = [1, 1.5, 2];
			
			for(var i:int=0;i<10;i++){
				
				mEnemy = new Enemy(mStage, mSpeed, mAngle, mX, mY, mRadius, mOffset);
				mEnemy.difficulty();
				mAngle = (360/10)*(i+1);
				mStage.addChild(mEnemy); //Just A Visual Presentation On The Stage
				enemyArray.push(mEnemy);
				enemyAngleArray.push(mAngle);
				
				trace(getBounds(mEnemy));
				
				//Animating Creation Of Enemies
				TweenLite.from(mEnemy, 0.4,{x:mX, y:mY, scaleX:mEnemy.mSpeed, scaleY:mEnemy.mSpeed, delay:Math.random()/1}); //ease:Back.easeOut
				
				/* //If This Text Is Displayed, Bounding Box Of Enemies Is Enormous And Invisible And Causes Problems With HitTestObject
				//i of Enemy, displayed/seen on stage
				var enemyNumber:TextField = new TextField();
				enemyNumber.text = String(i) + String("       ") + String(mAngle);
				mEnemy.addChild(enemyNumber);
				*/
				
				//trace(mEnemy.mSpeed);
				
				}
				
			}

	}
	
}
