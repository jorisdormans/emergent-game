package components 
{
	import flash.geom.Vector3D;
	import nl.jorisdormans.phantom2D.objects.GameObject;
	/**
	 * ...
	 * @author Tom van Duist
	 */
	public class Follow extends Behaviour
	{
		public var target:	GameObject;
		
		public function Follow(maxVel:Number, maxSteeringForce:Number, target:GameObject = null) 
		{
			super(maxVel, maxSteeringForce);
			this.target 	= target;
		}
		
		override protected function applyBehaviour():void 
		{
			if (target == null) return;
			
			var curVel:	Vector3D 	= new Vector3D(gameObject.mover.velocity.x, gameObject.mover.velocity.y);
			var tarPos: Vector3D 	= target.position.clone();
			var desVel:	Vector3D 	= tarPos.subtract(new Vector3D(gameObject.position.x, gameObject.position.y))
			desVel.normalize();
			desVel.scaleBy(_maxVel);
			var force:	Vector3D 	= desVel.subtract(curVel);
			force.normalize();
			force.scaleBy(_maxForce);
			var newVel:	Vector3D 	= curVel.add(force);
			
			gameObject.mover.velocity = new Vector3D(newVel.x, newVel.y);
		}
		
		public function followGameObject(_gameObject:GameObject):void
		{
			target = _gameObject;
		}
		
	}

}