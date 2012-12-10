package components 
{
	import nl.jorisdormans.phantom2D.core.Phantom;
	import nl.jorisdormans.phantom2D.objects.GameObjectComponent;
	/**
	 * ...
	 * @author Joris Dormans
	 */
	public class Energy extends GameObjectComponent
	{
		private var max:Number;
		private var current:Number;
		
		public function Energy(current:Number, max:Number) 
		{
			this.current = current;
			this.max = max;
		}
		
		override public function getProperty(property:String, data:Object = null, componentClass:Class = null):Object 
		{
			switch (property)
			{
				case "energy":
					return this.current;
				case "maxEnergy":
					return this.max;
				case "energyLevel":
					var r:Number = current / max;
					r = Math.max(Math.min(r, 1), 0);
					return r;
			}
			return super.getProperty(property, data, componentClass);
		}
		
		override public function handleMessage(message:String, data:Object = null, componentClass:Class = null):int 
		{
			switch (message)
			{
				case "increaseEnergy":
					this.current += data as Number;
					this.current = Math.max(Math.min(this.current, this.max), 0);
					return Phantom.MESSAGE_HANDLED;
			}
			return super.handleMessage(message, data, componentClass);
		}
		
	}

}