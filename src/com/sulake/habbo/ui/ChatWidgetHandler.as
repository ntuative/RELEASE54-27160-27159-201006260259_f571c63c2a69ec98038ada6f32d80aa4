package com.sulake.habbo.ui
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IPetImageListener;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.session.IUserData;
   import com.sulake.habbo.session.events.RoomSessionChatEvent;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetChatUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetChatMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetChatSelectAvatarMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.PointMath;
   import com.sulake.room.utils.RoomGeometry;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   
   public class ChatWidgetHandler implements IRoomWidgetHandler, IPetImageListener, IAvatarImageListener
   {
       
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_897:Number = 0.0;
      
      private var var_523:Point = null;
      
      private var _isDisposed:Boolean = false;
      
      private var var_362:Map = null;
      
      private var var_742:Map = null;
      
      private var var_524:Vector3d;
      
      private var _connection:IConnection = null;
      
      private var var_363:Map = null;
      
      public function ChatWidgetHandler()
      {
         var_524 = new Vector3d();
         super();
         var_363 = new Map();
         var_362 = new Map();
         var_742 = new Map();
      }
      
      public function petImageReady(param1:String) : void
      {
         if(var_362)
         {
            var_362.remove(param1);
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         if(var_363)
         {
            var_363.remove(param1);
         }
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         _container = param1;
      }
      
      public function update() : void
      {
         updateWidgetPosition();
      }
      
      public function getProcessedEvents() : Array
      {
         return [RoomSessionChatEvent.const_152];
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         _isDisposed = true;
         _container = null;
         var_523 = null;
         if(var_363 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_363.length)
            {
               _loc2_ = var_363.getWithIndex(_loc1_) as BitmapData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_363.dispose();
            var_363 = null;
         }
         if(var_362 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_362.length)
            {
               _loc2_ = var_362.getWithIndex(_loc1_) as BitmapData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_362.dispose();
            var_362 = null;
         }
         if(var_742 != null)
         {
            var_742.dispose();
            var_742 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = NaN;
         var _loc7_:* = NaN;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc2_:* = null;
         switch(param1.type)
         {
            case RoomSessionChatEvent.const_152:
               _loc3_ = param1 as RoomSessionChatEvent;
               if(_loc3_ != null)
               {
                  _loc4_ = _container.roomEngine.getRoomObject(_loc3_.session.roomId,_loc3_.session.roomCategory,_loc3_.userId,RoomObjectCategoryEnum.const_33);
                  if(_loc4_ != null)
                  {
                     _loc5_ = _container.roomEngine.getRoomCanvasGeometry(_loc3_.session.roomId,_loc3_.session.roomCategory,_container.getFirstCanvasId());
                     if(_loc5_ != null)
                     {
                        updateWidgetPosition();
                        _loc6_ = 0;
                        _loc7_ = 0;
                        _loc8_ = _loc4_.getLocation();
                        _loc9_ = _loc5_.getScreenPoint(_loc8_);
                        if(_loc9_ != null)
                        {
                           _loc6_ = Number(_loc9_.x);
                           _loc7_ = Number(_loc9_.y);
                        }
                        _loc10_ = _container.roomSession.userDataManager.getUserDataByIndex(_loc3_.userId);
                        _loc11_ = "";
                        _loc12_ = 0;
                        _loc13_ = null;
                        if(_loc10_ != null)
                        {
                           _loc15_ = _loc10_.figure;
                           if(_loc10_.type == RoomObjectTypeEnum.const_216)
                           {
                              _loc13_ = var_362.getValue(_loc15_) as BitmapData;
                           }
                           else
                           {
                              _loc13_ = var_363.getValue(_loc15_) as BitmapData;
                           }
                           _loc12_ = uint(var_742.getValue(_loc15_));
                           if(_loc13_ == null)
                           {
                              if(false)
                              {
                                 switch(_loc10_.type)
                                 {
                                    case RoomObjectTypeEnum.const_216:
                                       _loc16_ = _container.avatarRenderManager.createPetImageFromFigure(_loc15_,AvatarScaleType.SMALL,this);
                                       if(_loc16_ != null)
                                       {
                                          _loc13_ = _loc16_.getCroppedImage(AvatarSetType.const_30);
                                          _loc17_ = _loc16_.getPartColor("pbd");
                                       }
                                       break;
                                    default:
                                       _loc16_ = _container.avatarRenderManager.createAvatarImage(_loc15_,AvatarScaleType.SMALL,null,this);
                                       if(_loc16_ != null)
                                       {
                                          _loc13_ = _loc16_.getCroppedImage(AvatarSetType.const_40);
                                          _loc17_ = _loc16_.getPartColor("ch");
                                       }
                                 }
                                 if(_loc17_ != null)
                                 {
                                    _loc12_ = uint(_loc17_.rgb);
                                 }
                                 if(_loc10_.type == RoomObjectTypeEnum.const_216)
                                 {
                                    if(_loc13_ != null)
                                    {
                                       var_362.add(_loc15_,_loc13_);
                                    }
                                 }
                                 else if(_loc13_ != null)
                                 {
                                    var_363.add(_loc15_,_loc13_);
                                 }
                                 if(_loc12_ != 0)
                                 {
                                    var_742.add(_loc15_,_loc12_);
                                 }
                                 if(_loc16_ != null)
                                 {
                                    _loc16_.dispose();
                                 }
                              }
                           }
                           _loc11_ = _loc10_.name;
                        }
                        _loc14_ = "null";
                        _loc2_ = new RoomWidgetChatUpdateEvent(_loc14_,_loc3_.userId,_loc3_.text,_loc11_,RoomObjectCategoryEnum.const_33,_loc6_,_loc7_,_loc13_,_loc12_,_loc3_.session.roomId,_loc3_.session.roomCategory,_loc3_.chatType);
                     }
                  }
               }
         }
         if(_container != null && false && _loc2_ != null)
         {
            _container.events.dispatchEvent(_loc2_);
         }
      }
      
      public function getWidgetMessages() : Array
      {
         return [RoomWidgetChatMessage.const_712,RoomWidgetChatSelectAvatarMessage.const_743];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         switch(param1.type)
         {
            case RoomWidgetChatMessage.const_712:
               if(_container != null && false)
               {
                  _loc3_ = param1 as RoomWidgetChatMessage;
                  if(_loc3_ != null)
                  {
                     if(_loc3_.text == "")
                     {
                        return null;
                     }
                     _loc4_ = null;
                     _loc5_ = _loc3_.text.split(" ");
                     if(_loc5_.length > 0)
                     {
                        _loc6_ = _loc5_[0];
                        _loc7_ = "";
                        if(_loc5_.length > 1)
                        {
                           _loc7_ = _loc5_[1];
                        }
                        if(_loc6_.charAt(0) == ":" && _loc7_ == "x")
                        {
                           _loc8_ = _container.roomEngine.getSelectedAvatarId();
                           if(_loc8_ > -1)
                           {
                              _loc9_ = _container.roomSession.userDataManager.getUserDataByIndex(_loc8_);
                              if(_loc9_ != null)
                              {
                                 _container.roomSession.sendChatMessage(_loc3_.text.replace(" x"," " + _loc9_.name));
                                 return null;
                              }
                           }
                        }
                        switch(_loc6_.toLowerCase())
                        {
                           case "o/":
                              _container.roomSession.sendWaveMessage();
                              break;
                           case ":sign":
                              _container.roomSession.sendSignMessage(int(_loc7_));
                              return null;
                           case ":v":
                              _loc10_ = new RoomSessionChatEvent(RoomSessionChatEvent.const_152,_container.roomSession,0,"Version 27160-27159-201006260246");
                              processEvent(_loc10_ as Event);
                              return null;
                           case ":chooser":
                              if(_container.sessionDataManager.hasUserRight("fuse_habbo_chooser"))
                              {
                                 _loc4_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.REQUEST_USER_CHOOSER);
                                 _container.processWidgetMessage(_loc4_);
                              }
                              return null;
                           case ":furni":
                              if(_container.sessionDataManager.hasUserRight("fuse_furni_chooser"))
                              {
                                 _loc4_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.REQUEST_FURNI_CHOOSER);
                                 _container.processWidgetMessage(_loc4_);
                              }
                              return null;
                           case ":pickall":
                              _container.sessionDataManager.pickAllFurniture(_container.roomSession.roomId,_container.roomSession.roomCategory);
                              return null;
                           case ":news":
                              if(false)
                              {
                                 ExternalInterface.call("FlashExternalInterface.openHabblet","news");
                              }
                              return null;
                        }
                     }
                     switch(_loc3_.chatType)
                     {
                        case RoomWidgetChatMessage.const_111:
                           _container.roomSession.sendChatMessage(_loc3_.text);
                           break;
                        case RoomWidgetChatMessage.const_109:
                           _container.roomSession.sendShoutMessage(_loc3_.text);
                           break;
                        case RoomWidgetChatMessage.const_132:
                           _container.roomSession.method_8(_loc3_.recipientName,_loc3_.text);
                     }
                  }
               }
               break;
            case RoomWidgetChatSelectAvatarMessage.const_743:
               _loc2_ = param1 as RoomWidgetChatSelectAvatarMessage;
               if(_loc2_ != null)
               {
                  _container.roomEngine.selectAvatar(_loc2_.roomId,_loc2_.roomCategory,_loc2_.objectId,true);
                  _loc11_ = _container.roomSession.userDataManager.getUserDataByIndex(_loc2_.objectId);
                  if(_loc11_ != null)
                  {
                     _container.moderation.userSelected(_loc11_.webID,_loc2_.userName);
                  }
               }
         }
         return null;
      }
      
      private function updateWidgetPosition() : void
      {
         var _loc5_:* = NaN;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(_container == null || true || true || true)
         {
            return;
         }
         var _loc1_:int = _container.getFirstCanvasId();
         var _loc2_:int = _container.roomSession.roomId;
         var _loc3_:int = _container.roomSession.roomCategory;
         var _loc4_:RoomGeometry = _container.roomEngine.getRoomCanvasGeometry(_loc2_,_loc3_,_loc1_) as RoomGeometry;
         if(_loc4_ != null)
         {
            _loc5_ = 1;
            if(var_897 > 0)
            {
               _loc5_ = Number(_loc4_.scale / var_897);
            }
            if(var_523 == null)
            {
               var_524.x = 0;
               var_524.y = 0;
               var_524.z = 0;
               var_523 = _loc4_.getScreenPoint(var_524);
               var_897 = _loc4_.scale - 10;
            }
            _loc6_ = "";
            _loc7_ = null;
            var_524.x = 0;
            var_524.y = 0;
            var_524.z = 0;
            _loc8_ = _loc4_.getScreenPoint(var_524);
            if(_loc8_ != null)
            {
               if(_loc8_.x != var_523.x || _loc8_.y != var_523.y)
               {
                  _loc9_ = PointMath.sub(_loc8_,PointMath.mul(var_523,_loc5_));
                  if(_loc9_.x != 0 || _loc9_.y != 0)
                  {
                     _loc6_ = "null";
                     _loc7_ = new RoomWidgetRoomViewUpdateEvent(_loc6_,null,_loc9_);
                     _container.events.dispatchEvent(_loc7_);
                  }
                  var_523 = _loc8_;
               }
            }
            if(_loc4_.scale != var_897)
            {
               _loc6_ = "null";
               _loc7_ = new RoomWidgetRoomViewUpdateEvent(_loc6_,null,null,_loc4_.scale);
               _container.events.dispatchEvent(_loc7_);
               var_897 = _loc4_.scale;
            }
         }
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_354;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
