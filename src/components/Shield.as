package components 
{
	import nl.jorisdormans.phantom2D.core.Composite;
	import nl.jorisdormans.phantom2D.core.Phantom;
	import nl.jorisdormans.phantom2D.objects.GameObjectComponent;
	import nl.jorisdormans.phantom2D.particles.Particle;
	import nl.jorisdormans.phantom2D.particles.ParticleEmitter;
	
	public class Shield extends GameObjectComponent 
	{
		
		private var collisionsRest:Number;
		private var activated:Boolean;
		private var particleEmiter:ParticleEmitter;
		
		public function Shield() 
		{
			activated = false;
		}
		
		private function activateShield(data:Object):void 
		{
			if(!activated) {
				gameObject.addComponent(particleEmiter = new ParticleEmitter(Particle, 15, 0, 1.5, 0.5, 0.4, 10, 0.5));
			}
			activated = true;
			collisionsRest = data as Number;
		}
		
		private function absorbDamage(data:Object):void 
		{
			collisionsRest--;
			if (collisionsRest == 0) {
				gameObject.removeComponent(particleEmiter);
				activated = false;
			}
		}
		
		override public function handleMessage(message:String, data:Object = null, componentClass:Class = null):int 
		{
			switch(message) {
				case "activateShield":
					activateShield(data);
					return Phantom.MESSAGE_HANDLED;
				case "decreaseEnergy":
					if (activated) {
						absorbDamage(data);
						return Phantom.MESSAGE_HANDLED;
					}
					break;
			}
			return super.handleMessage(message, data, componentClass);
		}
		
		
		
	}

}