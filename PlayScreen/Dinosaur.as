package PlayScreen
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;

	public class Dinosaur extends MovieClip
	{

		public function Dinosaur()
		{
			addEventListener(Event.ADDED_TO_STAGE, _init);
		}
		
		private function _init(e:Event):void
		{
			this.gotoAndStop(1);
			addEventListener(MouseEvent.MOUSE_DOWN, _mouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, _mouseUp);
		}
		
		private function _mouseDown(e:MouseEvent):void
		{
			this.startDrag();
			this.gotoAndStop(2);
		}
		
		private function _mouseUp(e:MouseEvent):void
		{
			this.stopDrag();
			this.gotoAndStop(1);
		}
		
		public function dispose():void
		{
			removeEventListener(Event.ADDED_TO_STAGE, _init);
			removeEventListener(MouseEvent.MOUSE_DOWN, _mouseDown);
			stage.removeEventListener(MouseEvent.MOUSE_UP, _mouseUp);
		}
	}

}