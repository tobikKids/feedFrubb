package PlayScreen
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class ToysScreen extends MovieClip
	{
		public var btnExit:SimpleButton;
		public var mcCar:ToyCar;
		public var mcFirefighterCar:ToyCar;
		public var mcDinosaur:Dinosaur;
		
		private var _frame:String;

		public function ToysScreen(frame:String = null)
		{
			_frame = frame;
			if (stage) _init(); else addEventListener(Event.ADDED_TO_STAGE, _init);
		}
		
		private function _init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, _init);
			gotoAndStop(_frame ? _frame : 1);
			btnExit.addEventListener(MouseEvent.CLICK, _exit);
		}
		
		private function _exit(e:MouseEvent):void
		{
			dispose();
			if (parent.contains(this))
			{
				parent.removeChild(this);
			}
		}
		
		public function dispose():void
		{
			if(btnExit) btnExit.removeEventListener(MouseEvent.CLICK, _exit);
			if(mcCar) mcCar.dispose();
			if(mcFirefighterCar) mcFirefighterCar.dispose();
			if(mcDinosaur) mcDinosaur.dispose();
			gotoAndStop("Dispose");
		}
	}

}