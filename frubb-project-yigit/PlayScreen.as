package 
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.SimpleButton;
	import flash.events.Event;

	public class PlayScreen extends MovieClip
	{
		public var mcFirefighterCar:Sprite;
		public var mcCar:Sprite;
		public var mcDinosaur:Sprite;
		public var btnExit:SimpleButton;
		
		private var _toysScreen:ToysScreen;
		
		public function PlayScreen()
		{
			addEventListener(Event.ADDED_TO_STAGE, _init);
		}
		
		private function _init(e:Event):void
		{
			gotoAndStop(1);
			mcFirefighterCar.addEventListener(MouseEvent.CLICK, _showToysScreen);
			mcCar.addEventListener(MouseEvent.CLICK, _showToysScreen);
			mcDinosaur.addEventListener(MouseEvent.CLICK, _showToysScreen);
			mcFirefighterCar.addEventListener(MouseEvent.MOUSE_DOWN, _startDrag);
			mcCar.addEventListener(MouseEvent.MOUSE_DOWN, _startDrag);
			mcDinosaur.addEventListener(MouseEvent.MOUSE_DOWN, _startDrag);
			stage.addEventListener(MouseEvent.MOUSE_UP, _mouseUp);
			mcFirefighterCar.buttonMode = true;
			mcCar.buttonMode = true;
			mcDinosaur.buttonMode = true;
			btnExit.addEventListener(MouseEvent.CLICK, _exit);
			removeEventListener(Event.ADDED_TO_STAGE, _init);
		}
		
		private function _startDrag(e:MouseEvent):void
		{
			e.currentTarget.startDrag();
		}
		
		private function _mouseUp(e:MouseEvent):void
		{
			stopDrag();
		}
		
		private function _exit(e:MouseEvent):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, _init);
			mcFirefighterCar.removeEventListener(MouseEvent.CLICK, _showToysScreen);
			mcCar.removeEventListener(MouseEvent.CLICK, _showToysScreen);
			mcDinosaur.removeEventListener(MouseEvent.CLICK, _showToysScreen);
			mcFirefighterCar.removeEventListener(MouseEvent.MOUSE_DOWN, _startDrag);
			mcCar.removeEventListener(MouseEvent.MOUSE_DOWN, _startDrag);
			mcDinosaur.removeEventListener(MouseEvent.MOUSE_DOWN, _startDrag);
			btnExit.removeEventListener(MouseEvent.CLICK, _exit);
			stage.removeEventListener(MouseEvent.MOUSE_UP, _mouseUp);
			if(_toysScreen)
			{
				_toysScreen.dispose();
				removeChild(_toysScreen);
			}
			gotoAndStop("Dispose");
		}
		
		private function _showToysScreen(e:MouseEvent):void
		{
			var frame:String = "Dispose";
			switch(e.currentTarget.name)
			{
				case "mcFirefighterCar":
					frame = "Firefighter Car";
					break;
				case "mcCar":
					frame = "Car";
					break;
				case "mcDinosaur":
					frame = "Dinosaur";
					break;
			}
			if(_toysScreen) removeChild(_toysScreen);
			addChild(_toysScreen = new ToysScreen(frame));
		}
	}

}