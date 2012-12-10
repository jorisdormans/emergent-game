package components 
{
	import flash.geom.Vector3D;
	import gameObjects.*;
	import nl.jorisdormans.phantom2D.core.Component;
	import nl.jorisdormans.phantom2D.objects.ObjectLayer;
	import nl.jorisdormans.phantom2D.objects.TiledObjectLayer;
	/**
	 * ...
	 * @author Silvan D Herrema
	 */
	public class EnemySpawner extends Component
	{
		private var timer:Number;
		private var objectLayer:TiledObjectLayer;
		public var respawnRate:Number = 0;
		
		public function EnemySpawner(objectLayer:TiledObjectLayer) 
		{
			this.objectLayer = objectLayer;
			timer = 0;
		}
		
		override public function update(elapsedTime:Number):void 
		{
			super.update(elapsedTime);
			timer -= elapsedTime;
			if (timer < 0) {
				spawn();
				if (respawnRate > 12) 
				{
					timer += 1;
				} 
				else timer += 12-respawnRate;
			}
		}
		
		private function spawn():void 
		{
			var x:Number = Math.random() * 1200;
			var y:Number = Math.random() * 1200;
			var enemy:Enemy = new Enemy(objectLayer);
			objectLayer.addGameObjectSorted(enemy, new Vector3D(y, x));
		}
		
		override public function handleMessage(message:String, data:Object = null, componentClass:Class = null):int 
		{
			switch(message) {
				case "Pill":
					respawnRate++;
			}
			return super.handleMessage(message, data, componentClass);
		}
	}

}