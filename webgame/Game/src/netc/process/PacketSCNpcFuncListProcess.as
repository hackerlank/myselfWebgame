/**
 * 该类名为Process，即处理类
 * 该类不可以有变量，函数为处理数据，加工，存储等并返回结果
 * 可保存数据至DataCenter中
 * 
 */ 
package netc.process
{
	import flash.utils.getQualifiedClassName;
	
	import netc.Data;
	import engine.net.process.PacketBaseProcess;
	
	import engine.support.IPacket;
	import netc.packets2.PacketSCNpcFuncList2;
	
	public class PacketSCNpcFuncListProcess extends PacketBaseProcess
	{
		public function PacketSCNpcFuncListProcess()
		{
			super();
		}
		
		override public function process(pack:IPacket):IPacket
		{
			
			
			//step 1
			var p:PacketSCNpcFuncList2 = pack as PacketSCNpcFuncList2;			
			
			if(null == p)
			{
				throw new Error("can not canver pack for " + getQualifiedClassName(pack));
			}
			//缓存好友数据
			//DataCenter.packZone.put(p.GetId(),p);
			return p;
		}
		
		
	}
}