package nets.packets
{
    import flash.utils.ByteArray;
    import engine.support.ISerializable;
    import engine.support.IPacket;
    import engine.net.packet.PacketFactory;
    /** 
    *队伍成员状态
    */
    public class PacketWSTeamMemberState implements IPacket
    {
        /**
        *id
        */
        public static const id:int = 18013;
        /** 
        *角色ID
        */
        public var roleid:int;
        /** 
        *在线状态
        */
        public var online:int;

        public function GetId():int{return id;}
        public function Serialize(ar:ByteArray):void
        {
            ar.writeInt(GetId());
            ar.writeInt(roleid);
            ar.writeInt(online);
        }
        public function Deserialize(ar:ByteArray):void
        {
            roleid = ar.readInt();
            online = ar.readInt();
        }
    }
}
