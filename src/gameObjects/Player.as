package gameObjects 
{
	import components.*;
	import flash.geom.Vector3D;
	import nl.jorisdormans.phantom2D.objects.GameObject;
	import nl.jorisdormans.phantom2D.objects.misc.ArrowKeyHandler;
	import nl.jorisdormans.phantom2D.objects.Mover;
	import nl.jorisdormans.phantom2D.objects.renderers.BoundingShapeRenderer;
	import nl.jorisdormans.phantom2D.objects.shapes.BoundingCircle;
	/**
	 * ...
	 * @author Joris Dormans
	 */
	public class Player extends GameObject
	{
		
		public function Player() 
		{
			addComponent(new BoundingCircle(16));
			addComponent(new BoundingShapeRenderer(0xffdd00));
			addComponent(new Mover(new Vector3D(), 2, 0.5));
			addComponent(new ArrowKeyHandler(1000));
			addComponent(new Energy(50, 100));
			addComponent(new Shield());
		}
		
		override public function afterCollisionWith(other:GameObject):void 
		{
			super.afterCollisionWith(other);
			if (other is Enemy)
			{
				var energy:Number = this.getProperty("energy") as Number;
				if (energy >= 20)
				{
					handleMessage("increaseEnergy", -20);
					other.destroyed = true;
					this.objectLayer.addGameObjectSorted(new Ally(), other.position.clone());
				}
			}
		}
		
	}

}