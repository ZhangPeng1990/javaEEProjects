package tushu.service;

import java.lang.management.ManagementFactory;

import javax.management.MBeanServer;
import javax.management.ObjectName;

import tushu.service.JmxSysConfig;


public class Agent {

	public void startAgent() throws Exception {
		System.out.println("开始代理...");
		
		MBeanServer mbs = ManagementFactory.getPlatformMBeanServer();
		
		ObjectName name = new ObjectName("tushu.produc.service.impl:type=JmxSysConfig");
		
		// Create the Hello World MBean  
		JmxSysConfig mbean = new JmxSysConfig();  
	  
	    // Register the Hello World MBean  
	    mbs.registerMBean(mbean, name);  
	  
	    // Wait forever  
	    System.out.println("Waiting forever...");  
	    Thread.sleep(Long.MAX_VALUE); 
	}
	
	public static void main(String[] args) throws Exception {
		System.out.println("开始代理...");
		
		MBeanServer mbs = ManagementFactory.getPlatformMBeanServer();
		
		ObjectName name = new ObjectName("tushu.service:type=JmxSysConfig");
		
		// Create the Hello World MBean  
		JmxSysConfig mbean = new JmxSysConfig();  
	  
	    // Register the Hello World MBean  
	    mbs.registerMBean(mbean, name);  
	  
	    // Wait forever  
	    System.out.println("Waiting forever...");  
	    Thread.sleep(Long.MAX_VALUE); 
	}
}
