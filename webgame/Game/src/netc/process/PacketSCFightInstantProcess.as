/**
 * 该类名为Process，即处理类
 * 该类不可以有变量，函数为处理数据，加工，存储等并返回结果
 * 可保存数据至DataCenter中
 * 
 */ 
package netc.process
{
	import common.config.xmlres.XmlManager;
	import common.config.xmlres.server.Pub_SkillResModel;
	
	import engine.net.process.PacketBaseProcess;
	import engine.support.IPacket;
	
	import flash.utils.getQualifiedClassName;
	
	import netc.Data;
	import netc.packets2.PacketSCFightInstant2;
	
	public class PacketSCFightInstantProcess extends PacketBaseProcess
	{
		public function PacketSCFightInstantProcess()
		{
			super();
		}
		
		override public function process(pack:IPacket):IPacket
		{			
			//step 1
			var p:PacketSCFightInstant2 = pack as PacketSCFightInstant2;			
			
			if(null == p)
			{
				throw new Error("can not canver pack for " + getQualifiedClassName(pack));
			}
			//step 2
			p.skillInfo =XmlManager.localres.getSkillXml.getResPath(p.skill) as Pub_SkillResModel;
						
			//空闲清零
			if(null != Data.myKing.king)
			{
				if(p.srcid == Data.myKing.king.objid)
				{
					Data.idleTime.syncByClearIdleXiuLian();
					Data.idleTime.syncByClearIdleNewGuest();
				}
			}
			
			
			return p;
		}
		
		
		
		
		
		
		
		
	}
}