﻿package  {
	import Box2D.Collision.Shapes.b2EdgeShape;
	import flash.display.MovieClip;
	import Box2D.Collision.b2Bound;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2Fixture;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2Body;
	import flash.events.Event;
	
	public class RopeSegment extends MovieClip {
		var body:b2Body = null;
		var ex:Number = 0;
		var ey:Number = 0;
		var used:Boolean = false; // for Rope.as
		
		public function RopeSegment() {
			
		}
		
		public function Init(_static:Boolean):void {			
			var bodyDef:b2BodyDef = new b2BodyDef;
			bodyDef.position = new b2Vec2(x * Game.ToBox, y * Game.ToBox);
			bodyDef.linearDamping = 0.0;
			bodyDef.angularDamping = 0.0;
			if (_static) {
				bodyDef.type = b2Body.b2_staticBody;
			}
			else {
				bodyDef.type = b2Body.b2_dynamicBody;
			}
			body = Game.instance.world.CreateBody(bodyDef);
			body.SetUserData(this);
			
			//var circleShape:b2CircleShape = new b2CircleShape(width * 0.5 * Game.ToBox);
			//var edgeShape:b2EdgeShape = new b2EdgeShape(new b2Vec2( -width * 0.5 * Game.ToBox, 0), new b2Vec2(width * 0.5 * Game.ToBox, 0));
			var polygonShape:b2PolygonShape = new b2PolygonShape;
			ex = width * 0.5;
			ey = height * 0.5;
			polygonShape.SetAsBox(ex * Game.ToBox, ey * Game.ToBox);
			
			var fixtureDef:b2FixtureDef = new b2FixtureDef;
			fixtureDef.shape = polygonShape;
			fixtureDef.density = 1;
			fixtureDef.restitution = 0.5;
			fixtureDef.friction = 0.5;
			fixtureDef.filter.groupIndex = -1; // rope segments never collide with each other
			var fixture:b2Fixture = body.CreateFixture(fixtureDef);
			
			addEventListener(Event.ENTER_FRAME, Tick, false, 0, true);
		}
		
		public function Tick(e:Event):void {
			x = body.GetPosition().x * Game.ToFlash;
			y = body.GetPosition().y * Game.ToFlash;
			rotation = Misc.ToDegrees(body.GetAngle());
		}
	}
}












