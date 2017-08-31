package opctest;

import javafish.clients.opc.JOpc;
import javafish.clients.opc.exception.CoInitializeException;

/**
 * 测试opc的连接情况
 * 打包： ant方式带lib ,太爽了
 * 运行1：eclipse中邮件运行
 * 运行2：cmd运行jar包：   java -jar OpcConnect.jar
 * 
参考：bat运行jar包：
http://raindrop.iteye.com/blog/423436
http://lihengzkj.iteye.com/blog/1183809

 * @author malitao
 *
 */
public class OpcConnect {
	// opcServer 地址
	private static String ipAddress = "127.0.0.1";
//	private static String ipAddress = "172.1.14.82";//本机局域网地址 127.0.0.1
	//private static String ipAddress = "192.168.0.10";//四川现场的内网
//	private static String ipAddress = "172.16.14.99";//北京公司的局域网的opc放到d盘
	// opcServer 名称
	private static String opcName = "AIM.OPC.1";
	// 客户端名称
	private static String clientName = "INS_JOPC";
//	private String	hostName	= "HWS001";	// 主机名称 
	private static JOpc jopc = null;
	public static void main(String[] args) {
		System.out.println("输出连接信息！");
		/**
		 * 不用关注具体细节，此为一直使用的连接程序
		 * 注释的代码是采集程序的基本逻辑
		 * 详细的参见： collectioner 中的CollectTrendDBTask类
		 * 
		 */
		try {
			JOpc.coInitialize();
		} catch (CoInitializeException e1) {
			e1.printStackTrace();
		}
		
		// 加锁对象
		Object sysObject = new Object();
		jopc = new JOpc(ipAddress, opcName, clientName);
//		OpcGroup group = new OpcGroup(groupName, true, period, 0.00f);
//		OpcItem item = new OpcItem(sb.toString(), true, "");
//		group.addItem(item);
//		jopc.addGroup(group);
		// 是否连接
		boolean isConnected = false;
		// 连接服务器,直到连接成功
		do {
			try {
				jopc.connect();
				isConnected = jopc.ping();
				System.out.println("连接状态：" + (isConnected?"成功!":"失败重连!")) ;break;
			} catch (Exception e2) {
				isConnected = false;
				System.out.println("失败重连!先睡2秒");
				// 等待重连
				try {synchronized (sysObject) {sysObject.wait(2000);}} catch (Exception e) {}
			}
		} while (!isConnected);

		// 首先移除
		// jopc.unregisterGroups();
//		jopc.registerGroups();
//		OpcGroup downGroup = jopc.getDownloadGroup();
//		logger.debug("开始同步数据 [" + groupName + "] 测点数:" + group.getItemCount());
//		OpcGroup responseGroup = jopc.synchReadGroup(group);
//		List<OpcItem> list = responseGroup.getItems();
//		p.settName(getName(it.getItemName()));
//		p.settValue(getValues(it.getValue()));

	}
}
