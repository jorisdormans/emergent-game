package components 
{
	import gameObjects.Player;
	import nl.jorisdormans.phantom2D.core.Component;
	import nl.jorisdormans.phantom2D.objects.GameObject;
	import nl.jorisdormans.phantom2D.objects.ICollisionHandler;
	/**
	 * ...
	 * @author Joris Dormans
	 */
	public class EnergyPickUp extends Component implements ICollisionHandler
	{
		private var energy:Number;
		
		public function EnergyPickUp(energy:Number) 
		{
			this.energy = energy;
		}
		
		/* INTERFACE nl.jorisdormans.phantom2D.objects.ICollisionHandler */
		
		public function canCollideWith(other:GameObject):Boolean 
		{
			return true;
		}
		
		public function afterCollisionWith(other:GameObject):void 
		{
			if (other is Player)
			{
				this.parent.destroyed = true;
				other.handleMessage("increaseEnergy", energy);
			}
		}
		
	}

}