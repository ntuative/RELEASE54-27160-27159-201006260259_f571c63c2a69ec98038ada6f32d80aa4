package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1523:int = 5;
      
      public static const const_1703:int = 113;
      
      public static const const_1647:int = 29;
      
      public static const const_1587:int = 0;
      
      public static const const_1570:int = 102;
      
      public static const const_1558:int = 25;
      
      public static const const_1716:int = 20;
      
      public static const const_1542:int = 116;
      
      public static const const_1680:int = 114;
      
      public static const const_1644:int = 101;
      
      public static const const_1565:int = 108;
      
      public static const const_1507:int = 112;
      
      public static const const_1618:int = 100;
      
      public static const const_1667:int = 24;
      
      public static const const_1248:int = 10;
      
      public static const const_1521:int = 111;
      
      public static const const_1641:int = 23;
      
      public static const const_1505:int = 26;
      
      public static const const_1281:int = 2;
      
      public static const const_1632:int = 22;
      
      public static const const_1492:int = 17;
      
      public static const const_1506:int = 18;
      
      public static const const_1635:int = 3;
      
      public static const const_1593:int = 109;
      
      public static const const_1366:int = 1;
      
      public static const const_1621:int = 103;
      
      public static const const_1563:int = 11;
      
      public static const const_1501:int = 28;
      
      public static const const_1705:int = 104;
      
      public static const const_1540:int = 13;
      
      public static const const_1594:int = 107;
      
      public static const const_1671:int = 27;
      
      public static const const_1715:int = 118;
      
      public static const const_1645:int = 115;
      
      public static const const_1607:int = 16;
      
      public static const const_1600:int = 19;
      
      public static const const_1494:int = 4;
      
      public static const const_1676:int = 105;
      
      public static const const_1646:int = 117;
      
      public static const const_1491:int = 119;
      
      public static const const_1576:int = 106;
      
      public static const const_1524:int = 12;
      
      public static const const_1652:int = 110;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(reason)
         {
            case const_1366:
            case const_1248:
               return "banned";
            case const_1281:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
