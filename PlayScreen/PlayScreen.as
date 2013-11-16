package PlayScreen
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
		public var mcFrubb:MovieClip;
		public var btnToyBox:MovieClip;
		public var mcToyBox:PlayScreen.ToyBox;
		
		private var _toysScreen:ToysScreen;
		private var _toyName:String;
		
		public function PlayScreen()
		{
			mcToyBox.visible = false;
			btnToyBox.buttonMode = true;
			addEventListener(Event.ADDED_TO_STAGE, _init);
		}
		
		private function _init(e:Event):void
		{
			gotoAndStop(1);
			//mcFirefighterCar.addEventListener(MouseEvent.CLICK, _showToysScreen);
			//mcCar.addEventListener(MouseEvent.CLICK, _showToysScreen);
			//mcDinosaur.addEventListener(MouseEvent.CLICK, _showToysScreen);
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
			_toyName = e.currentTarget.name;
			e.currentTarget.startDrag();
		}
		
		private function _mouseUp(e:MouseEvent):void
		{
			stopDrag();
			if (!mcToyBox.visible && mouseX >= mcFrubb.x && mouseX <= mcFrubb.x + mcFrubb.width && mouseY >= mcFrubb.y && mouseY <= mcFrubb.y + mcFrubb.height)
			{
				_showToysScreen(_toyName);
			}
			else if (!mcToyBox.visible && mouseX >= btnToyBox.x && mouseX <= btnToyBox.x + btnToyBox.width && mouseY >= btnToyBox.y && mouseY <= btnToyBox.y + btnToyBox.height)
			{
				_showToyBox(_toyName);
			}
			else if (mcToyBox.visible && mouseX >= mcToyBox.mcOutside.x && mouseX <= mcToyBox.mcOutside.x + mcToyBox.mcOutside.width && mouseY >= mcToyBox.mcOutside.y && mouseY <= mcToyBox.mcOutside.y + mcToyBox.mcOutside.height)
			{
				_hideToyBox(_toyName);
			}
			_toyName = null;
		}
		
		private function _showToyBox(toyName:String)
		{
			if (toyName)
			{
				mcToyBox.addChild(this[toyName]);
				this[toyName].x = 100;
				this[toyName].y = 100;
				setChildIndex(mcToyBox, numChildren - 1);
				mcToyBox.visible = true;
			}
		}
		
		private function _hideToyBox(toyName:String)
		{
			if (toyName)
			{
				addChild(this[toyName]);
				this[toyName].x = 100;
				this[toyName].y = 100;
				mcToyBox.visible = false;
			}
		}
		
		private function _exit(e:MouseEvent):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, _init);
			//mcFirefighterCar.removeEventListener(MouseEvent.CLICK, _showToysScreen);
			//mcCar.removeEventListener(MouseEvent.CLICK, _showToysScreen);
			//mcDinosaur.removeEventListener(MouseEvent.CLICK, _showToysScreen);
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
		
		public function dispose():void
		{
			_exit(null);
		}
		
		private function _showToysScreen(toyName:String):void
		{
			var frame:String = "Dispose";
			if (toyName)
			{
				switch(toyName)
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
			}
			if (_toysScreen) removeChild(_toysScreen);
			stage.removeEventListener(MouseEvent.MOUSE_UP, _mouseUp);
			addChild(_toysScreen = new ToysScreen(frame));
			
			_toysScreen.addEventListener(Event.REMOVED_FROM_STAGE, _onRemoved);
		}
		
		private function _onRemoved(e:Event):void
		{
			_toysScreen = null;
			stage.addEventListener(MouseEvent.MOUSE_UP, _mouseUp);
		}
	}

}