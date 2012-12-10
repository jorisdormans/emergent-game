package components 
{
	import gameObjects.Player;
	import nl.jorisdormans.phantom2D.core.Component;
	import nl.jorisdormans.phantom2D.objects.GameObject;
	import nl.jorisdormans.phantom2D.objects.ICollisionHandler;
	
	public class ShieldPickUp extends Component implements ICollisionHandler
	{
		
		private var numOfCollisions:uint;
		
		public function ShieldPickUp(numOfCollisions:uint = 1) 
		{
			this.numOfCollisions = numOfCollisions;
		}
		
		public function canCollideWith(other:GameObject):Boolean 
		{
			return true;
		}
		
		public function afterCollisionWith(other:GameObject):void 
		{
			if (other is Player) // TODO: || other is Enemy || other is Ally)  
			{
				this.parent.destroyed = true;
				other.handleMessage("activateShield", numOfCollisions);
			}
		}
		
	}
}