package  {
	
	import flash.display.Stage;
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.TweenLite;
	import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.text.TextFieldType;
	
	public class Enemy extends MovieClip {
		
		private var mStage:Stage;
		
		public var mAngle:Number = 0; // The Initial Angle Orbiting Starts From
		public var mSpeed:Number = 0; // Number Of Pixels Orbited Per Frame
		private var mRadius:Number = 0; // Orbiting Distance From Origin
		
		public var mX:Number;
		public var mY:Number;
		
		private var mOffset:Number;
		
		public var initX:Number;
		public var initY:Number;
		
		public var difficultyArray:Array = [1,1.5,2];
		public var speedArray:Array = [0,0,0];

		
		public var enemySpeed:Number = new Number;
		
		//private var score:Number = new Number; //Sets the score to zero
        //var scoreText:TextField = new TextField(); //Creates a textfield to display the score
        //var scoreTextFormat:TextFormat = new TextFormat("Futura LT Heavy", 50, 0x000000); //Creates a new format for Score textfield, replace "Futura LT Heavy" with the font that you are using 
		
		public function Enemy(_stage:Stage, speed:Number, angle:Number, cX:Number, cY:Number, radius:Number, offset:Number) {
			// constructor code
			
			mStage = _stage;
			
			mAngle = angle;
			mSpeed = speed;
			mRadius = radius;
			mX = cX;
			mY = cY;
			mOffset = offset;
						
			initConfig();
			
		}
		
		public function addEvents(){
			
			mStage.addEventListener(Event.ENTER_FRAME, onFrame);
			
			}
			
		public function removeEvents(){
			
			mStage.removeEventListener(Event.ENTER_FRAME, onFrame);
			
			}
					
		public function onFrame(evt:Event){
			
			var rad:Number = mAngle * (Math.PI / 180); // Converting Degrees To Radians
			this.x = mX + mRadius * Math.cos(rad); // Position The Orbiter Along x-axis
			this.y = mY + mRadius * Math.sin(rad); // Position The Orbiter Along y-axis			
			this.rotation = (Math.atan2(this.y-mY, this.x-mX) * 180 / Math.PI); // Slight Rotation Of The Orbiter
			mAngle -= mSpeed; // Object will orbit clockwise
			
			if(mAngle <= 0){
				mAngle = 360;
				}
				
			}
		
		private function initConfig(){
			
			//this.alpha = 0.2;
			mX = mX+45;
			mY = mY+45;
			
			var rad:Number = mAngle * (Math.PI / 180)+3; // Converting Degrees To Radians
			
			this.x = mX+Math.cos(rad)*100+Math.random()*10+mOffset;
			this.y = mY+Math.sin(rad)*100+Math.random()*10+mOffset;
			
			initX = this.x;
			initY = this.y;
			
						
		}
		
		public function difficulty(){
			
			mSpeed = difficultyArray[Math.floor(Math.random()*difficultyArray.length)];
			
			this.scaleX = mSpeed;
			this.scaleY = mSpeed;
			
			/*
			var enemyNumber:TextField = new TextField();
				enemyNumber.text = String(mSpeed);
				this.addChild(enemyNumber);
			*/
			
			}
		
		public function resetEnemy(){
			
			this.x = initX;
			this.y = initY;
			
		}
		
		
		public function startChasingAroundCircle(){
			
			addEvents();
			
			}
			
	}
	
}
