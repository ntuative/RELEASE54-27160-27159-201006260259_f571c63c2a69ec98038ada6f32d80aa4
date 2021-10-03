package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_806:int = 2;
      
      private static const const_1132:Array = [0,0,0];
       
      
      private var var_764:int = 0;
      
      private var var_421:String;
      
      private var var_2165:int = 0;
      
      private const const_1470:int = 1;
      
      private var var_441:String = "";
      
      private var var_783:int = 0;
      
      private var var_1388:int = 0;
      
      private var var_2045:Boolean = false;
      
      private var var_429:Boolean;
      
      private const const_1130:int = 3;
      
      private var var_1120:int = 0;
      
      private var _effectType:int = 0;
      
      private var var_67:IAvatarImage = null;
      
      private var var_1607:String = "";
      
      private var var_2059:Boolean = false;
      
      private var var_489:Boolean = false;
      
      private var var_2093:Boolean = false;
      
      private var var_784:int = 0;
      
      private var _isDisposed:Boolean;
      
      private const const_1744:int = 3;
      
      private var var_1446:int = -1;
      
      private var var_1608:int = -1;
      
      private var var_1361:Boolean = false;
      
      private var var_2470:Array;
      
      private const const_1131:int = 0;
      
      private var var_1605:int = -1;
      
      private var var_1643:int = -1;
      
      private var var_1121:int = 0;
      
      private var var_1606:int = 0;
      
      private var var_620:String;
      
      private var var_937:Boolean = false;
      
      private var var_1360:Boolean = false;
      
      private var var_548:BitmapDataAsset;
      
      private const const_1469:int = 2;
      
      private var _visualizationData:AvatarVisualizationData = null;
      
      private var var_325:BitmapDataAsset;
      
      private var var_547:Map;
      
      public function AvatarVisualization()
      {
         var_2470 = new Array();
         super();
         var_547 = new Map();
         var_429 = false;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         _visualizationData = param1 as AvatarVisualizationData;
         createSprites(const_1130);
         return true;
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            var_1360 = false;
         }
         if(var_441 == "sit" || var_441 == "lay")
         {
            var_1120 = param1 / 2;
         }
         else
         {
            var_1120 = 0;
         }
         var_1361 = false;
         var_937 = false;
         if(var_441 == "lay")
         {
            var_937 = true;
            _loc2_ = int(var_1607);
            if(_loc2_ < 0)
            {
               var_1361 = true;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         if(param1.getUpdateID() != var_170)
         {
            var_2093 = param1.getNumber(RoomObjectVariableEnum.const_220) > 0;
            var_2059 = param1.getNumber(RoomObjectVariableEnum.const_203) > 0;
            var_2045 = param1.getNumber(RoomObjectVariableEnum.const_428) > 0;
            var_1360 = param1.getNumber(RoomObjectVariableEnum.const_607) > 0;
            var_489 = param1.getNumber(RoomObjectVariableEnum.const_1028) > 0;
            var_1388 = param1.getNumber(RoomObjectVariableEnum.const_265);
            var_441 = param1.getString(RoomObjectVariableEnum.const_460);
            var_1607 = param1.getString(RoomObjectVariableEnum.const_600);
            var_1606 = param1.getNumber(RoomObjectVariableEnum.const_1001);
            _effectType = param1.getNumber(RoomObjectVariableEnum.const_445);
            var_1121 = param1.getNumber(RoomObjectVariableEnum.const_435);
            var_764 = param1.getNumber(RoomObjectVariableEnum.const_359);
            var_1643 = param1.getNumber(RoomObjectVariableEnum.const_319);
            if(var_1121 > 0 && param1.getNumber(RoomObjectVariableEnum.const_359) > 0)
            {
               var_764 = var_1121;
            }
            else
            {
               var_764 = 0;
            }
            validateActions(param2);
            var_620 = param1.getString(RoomObjectVariableEnum.const_833);
            _loc3_ = param1.getString(RoomObjectVariableEnum.const_160);
            updateFigure(_loc3_);
            var_170 = param1.getUpdateID();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in var_547)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         var_547.reset();
         var_67 = null;
         _loc2_ = getSprite(const_1131);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
         }
      }
      
      private function updateFigure(param1:String) : void
      {
         if(var_421 != param1)
         {
            var_421 = param1;
            resetImages();
         }
      }
      
      override public function dispose() : void
      {
         if(var_547 != null)
         {
            resetImages();
            var_547.dispose();
            var_547 = null;
         }
         _visualizationData = null;
         var_325 = null;
         var_548 = null;
         super.dispose();
         _isDisposed = true;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(const_1470);
         var_325 = null;
         if(var_441 == "mv" || var_441 == "std")
         {
            _loc2_.visible = true;
            if(var_325 == null || param1 != var_153)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               if(param1 < 48)
               {
                  var_325 = var_67.getAsset("sh_std_sd_1_0_0");
                  _loc3_ = -8;
                  _loc4_ = -3;
               }
               else
               {
                  var_325 = var_67.getAsset("h_std_sd_1_0_0");
                  _loc3_ = -17;
                  _loc4_ = -7;
               }
               if(var_325 != null)
               {
                  _loc2_.asset = var_325.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            var_325 = null;
            _loc2_.visible = false;
         }
      }
      
      private function getAvatarImage(param1:Number) : IAvatarImage
      {
         var _loc2_:String = "avatarImage" + param1.toString();
         var _loc3_:IAvatarImage = var_547.getValue(_loc2_) as IAvatarImage;
         if(_loc3_ == null)
         {
            _loc3_ = _visualizationData.getAvatar(var_421,param1,var_620,this);
            if(_loc3_ != null)
            {
               var_547.add(_loc2_,_loc3_);
            }
         }
         return _loc3_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         resetImages();
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var_548 = null;
         var _loc2_:IRoomObjectSprite = getSprite(const_1469);
         if(var_489)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               var_548 = _visualizationData.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               var_548 = _visualizationData.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(var_441 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(var_441 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(var_548 != null)
            {
               _loc2_.asset = var_548.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:* = null;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:* = null;
         var _loc27_:* = null;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(_visualizationData == null)
         {
            return;
         }
         var _loc4_:IRoomObjectModel = _loc3_.getModel();
         var _loc5_:Number = param1.scale;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = updateModel(_loc4_,_loc5_);
         if(_loc9_ || _loc5_ != var_153 || var_67 == null)
         {
            if(_loc5_ != var_153)
            {
               _loc7_ = true;
               validateActions(_loc5_);
            }
            if(_loc7_ || var_67 == null)
            {
               var_67 = getAvatarImage(_loc5_);
               _loc6_ = true;
            }
            if(var_67 == null)
            {
               return;
            }
            updateShadow(_loc5_);
            updateTypingBubble(_loc5_);
            _loc8_ = updateObject(_loc3_,param1,true);
            updateActions(var_67);
            var_153 = _loc5_;
         }
         else
         {
            _loc8_ = updateObject(_loc3_,param1);
         }
         var _loc10_:Boolean = _loc8_ || _loc9_ || _loc7_;
         var _loc11_:Boolean = var_429 || var_784 > 0;
         if(_loc10_)
         {
            var_784 = const_806;
         }
         if(_loc10_ || _loc11_)
         {
            increaseUpdateId();
            --var_784;
            --var_783;
            if(!(var_783 <= 0 || _loc7_ || _loc9_ || _loc6_))
            {
               return;
            }
            var_67.updateAnimationByFrames(1);
            var_783 = const_806;
            _loc13_ = var_67.getCanvasOffsets();
            if(_loc13_ == null || _loc13_.length < 3)
            {
               _loc13_ = const_1132;
            }
            _loc12_ = getSprite(const_1131);
            if(_loc12_ != null)
            {
               _loc16_ = var_67.getImage(AvatarSetType.const_30,false);
               if(_loc16_ != null)
               {
                  _loc12_.asset = _loc16_;
               }
               if(_loc12_.asset)
               {
                  _loc12_.offsetX = -1 * _loc5_ / 2 + _loc13_[0];
                  _loc12_.offsetY = -_loc12_.asset.height + _loc5_ / 4 + _loc13_[1] + var_1120;
               }
               if(var_937)
               {
                  if(var_1361)
                  {
                     _loc12_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc12_.relativeDepth = -0.409 + _loc13_[2];
                  }
               }
               else
               {
                  _loc12_.relativeDepth = -0.01 + _loc13_[2];
               }
            }
            _loc12_ = getSprite(const_1469);
            if(_loc12_ != null && _loc12_.visible)
            {
               if(!var_937)
               {
                  _loc12_.relativeDepth = -0.02 + _loc13_[2];
               }
               else
               {
                  _loc12_.relativeDepth = -0.44 + _loc13_[2];
               }
            }
            var_429 = var_67.isAnimating();
            _loc14_ = const_1130;
            for each(_loc15_ in var_67.getSprites())
            {
               if(_loc15_.id == "avatar")
               {
                  _loc12_ = getSprite(const_1131);
                  _loc17_ = var_67.getLayerData(_loc15_);
                  _loc18_ = _loc15_.getDirectionOffsetX(var_67.getDirection());
                  _loc19_ = _loc15_.getDirectionOffsetY(var_67.getDirection());
                  if(_loc17_ != null)
                  {
                     _loc18_ += _loc17_.dx;
                     _loc19_ += _loc17_.dy;
                  }
                  if(_loc5_ < 48)
                  {
                     _loc18_ /= 2;
                     _loc19_ /= 2;
                  }
                  _loc12_.offsetX += _loc18_;
                  _loc12_.offsetY += _loc19_;
               }
               else
               {
                  _loc12_ = getSprite(_loc14_);
                  if(_loc12_ != null)
                  {
                     _loc12_.visible = true;
                     _loc20_ = var_67.getLayerData(_loc15_);
                     _loc21_ = 0;
                     _loc22_ = _loc15_.getDirectionOffsetX(var_67.getDirection());
                     _loc23_ = _loc15_.getDirectionOffsetY(var_67.getDirection());
                     _loc24_ = _loc15_.getDirectionOffsetZ(var_67.getDirection());
                     _loc25_ = 0;
                     if(_loc15_.hasDirections)
                     {
                        _loc25_ = var_67.getDirection();
                     }
                     if(_loc20_ != null)
                     {
                        _loc21_ = _loc20_.animationFrame;
                        _loc22_ += _loc20_.dx;
                        _loc23_ += _loc20_.dy;
                        _loc25_ += _loc20_.directionOffset;
                     }
                     if(_loc5_ < 48)
                     {
                        _loc22_ /= 2;
                        _loc23_ /= 2;
                     }
                     if(_loc25_ < 0)
                     {
                        _loc25_ += 8;
                     }
                     else if(_loc25_ > 7)
                     {
                        _loc25_ -= 8;
                     }
                     _loc26_ = var_67.getScale() + "_" + _loc15_.member + "_" + _loc25_ + "_" + _loc21_;
                     _loc27_ = var_67.getAsset(_loc26_);
                     if(_loc27_ == null)
                     {
                        continue;
                     }
                     _loc12_.asset = _loc27_.content as BitmapData;
                     _loc12_.offsetX = -_loc27_.offset.x - _loc5_ / 2 + _loc22_;
                     _loc12_.offsetY = -_loc27_.offset.y + _loc23_ + var_1120;
                     if(var_937)
                     {
                        _loc12_.relativeDepth = -0.409 - 0.1 * spriteCount * _loc24_;
                     }
                     else
                     {
                        _loc12_.relativeDepth = -0.01 - 0.1 * spriteCount * _loc24_;
                     }
                     if(_loc15_.ink == 33)
                     {
                        _loc12_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc12_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc14_++;
               }
            }
         }
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean = false) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param3 || var_304 != param1.getUpdateID() || var_1446 != param2.updateId)
         {
            _loc4_ = param1.getDirection().x - param2.direction.x;
            _loc4_ = (_loc4_ % 360 + 360) % 360;
            _loc5_ = var_1643;
            if(var_441 == "float")
            {
               _loc5_ = _loc4_;
            }
            else
            {
               _loc5_ -= param2.direction.x;
            }
            _loc5_ = (_loc5_ % 360 + 360) % 360;
            if(_loc4_ != var_1605 || param3)
            {
               var_1605 = _loc4_;
               _loc4_ -= 112.5;
               _loc4_ = (_loc4_ + 360) % 360;
               var_67.setDirectionAngle(AvatarSetType.const_30,_loc4_);
            }
            if(_loc5_ != var_1608 || param3)
            {
               var_1608 = _loc5_;
               if(var_1608 != var_1605)
               {
                  _loc5_ -= 112.5;
                  _loc5_ = (_loc5_ + 360) % 360;
                  var_67.setDirectionAngle(AvatarSetType.const_40,_loc5_);
               }
            }
            var_304 = param1.getUpdateID();
            var_1446 = param2.updateId;
            return true;
         }
         return false;
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_437,var_441,var_1607);
         if(var_1388 > 0)
         {
            param1.appendAction(AvatarAction.const_266,AvatarAction.const_1318[var_1388]);
         }
         if(var_1606 > 0)
         {
            param1.appendAction(AvatarAction.const_947,var_1606);
         }
         if(var_2165 > 0)
         {
            param1.appendAction(AvatarAction.const_875,var_2165);
         }
         if(var_1121 > 0)
         {
            param1.appendAction(AvatarAction.const_873,var_1121);
         }
         if(var_764 > 0)
         {
            param1.appendAction(AvatarAction.const_920,var_764);
         }
         if(var_2093)
         {
            param1.appendAction(AvatarAction.const_290);
         }
         if(var_2045 || var_1360)
         {
            param1.appendAction(AvatarAction.const_502);
         }
         if(var_2059)
         {
            param1.appendAction(AvatarAction.const_251);
         }
         if(_effectType > 0)
         {
            param1.appendAction(AvatarAction.const_377,_effectType);
         }
         param1.endActionAppends();
         var_429 = param1.isAnimating();
         var _loc2_:int = const_1130;
         for each(_loc3_ in var_67.getSprites())
         {
            if(_loc3_.id != "avatarImage")
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
   }
}
