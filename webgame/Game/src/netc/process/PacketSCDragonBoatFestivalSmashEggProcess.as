package netc.process
{
	import flash.utils.getQualifiedClassName;
	import engine.net.process.PacketBaseProcess;
	import engine.support.IPacket;
	import netc.packets2.PacketSCDragonBoatFestivalSmashEgg2;

	public class PacketSCDragonBoatFestivalSmashEggProcess extends PacketBaseProcess
	{
		public function PacketSCDragonBoatFestivalSmashEggProcess()
		{
			super();
		}

		override public function process(pack:IPacket):IPacket
		{
			var p:PacketSCDragonBoatFestivalSmashEgg2=pack as PacketSCDragonBoatFestivalSmashEgg2;
			if (null == p)
			{
				throw new Error("can not canver pack for " + getQualifiedClassName(pack));
			}
			return p;
		}
	}
}