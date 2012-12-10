package components 
{
	import flash.geom.Vector3D;
	import nl.jorisdormans.phantom2D.objects.GameObjectComponent;
	/**
	 * ...
	 * @author Tom van Duist
	 */
	public class Behaviour extends GameObjectComponent
	{
		protected var _maxVel:		Number;
		protected var _maxForce:	Number;
		
		public function Behaviour(maxVel:Number, maxSteeringForce:Number) 
		{
			this._maxVel 	= maxVel;
			this._maxForce 	= maxSteeringForce;
		}
		
		override public function updatePhysics(elapsedTime:Number):void 
		{
			applyBehaviour();
			var newVel:Vector3D = gameObject.mover.velocity;
			newVel.normalize();
			newVel.scaleBy(_maxVel);
			super.updatePhysics(elapsedTime);
		}
		
		protected function applyBehaviour():void 
		{
			
		}
		
	}

}