package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import nl.jorisdormans.phantom2D.core.PhantomGame;
	
	/**
	 * ...
	 * @author Joris Dormans
	 */
	public class Main extends PhantomGame 
	{
		
		public function Main():void 
		{
			super(800, 600);
			addScreen(new GameScreen());
		}
		
	}
	
}