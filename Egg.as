package  {
	
	import flash.display.MovieClip;	
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Egg extends MovieClip {
		
		private var mStage:Stage;
		
		public var mAngle:Number = 0; // The Initial Angle Orbiting Starts From
		public var mSpeed:Number = 1; // Number Of Pixels Orbited Per Frame
		public var mRadius:Number = 0; // Orbiting Distance From Origin
		
		public var mX:Number;
		public var mY:Number;
		
		private var mOffset:Number;

		public function Egg(_stage:Stage, speed:Number, angle:Number, cX:Number, cY:Number, radius:Number, offset:Number) {
			// constructor code
			
			mStage = _stage;
			
			mAngle = angle;
			mAngle = 0;
			mSpeed = speed;
			mRadius = radius;
			mX = cX;
			mY = cY;
			mOffset = offset;
			
		}
		
	}
	
}
