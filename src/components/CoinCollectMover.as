package components
{
	import flash.geom.Vector3D;
	
	import gameObjects.Pill;
	import gameObjects.Wall;
	
	import nl.jorisdormans.phantom2D.objects.GameObject;
	import nl.jorisdormans.phantom2D.objects.ICollisionHandler;
	import nl.jorisdormans.phantom2D.objects.Mover;
	import nl.jorisdormans.phantom2D.objects.Tile;
	import nl.jorisdormans.phantom2D.objects.TiledObjectLayer;
	
	public class CoinCollectMover extends Mover
	{
		public var tiledLayer:TiledObjectLayer;
		private var tilePosition:Vector3D = new Vector3D();

		
		public function CoinCollectMover(tiledLayer:TiledObjectLayer, velocity:Vector3D, friction:Number = 2, bounceRestitution:Number = 1, initiateCollisionCheck:Boolean = true) 
		{
			super(velocity, friction, bounceRestitution, initiateCollisionCheck);
			
			this.tiledLayer = tiledLayer;
		}
	
		
		override public function update(elapsedTime:Number):void {
			tilePosition = gameObject.position.clone();
			
			outerloop:
			for (var y:int = -1; y <= 1; y++)
			{
				for (var x:int = -1; x <= 1; x++)
				{
					var objectTilePosition:Vector3D = new Vector3D(tilePosition.x + x * tiledLayer.tilesX, tilePosition.y + y * tiledLayer.tilesY,0);
					var objectAtTile:GameObject = tiledLayer.getObjectAt(objectTilePosition);
					
					if (objectAtTile is Pill){
						var speed:Number = velocity.length;
						velocity = objectAtTile.position.subtract(gameObject.position);
						velocity.normalize();
						velocity.scaleBy(speed);
						break outerloop;
					}
				}
			}
			
			var direction:Vector3D = velocity.clone();
			direction.normalize();
			direction.scaleBy(tiledLayer.tileSize);
			var nextTilePosition:Vector3D = tilePosition.add(direction);
			
			if (tiledLayer.getObjectAt(nextTilePosition) is Wall){
					velocity.negate();
			}
			
			super.update(elapsedTime);
		}	
	}
}