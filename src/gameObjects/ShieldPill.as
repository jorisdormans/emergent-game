package gameObjects 
{
	import components.ShieldPickUp;
	import nl.jorisdormans.phantom2D.objects.GameObject;
	import nl.jorisdormans.phantom2D.objects.renderers.BoundingShapeRenderer;
	import nl.jorisdormans.phantom2D.objects.shapes.BoundingCircle;
	
	public class ShieldPill extends GameObject
	{
		
		public function ShieldPill() 
		{
			addComponent(new BoundingCircle(4));
			addComponent(new BoundingShapeRenderer(0x00b0ff));
			addComponent(new ShieldPickUp(1));
			doResponse = false;
		}
		
	}

}