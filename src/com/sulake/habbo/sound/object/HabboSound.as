package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_1172:SoundChannel = null;
      
      private var var_980:Boolean;
      
      private var var_1171:Sound = null;
      
      private var var_777:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_1171 = param1;
         var_1171.addEventListener(Event.COMPLETE,onComplete);
         var_777 = 1;
         var_980 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_980;
      }
      
      public function stop() : Boolean
      {
         var_1172.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_980 = false;
         var_1172 = var_1171.play(0);
         this.volume = var_777;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_777;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_1172.position;
      }
      
      public function get length() : Number
      {
         return var_1171.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_777 = param1;
         if(var_1172 != null)
         {
            var_1172.soundTransform = new SoundTransform(var_777);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_980 = true;
      }
   }
}
