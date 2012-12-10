package gameObjects 
{
	import flash.geom.Vector3D;
	import nl.jorisdormans.phantom2D.objects.GameObject;
	import nl.jorisdormans.phantom2D.objects.renderers.BoundingShapeRenderer;
	import nl.jorisdormans.phantom2D.objects.shapes.BoundingBoxAA;
	/**
	 * ...
	 * @author Joris Dormans
	 */
	public class Wall extends GameObject
	{
		
		public function Wall() 
		{
			addComponent(new BoundingBoxAA(new Vector3D(40, 40)));
			addComponent(new BoundingShapeRenderer(0));
		}
		
	}

}