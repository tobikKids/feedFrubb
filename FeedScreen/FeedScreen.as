﻿package FeedScreen{	import flash.display.MovieClip;	import flash.display.SimpleButton;	import flash.events.MouseEvent;	import flash.display.*;	import FrubbFeeding;	import flash.events.Event;	import FoodBar;	import fl.transitions.Tween;	import fl.transitions.easing.*;	import flash.geom.Point;	import flash.events.TouchEvent;	import FeedScreen.Protein;	public class FeedScreen extends MovieClip	{		private var foodBar:FoodBar;		public var frubb:FrubbFeeding;				private var proteinBar:Sprite;				 		public function FeedScreen()		{			trace("Feed screen initialized");			this.addEventListener(Event.ADDED_TO_STAGE, init);		}		private function init(e:Event):void		{			frubb = new FrubbFeeding();			frubb.name = "frubb";			addChild(frubb);			trace(frubb + frubb.name);						frubb.x = stage.stageWidth/2;			frubb.y = 300;			frubb.gotoAndPlay("wander");						foodBar = new FoodBar();			addChild(foodBar);			foodBar.y = 0;			var foodTween:Tween = new Tween(foodBar, "x", Elastic.easeInOut, -stage.stageWidth, 0, 1, true);			initFoodButtons();						//stage.addEventListener(MouseEvent.MIDDLE_MOUSE_DOWN		}				private function initFoodButtons():void {			//btnProtein = new BtnProtein();			foodBar.btnProtein.addEventListener(MouseEvent.MOUSE_DOWN, chooseProtein);			foodBar.btnAntioxidant.addEventListener(MouseEvent.MOUSE_DOWN, chooseAntioxidant);			foodBar.btnCarbo.addEventListener(MouseEvent.MOUSE_DOWN, chooseCarbo);			foodBar.btnSugar.addEventListener(MouseEvent.MOUSE_DOWN, chooseSugar);			foodBar.btnFastfood.addEventListener(MouseEvent.MOUSE_DOWN, chooseFastfood);			foodBar.btnFibre.addEventListener(MouseEvent.MOUSE_DOWN, chooseFibre);		}				public function chooseProtein(e:MouseEvent):void 		{			//add protein			var protein:Protein;			if(!protein) {				protein = new Protein(frubb);				addChild(protein);				protein.x = 0;				protein.y = 0;			}		}										public function chooseAntioxidant(e:MouseEvent):void {			trace("Protein selected");		}		public function chooseCarbo(e:MouseEvent):void {			trace("Carbon selected");		}		public function chooseSugar(e:MouseEvent):void {			trace("Sugar selected");		}		public function chooseFastfood(e:MouseEvent):void {			trace("Fastfood selected");		}		public function chooseFibre(e:MouseEvent):void {			trace("Fibre selected");		}				public function dispose() 		{			//Remove Listeners			foodBar.btnProtein.removeEventListener(MouseEvent.MOUSE_DOWN, chooseProtein);			foodBar.btnAntioxidant.removeEventListener(MouseEvent.MOUSE_DOWN, chooseAntioxidant);			foodBar.btnCarbo.removeEventListener(MouseEvent.MOUSE_DOWN, chooseCarbo);			foodBar.btnSugar.removeEventListener(MouseEvent.MOUSE_DOWN, chooseSugar);			foodBar.btnFastfood.removeEventListener(MouseEvent.MOUSE_DOWN, chooseFastfood);			foodBar.btnFibre.removeEventListener(MouseEvent.MOUSE_DOWN, chooseFibre);						//Let GC clean global variables			foodBar = null;			frubb = null;		}	}}