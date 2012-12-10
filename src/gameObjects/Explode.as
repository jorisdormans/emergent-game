package gameObjects 
{
	import flash.display.Graphics;
	import flash.geom.Vector3D;
	import nl.jorisdormans.phantom2D.objects.GameObject;
	import nl.jorisdormans.phantom2D.objects.renderers.BoundingShapeRenderer;
	import nl.jorisdormans.phantom2D.objects.shapes.BoundingCircle;
	/**
	 * ...
	 * @author Jerry
	 */
	public class Explode extends GameObject
	{
		private var _radius:Number = 0;
		private var circle:BoundingCircle;
		
		public function Explode() 
		{
			addComponent(circle = new BoundingCircle(_radius));
			addComponent(new BoundingShapeRenderer(0xFF0000));
			
		}
		
		public function spawnPills():void 
		{
			for (var i:int = 0; i < Math.random()*2; i++) 
			{
				var pill:Pill = new Pill();
				this.objectLayer.addGameObject(pill, new Vector3D(position.x+Math.random()*6+1,position.y+Math.random()*6+1));
			}
		}
		
		override public function initialize():void 
		{
			super.initialize();
			
			spawnPills();
		}
		
		override public function update(elapsedTime:Number):void 
		{
			super.update(elapsedTime);
			circle.radius += 5;
			if (circle.radius > 50) this.destroyed = true;
			
		}
		
		override public function render(graphics:Graphics, x:Number, y:Number, angle:Number, zoom:Number):void 
		{
			super.render(graphics, x, y, angle, zoom);
		}
		
		public function get radius():int 
		{
			return _radius;
		}
		
		public function set radius(value:int):void 
		{
			_radius = value;
		}
		
		override public function afterCollisionWith(other:GameObject):void 
		{
			super.afterCollisionWith(other);
		
			
			other.handleMessage("damage");
			

		}
		
	}

}