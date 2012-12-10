package components 
{
	import gameObjects.Enemy;
	import gameObjects.Player;
	import nl.jorisdormans.phantom2D.core.Component;
	import nl.jorisdormans.phantom2D.objects.GameObject;
	import nl.jorisdormans.phantom2D.objects.GameObjectComponent;
	import nl.jorisdormans.phantom2D.objects.ICollisionHandler;
	/**
	 * ...
	 * @author Joris Dormans
	 */
	public class EnergyPickUp extends GameObjectComponent implements ICollisionHandler
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
			if (other is Player|| other is Enemy)
			{
				this.parent.destroyed = true;
				other.handleMessage("increaseEnergy", energy);
				(this.gameObject.objectLayer.screen as GameScreen).enemySpawner.handleMessage("Pill");
			}
		}
		
	}

}