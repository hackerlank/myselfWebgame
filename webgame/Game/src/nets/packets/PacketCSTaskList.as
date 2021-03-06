package nets.packets
{
    import flash.utils.ByteArray;
    import engine.support.ISerializable;
    import engine.support.IPacket;
    import engine.net.packet.PacketFactory;
    /** 
    *玩家已接任务列表
    */
    public class PacketCSTaskList implements IPacket
    {
        /**
        *id
        */
        public static const id:int = 6002;
        /** 
        *玩家编号
        */
        public var userid:int;

        public function GetId():int{return id;}
        public function Serialize(ar:ByteArray):void
        {
            ar.writeInt(GetId());
            ar.writeInt(userid);
        }
        public function Deserialize(ar:ByteArray):void
        {
            userid = ar.readInt();
        }
    }
}
