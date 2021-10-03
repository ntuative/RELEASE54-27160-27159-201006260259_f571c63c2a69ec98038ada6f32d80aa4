package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_651:String = "RWUAM_RESPECT_USER";
      
      public static const const_704:String = "RWUAM_GIVE_RIGHTS";
      
      public static const include:String = "RWUAM_START_TRADING";
      
      public static const const_721:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_628:String = "RWUAM_WHISPER_USER";
      
      public static const const_706:String = "RWUAM_IGNORE_USER";
      
      public static const const_427:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_699:String = "RWUAM_BAN_USER";
      
      public static const const_662:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_489:String = "RWUAM_KICK_USER";
      
      public static const const_564:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_539:String = " RWUAM_RESPECT_PET";
      
      public static const const_500:String = "RWUAM_KICK_BOT";
      
      public static const const_1431:String = "RWUAM_TRAIN_PET";
      
      public static const const_535:String = "RWUAM_PICKUP_PET";
      
      public static const const_762:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_527:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
