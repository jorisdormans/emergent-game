package gameObjects 
{
	import components.*;
	import flash.geom.Vector3D;
	import nl.jorisdormans.phantom2D.objects.GameObject;
	import nl.jorisdormans.phantom2D.objects.Mover;
	import nl.jorisdormans.phantom2D.objects.renderers.BoundingShapeRenderer;
	import nl.jorisdormans.phantom2D.objects.shapes.BoundingCircle;
	/**
	 * ...
	 * @author Joris Dormans
	 */
	public class Pill extends GameObject
	{
		
		public function Pill() 
		{
			addComponent(new BoundingCircle(4));
			addComponent(new BoundingShapeRenderer(0xffb000));
			addComponent(new EnergyPickUp(10));
			addComponent(new Mover(new Vector3D()));
			doResponse = true;
		}
		
	}

}