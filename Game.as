﻿package  {
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2World;
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Game extends MovieClip {
		var world:b2World = null;
		
		public static var instance:Game = null;
		public static var dt:Number = 1.0 / 30.0;
		
		public function Game() {
			addEventListener(Event.ADDED_TO_STAGE, Added, false, 0, true);
		}
		
		public function Added(e:Event):void {
			instance = this;
			removeEventListener(Event.ADDED_TO_STAGE, Added, false);
			Init();
		}
		
		public function Init():void {
			world = new b2World(new b2Vec2(0, 5), false);
			addEventListener(Event.ENTER_FRAME, Tick, false, 0, true);
		}
		
		public function Tick(e:Event):void {
			world.Step(dt, 5, 5);
		}
	}
}