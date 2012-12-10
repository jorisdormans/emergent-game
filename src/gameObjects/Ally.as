package gameObjects 
{
	import components.Follow;
	import flash.geom.Vector3D;
	import nl.jorisdormans.phantom2D.objects.GameObject;
	import nl.jorisdormans.phantom2D.objects.Mover;
	import nl.jorisdormans.phantom2D.objects.renderers.BoundingShapeRenderer;
	import nl.jorisdormans.phantom2D.objects.shapes.BoundingCircle;
	
	/**
	 * ...
	 * @author Tom van Duist
	 */
	public class Ally extends GameObject 
	{
		private var followComponent:Follow = new components.Follow(100, 5);
		
		public function Ally() 
		{
			addComponent(new BoundingCircle(16));
			addComponent(new BoundingShapeRenderer(0x00ff00));
			addComponent(new Mover(new Vector3D(), 2, 0.5));
			addComponent(followComponent);
		}
		
		override public function update(elapsedTime:Number):void 
		{
			super.update(elapsedTime);
			var dis:Number = Infinity;
			var enemy:GameObject;
			for each (var e:Enemy in objectLayer.getAllObjectsOfClass(Enemy)) {
				var epos:Vector3D = e.position.clone();
				var edis:Number = epos.subtract(position).length;
				if (edis < dis) {
					dis = edis;
					enemy = e;
				}
			}
			if (enemy && followComponent.target != enemy) followComponent.followGameObject(enemy);
		}
		
		override public function afterCollisionWith(other:GameObject):void 
		{
			super.afterCollisionWith(other);
			if (other is Enemy)
			{
				this.destroyed = true;
				other.destroyed = true;
				this.objectLayer.addGameObjectSorted(new Explode(), this.position.clone());
			}
		}
		
	}

}