package gameObjects
{
	import components.*;
	
	import flash.geom.Vector3D;
	
	import nl.jorisdormans.phantom2D.objects.GameObject;
	import nl.jorisdormans.phantom2D.objects.Mover;
	import nl.jorisdormans.phantom2D.objects.TiledObjectLayer;
	import nl.jorisdormans.phantom2D.objects.misc.ArrowKeyHandler;
	import nl.jorisdormans.phantom2D.objects.renderers.BoundingShapeRenderer;
	import nl.jorisdormans.phantom2D.objects.shapes.BoundingCircle;
	
	public class Enemy extends GameObject
	{
		public function Enemy(tiledObjectLayer:TiledObjectLayer)
		{
			addComponent(new BoundingCircle(16));
			addComponent(new BoundingShapeRenderer(0xff0000));
			addComponent(new CoinCollectMover(tiledObjectLayer, new Vector3D(50,0,0), 0, 0.5));
		//	addComponent(new Energy(50, 100));
		}
	}
}