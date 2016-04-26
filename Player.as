package  {
	
	import flash.display.MovieClip;	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.text.TextField;

	
	public class Player extends MovieClip {
		
		public var mStage:Stage;
		
		public var mAngle:Number = 0; // The Initial Angle Orbiting Starts From
		public var mSpeed:Number = 1; // Number Of Pixels Orbited Per Frame
		public var mRadius:Number = 0; // Orbiting Distance From Origin
		
		public var mX:Number;
		public var mY:Number;
		
		private var mOffset:Number;
		
		public function Player(_stage:Stage, speed:Number, angle:Number, cX:Number, cY:Number, radius:Number, offset:Number) {
			// constructor code
			
			mStage = _stage;
			
			mAngle = angle;
			mAngle = -1;
			mSpeed = speed;
			mRadius = radius;
			mX = cX;
			mY = cY;
			mOffset = offset;
			
			addEvents();
			initConifg();
			
		}
		
		private function addEvents(){
			
			addEventListener(Event.ENTER_FRAME, onFrame);
			
			}
			
		private function onFrame(evt:Event){
			
			mRadius = mOffset*3.3;
			
			var rad:Number = mAngle * (Math.PI / 180); // Converting Degrees To Radians
			x = mX + mRadius * Math.cos(rad); // Position The Orbiter Along x-axis
			y = mY + mRadius * Math.sin(rad); // Position The Orbiter Along y-axis			

			rotation = (Math.atan2(y-mY, x-mX) * 180 / Math.PI);
			
			mAngle -= mSpeed; // Object will orbit clockwise
			
			//trace("In Player Tracing Player's mAngle ", mAngle);
			
			}
			
		private function initConifg(){
			
			//this.alpha = 0.4; //this is working
			this.x = -this.width/2; //not working
			this.y = -this.height/2; //not working
			
			}
			
		public function playerSpeed(){
			
			mSpeed = 1;
			
			}
		
	}
	
}
