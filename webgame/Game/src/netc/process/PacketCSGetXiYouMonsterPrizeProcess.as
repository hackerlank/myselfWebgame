package netc.process
{
	import flash.utils.getQualifiedClassName;
	import engine.net.process.PacketBaseProcess;
	import engine.support.IPacket;
	import netc.packets2.PacketCSGetXiYouMonsterPrize2;

	public class PacketCSGetXiYouMonsterPrizeProcess extends PacketBaseProcess
	{
		public function PacketCSGetXiYouMonsterPrizeProcess()
		{
			super();
		}

		override public function process(pack:IPacket):IPacket
		{
			var p:PacketCSGetXiYouMonsterPrize2=pack as PacketCSGetXiYouMonsterPrize2;
			if (null == p)
			{
				throw new Error("can not canver pack for " + getQualifiedClassName(pack));
			}
			return p;
		}
	}
}