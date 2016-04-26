package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class Main extends MovieClip {
				
		private var mGame:Game;
		private var mainMenu:MainMenu;
		
		private var mEnemyManager:EnemyManager;
		
		private var angle:Number = 0; // The Initial Angle Orbiting Starts From
		private var speed:Number = 1; // Number Of Pixels Orbited Per Frame
		private var radius:Number = 0; // Orbiting Distance From Origin
		
		private var cX:Number = stage.stageWidth/2;
		private var cY:Number = stage.stageHeight/2;
		
		private var offset:Number = Math.random()*10-60;

		
		public function Main() {
			// constructor code
			
			createMenu();
			//createGame();
			
		}

		private function createMenu(){
			
			mainMenu = new MainMenu(stage, speed, angle, cX, cY, radius, offset, createGame);
			mainMenu.createMenu();
			
			mainMenu.x = stage.stageWidth/2 - mainMenu.width/2;
			mainMenu.y = stage.stageHeight/2 - mainMenu.height/2;
			
			addChild(mainMenu);
			
			}
		private function removeMainMenu(){
			
			mainMenu.destroy();
			//removeChild(mainMenu);
			mainMenu = null;
			
			}
		
	
		private function createGame(){
			
			removeMainMenu();
			mGame = new Game(stage, speed, angle, cX, cY, radius, offset, endGame);
			//stage.addChild(mGame);
			
			}
			
		private function removeGame(){
			
			mGame.destroy();
			mGame = null;
			
			//Remove Elements from Stage
			
			}
			
		private function endGame(){
			
			removeGame();
			
			mainMenu = new MainMenu(stage, speed, angle, cX, cY, radius, offset, createGame);
			mainMenu.playAgain();
			
			mainMenu.x = stage.stageWidth/2 - mainMenu.width/2;
			mainMenu.y = stage.stageHeight/2 - mainMenu.height/2;
			
			addChild(mainMenu);
			
			}
		
	}
	
}
