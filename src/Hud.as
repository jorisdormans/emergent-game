package  
{
	import gameObjects.Player;
	import nl.jorisdormans.phantom2D.cameras.Camera;
	import nl.jorisdormans.phantom2D.core.Layer;
	import nl.jorisdormans.phantom2D.objects.GameObject;
	/**
	 * ...
	 * @author Joris Dormans
	 */
	public class Hud extends Layer
	{
		private var player:GameObject;
		
		public function Hud(player:GameObject) 
		{
			this.player = player;
		}
		
		override public function render(camera:Camera):void 
		{
			super.render(camera);
			var energyLevel:Number = 0;
			if (player)
			{
				energyLevel = player.getProperty("energyLevel") as Number;
			}
			
			this.sprite.graphics.lineStyle(1, 0xffffff);
			this.sprite.graphics.drawRect(10, 10, 200, 20);
			this.sprite.graphics.lineStyle(1, 0xffff00);
			this.sprite.graphics.beginFill(0xffdd00);
			this.sprite.graphics.drawRect(12, 12, 196 * energyLevel, 16);
			this.sprite.graphics.endFill();
			this.sprite.graphics.lineStyle();
		}
		
	}

}