package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;

	public class SleepScreen extends MovieClip
	{
		public var btnSleep:SimpleButton;
		public var mcDayNNight:MovieClip;
		public var btnExit:SimpleButton;
		
		public function SleepScreen()
		{
			addEventListener(Event.ADDED_TO_STAGE, _init);
		}
		
		private function _exit(e:MouseEvent):void
		{
			dispose();
		}
		
		private function _init(e:Event):void
		{
			gotoAndStop(1);
			btnSleep.addEventListener(MouseEvent.CLICK, _playSleepAnimation);
			btnExit.addEventListener(MouseEvent.CLICK, _exit);
			removeEventListener(Event.ADDED_TO_STAGE, _init);
		}
		
		private function _playSleepAnimation(e:MouseEvent):void
		{
			btnSleep.removeEventListener(MouseEvent.CLICK, _playSleepAnimation);
			btnSleep.visible = false;
			mcDayNNight.gotoAndPlay(2);
			mcDayNNight.addEventListener(Event.ENTER_FRAME, _enterFrame);
		}
		
		private function _enterFrame(e:Event):void
		{
			if(mcDayNNight.currentFrame == mcDayNNight.totalFrames)
			{
				mcDayNNight.removeEventListener(Event.ENTER_FRAME, _enterFrame);
				mcDayNNight.stop();
			}
		}
		
		public function dispose():void
		{
			btnSleep.removeEventListener(MouseEvent.CLICK, _playSleepAnimation);
			btnExit.removeEventListener(MouseEvent.CLICK, _exit);
			mcDayNNight.removeEventListener(Event.ENTER_FRAME, _enterFrame);
			removeEventListener(Event.ADDED_TO_STAGE, _init);
			gotoAndStop("Dispose");
		}
	}

}