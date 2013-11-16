package 
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;

	public class ToysScreen extends MovieClip
	{
		public var btnExit:SimpleButton;
		public var mcCar:ToyCar;
		public var mcFirefighterCar:ToyCar;
		public var mcDinosaur:Dinosaur;

		public function ToysScreen(frame:String = null)
		{
			gotoAndStop(frame ? frame : 1);
			btnExit.addEventListener(MouseEvent.CLICK, _exit);
		}
		
		private function _exit(e:MouseEvent):void
		{
			dispose();
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