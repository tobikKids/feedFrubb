package 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.display.MovieClip;
	import com.coreyoneil.collision.CollisionList;
	import flash.display.DisplayObject;

	public class ToyCar extends Sprite
	{
		private var _diffX:Number;
		private var _diffY:Number;
		private var _lastX:Number;
		private var _lastY:Number;
		private var _point:Point;
		private var _collisionList:CollisionList;
		private var _roadAdded:Boolean = false;
		private var _carAdded:Boolean = false;
		private var _isDragging:Boolean = false;

		public function ToyCar()
		{
			addEventListener(Event.ADDED_TO_STAGE, _init);
		}
		
		private function _init(e:Event):void
		{
			addEventListener(Event.ENTER_FRAME, _checkObjects);
			removeEventListener(Event.ADDED_TO_STAGE, _init);
		}
		
		public function dispose():void
		{
			removeEventListener(Event.ADDED_TO_STAGE, _init);
			removeEventListener(Event.ENTER_FRAME, _checkObjects);
			removeEventListener(MouseEvent.MOUSE_DOWN, _startDragging);
			stage.removeEventListener(MouseEvent.MOUSE_UP, _stopDragging);
			parent.removeEventListener(MouseEvent.MOUSE_MOVE, _mouseMove);
			_collisionList = null;
		}
		
		private function _checkObjects(e:Event):void
		{
			if(!_roadAdded && parent["mcRoad"]){
				_roadAdded = true;
				_collisionList = new CollisionList(parent["mcRoad"]);
			}
			if(_roadAdded && !_carAdded){
				_carAdded = true;
				_collisionList.addItem(this);
				addEventListener(MouseEvent.MOUSE_DOWN, _startDragging);
				stage.addEventListener(MouseEvent.MOUSE_UP, _stopDragging);
				removeEventListener(Event.ENTER_FRAME, _checkObjects);
			}
		}
		
		private function _startDragging(e:MouseEvent):void
		{
			_point = parent.globalToLocal(new Point(stage.mouseX, stage.mouseY));
			_diffX = _point.x - x;
			_diffY = _point.y - y;
			
			parent.addEventListener(MouseEvent.MOUSE_MOVE, _mouseMove);
		}
		
		private function _stopDragging(e:MouseEvent):void
		{
			parent.removeEventListener(MouseEvent.MOUSE_MOVE, _mouseMove);
		}
		
		private function _mouseMove(e:MouseEvent):void
		{
			_point = parent.globalToLocal(new Point(stage.mouseX, stage.mouseY));
			x = _point.x - _diffX;
			y = _point.y - _diffY;
			
			if(this.hitTestObject(parent["mcTarget"])){
				parent.removeEventListener(MouseEvent.MOUSE_MOVE, _mouseMove);
				removeEventListener(MouseEvent.MOUSE_DOWN, _startDragging);
				stage.removeEventListener(MouseEvent.MOUSE_UP, _stopDragging);
			}
			 
			var collisions:Array = _collisionList.checkCollisions();
			if(collisions.length > 0){
				parent["mcRoad"]["mcAlert"].visible = true;
				x = _lastX;
				y = _lastY;
				_stopDragging(null);
			}else{
				parent["mcRoad"]["mcAlert"].visible = false;
				_lastX = x;
				_lastY = y;
			}
			
		}

	}

}